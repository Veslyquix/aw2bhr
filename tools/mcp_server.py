#!/usr/bin/env python3
"""MCP server exposing the aw2bhr decomp corpus to Claude Code subagents.

Subagents doing matching work need to ask the same handful of questions over and
over: what should I work on next, what does this function's assembly look like,
who calls it, what globals does it touch. Shelling out to the CLI tools and
parsing stdout for each of those is friction that multiplies across a fleet, so
they are exposed here as typed tools instead.

Every result is capped and compact on purpose -- a subagent's context is the
scarce resource, so tools return the smallest thing that answers the question
and say explicitly when output was truncated.

Run directly for stdio transport:
    python tools/mcp_server.py
"""

import json
import os
import re
import subprocess
import sys
from typing import Any

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

import awlib  # noqa: E402
from mcp.server.fastmcp import FastMCP  # noqa: E402

mcp = FastMCP("aw2bhr-decomp")

FUNCTIONS_JSON = os.path.join(awlib.DATA_DIR, "functions.json")
CALLGRAPH_JSON = os.path.join(awlib.DATA_DIR, "callgraph.json")
FE_MATCHES_JSON = os.path.join(awlib.DATA_DIR, "fe_matches.json")
MAX_ASM_LINES = 400

_cache: dict[str, Any] = {}


def _load_json(path, key):
    """Cache by mtime so a reindex is picked up without a server restart."""
    if not os.path.exists(path):
        return None
    stamp = os.path.getmtime(path)
    hit = _cache.get(key)
    if hit and hit[0] == stamp:
        return hit[1]
    with open(path, encoding="utf-8") as fh:
        data = json.load(fh)
    _cache[key] = (stamp, data)
    return data


def _functions():
    return _load_json(FUNCTIONS_JSON, "functions")


def _callgraph():
    return _load_json(CALLGRAPH_JSON, "callgraph")


def _fe_names():
    """our sub_XXXXXXXX -> the Fire Emblem decomp name it shape-matches.

    Rebuilt from the cached document rather than cached itself, so a rerun of
    fe_signatures.py is picked up by the same mtime check as everything else.
    """
    data = _load_json(FE_MATCHES_JSON, "fe")
    if data is None:
        return {}
    return {h["name"]: h["fe_name"] for h in data["matches"]}


def _asm_index():
    """name -> Function, parsed from asm/*.s. ~5MB, so parse once and hold."""
    if "asm" not in _cache:
        index = {}
        for af in awlib.load_all():
            for fn in af.funcs:
                index[fn.name] = fn
        _cache["asm"] = index
    return _cache["asm"]


ADDR_RE = re.compile(r'^(?:0x)?([0-9A-Fa-f]{6,8})$')


def _resolve(name_or_addr: str):
    """Accept 'sub_0801D390', '0x0801D390', or '801D390'."""
    records = _functions()
    if records is None:
        return None
    key = name_or_addr.strip()
    for r in records:
        if r["name"] == key:
            return r
    m = ADDR_RE.match(key)
    if m:
        want = int(m.group(1), 16)
        for r in records:
            if r["addr"] == want:
                return r
    lowered = key.lower()
    for r in records:
        if r["name"].lower() == lowered:
            return r
    return None


def _row(r):
    """Compact one-line-ish form used by every list-returning tool."""
    row = {
        "name": r["name"],
        "addr": r["addr_hex"],
        "size": r["size"],
        "mode": r["mode"],
        "difficulty": r["difficulty"],
        "status": r["status"],
        "src": r["src"],
    }
    if r.get("trivial"):
        row["trivial"] = True
    fe = _fe_names().get(r["name"])
    if fe:
        row["fe_name"] = fe
    return row


def _need_index():
    return ("data/functions.json missing -- run `python tools/index_functions.py` "
            "then `python tools/callgraph.py`")


@mcp.tool()
def list_functions(
    status: str | None = None,
    max_difficulty: float | None = None,
    min_size: int | None = None,
    max_size: int | None = None,
    leaves_only: bool = False,
    named_only: bool = False,
    unnamed_only: bool = False,
    exclude_trivial: bool = False,
    src: str | None = None,
    limit: int = 50,
) -> dict:
    """Query the function index with filters.

    status: 'asm' (not yet decompiled), 'matched', or 'nonmatching'.
    leaves_only: only functions with no outgoing calls -- these need no unknown
      callee signatures, so they are the cheapest to match first.
    unnamed_only: only anonymous sub_XXXXXXXX functions (99.6% of the corpus).
    exclude_trivial: drop `bx lr` / `movs r0, #N; bx lr` return stubs.
    Results are capped by `limit`; `total_matching` reports the unclipped count.
    """
    records = _functions()
    if records is None:
        return {"error": _need_index()}

    cg = _callgraph()
    graph = (cg or {}).get("functions", {})

    out = []
    for r in records:
        if status and r["status"] != status:
            continue
        if max_difficulty is not None and r["difficulty"] > max_difficulty:
            continue
        if min_size is not None and r["size"] < min_size:
            continue
        if max_size is not None and r["size"] > max_size:
            continue
        if named_only and not r["named"]:
            continue
        if unnamed_only and r["named"]:
            continue
        if exclude_trivial and r.get("trivial"):
            continue
        if src and r["src"] != src:
            continue
        if leaves_only and graph.get(r["name"], {}).get("fan_out", 0) != 0:
            continue
        out.append(r)

    return {
        "total_matching": len(out),
        "returned": min(len(out), limit),
        "functions": [_row(r) for r in out[:limit]],
    }


@mcp.tool()
def get_function(name_or_addr: str, include_asm: bool = True) -> dict:
    """Full detail for one function: metadata, assembly, callers/callees, globals.

    This is the primary tool for a matching attempt -- it returns everything
    needed to draft C for the function in a single call. Accepts a name
    ('sub_0801D390') or an address ('0x0801D390').
    """
    rec = _resolve(name_or_addr)
    if rec is None:
        records = _functions()
        if records is None:
            return {"error": _need_index()}
        return {"error": f"no function matching {name_or_addr!r}"}

    result = {
        "name": rec["name"],
        "addr": rec["addr_hex"],
        "size": rec["size"],
        "mode": rec["mode"],
        "directive": rec["directive"],
        "src": rec["src"],
        "status": rec["status"],
        "kind": rec["kind"],
        "named": rec["named"],
        "difficulty": rec["difficulty"],
        "calls": rec["calls"],
        "data_refs": rec["data_refs"],
    }

    fe = _fe_names().get(rec["name"])
    if fe:
        result["fe_name"] = fe
        result["fe_note"] = (
            f"Shape-matches {fe} in the Fire Emblem decomps (shared Intelligent "
            f"Systems engine). Use their C as the starting point and their name "
            f"when this matches -- but confirm with objdiff, the signature "
            f"compares shape, not semantics.")

    cg = _callgraph()
    if cg:
        node = cg["functions"].get(rec["name"])
        if node:
            result["callers"] = node["callers"]
            result["callees"] = node["callees"]
            result["external_calls"] = node["external"]
            result["fan_in"] = node["fan_in"]
            result["depth"] = node["depth"]
            result["batch"] = node["batch"]

    if include_asm:
        fn = _asm_index().get(rec["name"])
        if fn is None:
            result["asm_error"] = "function not found in asm/*.s"
        else:
            lines = fn.lines
            result["asm_lines"] = len(lines)
            if len(lines) > MAX_ASM_LINES:
                result["asm"] = "".join(lines[:MAX_ASM_LINES])
                result["asm_truncated"] = (
                    f"showing first {MAX_ASM_LINES} of {len(lines)} lines; "
                    f"read build/functions/ for the full unit")
            else:
                result["asm"] = "".join(lines)
    return result


@mcp.tool()
def next_work(count: int = 5, max_difficulty: float | None = None,
              leaves_only: bool = True, min_size: int = 0,
              include_trivial: bool = False) -> dict:
    """Pull the next functions to attempt, in fleet scheduling order.

    This is the fleet's work queue. Ordering is by call-graph depth (callees
    before callers, so no attempt is blocked on an unknown signature), then
    easiest-first with a discount for fan-in.

    Return stubs -- `bx lr` and `movs r0, #N; bx lr` -- are excluded by default.
    There are ~100 of them and they are the easiest possible matches, but they
    carry no information about the game and are not worth an agent apiece; use
    `stub_sweep` to clear them in one pass. Set include_trivial=True to see them
    here anyway.
    """
    cg = _callgraph()
    if cg is None:
        return {"error": "data/callgraph.json missing -- run `python tools/callgraph.py`"}
    records = _functions()
    if records is None:
        return {"error": _need_index()}
    by_name = {r["name"]: r for r in records}

    picked = []
    skipped_trivial = 0
    for name in cg["queue"]:
        rec = by_name.get(name)
        if rec is None or rec["status"] != "asm":
            continue
        if rec["kind"] == "bios":
            continue          # syscall thunks are reimplemented, not decompiled
        if rec.get("trivial") and not include_trivial:
            skipped_trivial += 1
            continue
        if max_difficulty is not None and rec["difficulty"] > max_difficulty:
            continue
        if rec["size"] < min_size:
            continue
        node = cg["functions"][name]
        if leaves_only and node["fan_out"] != 0:
            continue
        row = _row(rec)
        row["fan_in"] = node["fan_in"]
        row["depth"] = node["depth"]
        row["batch"] = node["batch"]
        picked.append(row)
        if len(picked) >= count:
            break

    out = {"returned": len(picked), "functions": picked}
    if skipped_trivial:
        out["skipped_trivial"] = skipped_trivial
    return out


@mcp.tool()
def stub_sweep(limit: int = 200) -> dict:
    """Every remaining return stub, grouped by the C body that matches it.

    These are the `bx lr` / `movs r0, #N; bx lr` functions the main queue skips.
    One agent can clear the whole set in a single pass: each group shares one
    body, so the work is writing the same line N times, not N separate matching
    problems. Signatures are still unknown -- `void f(void)` vs a return type
    that happens to be ignored -- so treat the bodies as a starting point that
    the objdiff score confirms.
    """
    records = _functions()
    if records is None:
        return {"error": _need_index()}

    asm = _asm_index()
    groups: dict[str, list] = {}
    for r in records:
        if not r.get("trivial") or r["status"] != "asm" or r["kind"] == "bios":
            continue
        fn = asm.get(r["name"])
        if fn is None:
            continue
        shape = " ; ".join(awlib.instructions(fn))
        groups.setdefault(shape, []).append(r)

    out = []
    for shape, rows in sorted(groups.items(), key=lambda kv: -len(kv[1])):
        body = "void %s(void)\n{\n}" % "FUNC"
        m = re.match(r'^movs r0, #(\S+) ; bx lr$', shape)
        if m:
            body = "int %s(void)\n{\n    return %s;\n}" % ("FUNC", m.group(1))
        out.append({
            "asm": shape,
            "count": len(rows),
            "suggested_body": body,
            "functions": [r["name"] for r in rows[:limit]],
        })

    total = sum(g["count"] for g in out)
    return {"total_stubs": total, "shapes": len(out), "groups": out}


@mcp.tool()
def search_functions(query: str, limit: int = 30) -> dict:
    """Find functions by name substring, address, or referenced global symbol.

    Searching a global (e.g. 'gDispIo') returns every function that touches it,
    which is the fastest way to find the code owning a piece of state.
    """
    records = _functions()
    if records is None:
        return {"error": _need_index()}

    q = query.strip().lower()
    by_name, by_data = [], []
    for r in records:
        if q in r["name"].lower():
            by_name.append(r)
            continue
        if any(q in d.lower() for d in r["data_refs"]):
            by_data.append(r)

    exact = _resolve(query)
    if exact and exact not in by_name:
        by_name.insert(0, exact)

    return {
        "name_matches": len(by_name),
        "data_ref_matches": len(by_data),
        "by_name": [_row(r) for r in by_name[:limit]],
        "by_data_ref": [_row(r) for r in by_data[:limit]],
    }


@mcp.tool()
def callgraph(name_or_addr: str, depth: int = 1) -> dict:
    """Callers and callees around a function, expanded `depth` hops.

    Use this to size a batch: a tight cluster is worth matching together
    because the structs worked out for one member carry to the rest.
    """
    rec = _resolve(name_or_addr)
    if rec is None:
        return {"error": f"no function matching {name_or_addr!r}"}
    cg = _callgraph()
    if cg is None:
        return {"error": "data/callgraph.json missing -- run `python tools/callgraph.py`"}

    graph = cg["functions"]
    seen = {rec["name"]}
    frontier = {rec["name"]}
    for _ in range(max(0, depth)):
        nxt = set()
        for n in frontier:
            node = graph.get(n)
            if not node:
                continue
            nxt.update(node["callers"])
            nxt.update(node["callees"])
        nxt -= seen
        seen |= nxt
        frontier = nxt
        if not frontier:
            break

    root = graph.get(rec["name"], {})
    return {
        "root": rec["name"],
        "depth": depth,
        "callers": root.get("callers", []),
        "callees": root.get("callees", []),
        "external_calls": root.get("external", []),
        "cluster_size": len(seen),
        "cluster": sorted(seen),
    }


@mcp.tool()
def fe_matches() -> dict:
    """Functions identified by shape-matching against the Fire Emblem decomps.

    Both games are Intelligent Systems GBA titles on a shared engine, so library
    code links identically. Almost all of these are the Nintendo M4A sound
    driver and a tilemap/bitmap library -- portable reference code with known-good
    C already written in the FE repos, which makes them unusually cheap matches.
    """
    data = _load_json(FE_MATCHES_JSON, "fe")
    if data is None:
        return {"error": "data/fe_matches.json missing -- run "
                         "`python tools/fe_signatures.py`"}
    return {
        "identified": len(data["matches"]),
        "eligible": data["eligible"],
        "reference_functions": data["reference_functions"],
        "matches": [
            {"name": h["name"], "addr": h["addr"], "size": h["size"],
             "fe_name": h["fe_name"], "strength": h["strength"]}
            for h in data["matches"]],
    }


@mcp.tool()
def progress() -> dict:
    """Decomp progress by function count and by code bytes."""
    records = _functions()
    if records is None:
        return {"error": _need_index()}

    total = len(records)
    total_bytes = sum(r["size"] for r in records)
    done = [r for r in records if r["status"] in ("matched", "nonmatching")]
    done_bytes = sum(r["size"] for r in done)
    game = [r for r in records if r["kind"] == "game"]
    named = [r for r in records if r["named"]]

    return {
        "functions_total": total,
        "functions_done": len(done),
        "percent_functions": round(len(done) / total * 100, 2) if total else 0,
        "bytes_total": total_bytes,
        "bytes_done": done_bytes,
        "percent_bytes": round(done_bytes / total_bytes * 100, 2) if total_bytes else 0,
        "game_functions": len(game),
        "bios_stubs": total - len(game),
        "named_functions": len(named),
        "percent_named": round(len(named) / total * 100, 2) if total else 0,
        "fe_identified": len(_fe_names()),
        "return_stubs": sum(1 for r in records
                            if r.get("trivial") and r["kind"] == "game"),
    }


def _run(args: list[str], timeout: int = 300) -> dict:
    try:
        proc = subprocess.run(
            [sys.executable, *args], cwd=awlib.REPO, capture_output=True,
            text=True, timeout=timeout, stdin=subprocess.DEVNULL)
    except subprocess.TimeoutExpired:
        return {"ok": False, "error": f"timed out after {timeout}s"}
    return {
        "ok": proc.returncode == 0,
        "exit_code": proc.returncode,
        "stdout": proc.stdout[-4000:],
        "stderr": proc.stderr[-2000:],
    }


@mcp.tool()
def start_function(name_or_addr: str) -> dict:
    """Scaffold a matching attempt: target assembly, a stub, and what it touches.

    Call this first, then write C and submit it with `try_match`. The returned
    signature is inferred from register use and is often wrong -- it is a
    starting point, and try_match is what settles it.
    """
    rec = _resolve(name_or_addr)
    if rec is None:
        return {"error": f"no function matching {name_or_addr!r}"}
    res = _run(["tools/newfunc.py", rec["name"]])
    if not res["ok"]:
        return {"step": "scaffold", **res}

    work = os.path.join(awlib.REPO, "work", rec["name"])
    out = {
        "name": rec["name"],
        "addr": rec["addr_hex"],
        "size": rec["size"],
        "mode": rec["mode"],
        "work_dir": f"work/{rec['name']}",
        "calls": rec["calls"],
        "data_refs": rec["data_refs"],
    }
    fe = _fe_names().get(rec["name"])
    if fe:
        out["fe_name"] = fe
        out["fe_note"] = (f"Shape-matches {fe} in the Fire Emblem decomps -- "
                          f"start from their C for this function.")
    for key, fname in (("target_asm", "target.s"), ("stub", rec["name"] + ".c")):
        path = os.path.join(work, fname)
        if os.path.exists(path):
            out[key] = "".join(awlib.read_lines(path))
    return out


@mcp.tool()
def try_match(name_or_addr: str, c_code: str, show_diff: bool = True) -> dict:
    """Compile candidate C for one function and report whether it matches.

    This is the verdict the whole pipeline exists to produce. `matched` is true
    only when the compiled bytes and relocations are identical to the original,
    so it cannot be talked into a false positive -- if it says matched, the ROM
    still builds.

    On a miss you get the byte counts, where the first difference is, and an
    instruction-level diff. Rewrite and call again. If three attempts have not
    converged, the benchmark says a fourth rarely helps -- change approach or
    move on rather than resubmitting a near-identical body.
    """
    rec = _resolve(name_or_addr)
    if rec is None:
        return {"error": f"no function matching {name_or_addr!r}"}

    name = rec["name"]
    work = os.path.join(awlib.REPO, "work", name)
    if not os.path.isdir(work):
        scaffold = _run(["tools/newfunc.py", name])
        if not scaffold["ok"]:
            return {"step": "scaffold", **scaffold}

    awlib.write_text(os.path.join(work, name + ".c"), c_code)

    args = ["tools/trymatch.py", name]
    if show_diff:
        args.append("--diff")
    res = _run(args)

    out = {
        "name": name,
        "size": rec["size"],
        "matched": res["exit_code"] == 0,
        "report": res["stdout"][-6000:],
    }
    if res["stderr"].strip():
        out["stderr"] = res["stderr"][-1500:]
    if out["matched"]:
        out["next"] = ("Move the C into src/, delete the function from asm/, "
                       "regenerate with reindex, and confirm `make compare` "
                       "still reproduces the ROM.")
    return out


@mcp.tool()
def verify_split() -> dict:
    """Check the per-function split is lossless and every unit self-contained.

    Two independent gates: units must reconstruct asm/*.s byte-for-byte, and no
    unit may reference a local label it does not define. Run this after any
    change to the splitter, before trusting a build.
    """
    return _run(["tools/verify_split.py"])


@mcp.tool()
def reindex() -> dict:
    """Rebuild data/functions.json and data/callgraph.json from asm/*.s.

    Run after decompiling functions so the work queue reflects reality.
    """
    first = _run(["tools/index_functions.py"])
    if not first["ok"]:
        return {"step": "index_functions", **first}
    second = _run(["tools/callgraph.py"])
    _cache.clear()
    return {
        "step": "complete" if second["ok"] else "callgraph",
        "index_stdout": first["stdout"],
        **second,
    }


if __name__ == "__main__":
    mcp.run()
