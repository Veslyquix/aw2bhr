#!/usr/bin/env python3
"""Build data/callgraph.json -- call relationships and fleet scheduling order.

Two things here drive agent throughput:

  * Leaf-first ordering. A function with no outgoing calls has no unknown
    callee signatures, so it can be matched without first inventing types for
    everything it touches. Depth (longest path to a leaf) generalises this into
    a full work order.

  * Address-locality batching. The original C translation units were compiled
    in order, so a contiguous run of addresses is very likely one source file.
    Handing one agent a whole run means the structs and globals it works out
    are reused across the batch instead of rediscovered per function.

Usage:
    python tools/callgraph.py [--stats] [--queue N]
"""

import argparse
import json
import os
import sys
from collections import defaultdict

import awlib

OUT = os.path.join(awlib.DATA_DIR, "callgraph.json")

# Provided by libgcc / the BIOS -- real targets, but never our decomp work.
EXTERNAL_PREFIXES = ("__", "_call_via_")

# A function called from 20+ sites earns the full credit. Naming one of those
# pays off everywhere it appears, so it is worth taking slightly out of
# easiest-first order; the cap stops fan-in from swamping difficulty outright.
FAN_IN_CREDIT_PER_CALLER = 0.25
FAN_IN_CREDIT_MAX = 5.0


def queue_key(r):
    """Scheduling order for the fleet.

    Depth first, so callees are matched before their callers and no attempt is
    blocked on an unknown signature. Then return stubs are demoted -- ranking on
    size alone floats 100+ four-byte `bx lr` functions to the top, which are the
    easiest possible matches and the least informative ones. Within what is
    left, easiest first, discounted by fan-in. Address breaks ties so a run of
    queue entries stays in one translation unit.
    """
    credit = min(FAN_IN_CREDIT_MAX, r["fan_in"] * FAN_IN_CREDIT_PER_CALLER)
    return (r["depth"], r["trivial"], r["difficulty"] - credit, r["addr_hex"])


def build():
    files = awlib.load_all()
    funcs = [fn for af in files for fn in af.funcs]
    known = {fn.name for fn in funcs}

    callees = defaultdict(set)
    callers = defaultdict(set)
    external = defaultdict(set)

    for fn in funcs:
        for _, target in fn.calls:
            if target in known:
                callees[fn.name].add(target)
                callers[target].add(fn.name)
            else:
                external[fn.name].add(target)

    order = {fn.name: i for i, fn in enumerate(funcs)}

    # Sorted adjacency, not the raw sets. Set iteration order for strings varies
    # with PYTHONHASHSEED, and where the graph has cycles the depth a node
    # settles on depends on the order its callees are finalised -- so the same
    # commit produced different depths, and therefore a different work queue,
    # between runs. Sorting pins the traversal.
    adj = {name: sorted(cs) for name, cs in callees.items()}

    # Depth = longest path to a leaf. Iterative post-order with an explicit
    # stack; recursion would blow the stack and cycles must not hang us.
    depth = {}
    WORKING = -1
    for root in funcs:
        if root.name in depth:
            continue
        stack = [(root.name, False)]
        while stack:
            name, expanded = stack.pop()
            if expanded:
                best = 0
                for c in adj.get(name, ()):
                    d = depth.get(c, 0)
                    if d is not WORKING and isinstance(d, int) and d >= 0:
                        best = max(best, d + 1)
                depth[name] = best
                continue
            if name in depth and depth[name] is not WORKING:
                continue
            depth[name] = WORKING          # cycle guard
            stack.append((name, True))
            for c in adj.get(name, ()):
                if c not in depth:
                    stack.append((c, False))
    for k, v in list(depth.items()):
        if v is WORKING or v < 0:
            depth[k] = 0                    # recursive/cyclic -> treat as leaf-ish

    # Address-locality batches: split a file's function run wherever the gap in
    # address space is unusually large, which tends to fall on TU boundaries.
    batches = {}
    for af in files:
        run, bid = [], 0
        for i, fn in enumerate(af.funcs):
            run.append(fn)
            nxt = af.funcs[i + 1] if i + 1 < len(af.funcs) else None
            too_big = len(run) >= 40
            if nxt is None or too_big:
                for m in run:
                    batches[m.name] = f"{af.base[:-2]}#{bid:03d}"
                run, bid = [], bid + 1
    records = {}
    for fn in funcs:
        records[fn.name] = {
            "name": fn.name,
            "addr_hex": f"0x{fn.addr:08X}",
            "size": fn.size,
            "callees": sorted(callees.get(fn.name, ())),
            "callers": sorted(callers.get(fn.name, ())),
            "external": sorted(external.get(fn.name, ())),
            "fan_in": len(callers.get(fn.name, ())),
            "fan_out": len(callees.get(fn.name, ())),
            "depth": depth.get(fn.name, 0),
            "batch": batches.get(fn.name),
            "difficulty": awlib.difficulty(fn),
            "trivial": awlib.is_trivial(fn),
        }

    queue = [r["name"] for r in sorted(records.values(), key=queue_key)]
    payload = {"functions": records, "queue": queue}
    awlib.write_text(OUT, json.dumps(payload, indent=1) + "\n")
    return records, queue


def stats(records, queue):
    total = len(records)
    leaves = [r for r in records.values() if r["fan_out"] == 0]
    print(f"call graph: {total:,} functions")
    print(f"  leaves (fan_out == 0)     {len(leaves):,} ({len(leaves)/total*100:.1f}%)")
    edges = sum(r["fan_out"] for r in records.values())
    print(f"  internal call edges       {edges:,}")
    ext = sum(len(r["external"]) for r in records.values())
    print(f"  external call sites       {ext:,} (libgcc / BIOS)")

    print("\ndepth distribution (0 = leaf, higher = deeper in the graph)")
    by_depth = defaultdict(int)
    for r in records.values():
        by_depth[r["depth"]] += 1
    for d in sorted(by_depth)[:12]:
        bar = "#" * min(48, by_depth[d] // 25)
        print(f"  depth {d:3}  {by_depth[d]:5}  {bar}")
    if len(by_depth) > 12:
        print(f"  ... {len(by_depth) - 12} deeper levels")

    print("\nmost-called functions (high fan-in = core engine, name these first)")
    for r in sorted(records.values(), key=lambda x: -x["fan_in"])[:10]:
        print(f"  {r['name']:24} called by {r['fan_in']:4}  "
              f"{r['size']:>6,} B  depth {r['depth']}")

    print(f"\nbatches (address-locality groups): {len({r['batch'] for r in records.values()})}")
    stubs = [r for r in records.values() if r["trivial"]]
    print(f"return stubs demoted to the queue tail: {len(stubs):,}")
    print(f"\nfirst 15 in work queue (leaf-first, stubs demoted, fan-in credited):")
    for name in queue[:15]:
        r = records[name]
        print(f"  {r['name']:24} {r['size']:>5,} B  depth {r['depth']}  "
              f"diff {r['difficulty']:5.1f}  fan_in {r['fan_in']}")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--stats", action="store_true")
    args = ap.parse_args()
    records, queue = build()
    print(f"wrote {os.path.relpath(OUT, awlib.REPO)}  ({len(records):,} functions)")
    if args.stats:
        print()
        stats(records, queue)
    return 0


if __name__ == "__main__":
    sys.exit(main())
