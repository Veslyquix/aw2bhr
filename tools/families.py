#!/usr/bin/env python3
"""Cluster every function by normalised instruction shape -> data/families.json.

Why this exists: the single biggest lever on match rate found so far is batching
by shape. An agent handed N functions that are the same instruction sequence with
different constants works the shape out once and instantiates the rest, and
clears three to five times what a hand-picked list of unrelated functions yields.
Every family used that way so far was found by eye, by scanning for runs of equal
size at equal address spacing. That misses everything scattered: the `Proc_Find`
existence-predicate family has 29 members spread from 0x0801C7B4 to 0x0808AA88,
and the header in docs/agbcc-codegen.md claimed 13 because 13 of them happened to
be adjacent. This tool finds families by shape rather than by address, so
scattered ones cost nothing extra.

The normaliser is fe_signatures.signature()'s `full` signature with ONE axis
flipped: register numbers are kept. That single change is the whole design, and
the reason for it is that the two tools answer different questions.
fe_signatures compares AW2 against four *other* games built from different
sources by a different build, so register allocation is noise there and has to
go. Inside one ROM built once, agbcc's allocation is a deterministic function of
the source, so a register difference IS a source difference. Measured, on the
41-member `push {lr}; movs rN,#imm; bl f; pop {rM}; bx rM` shape:

    movs r0,#imm ... pop {r0}   34   void g(void)      { f(imm); }
    movs r0,#imm ... pop {r1}    3   int  g(void)      { return f(imm); }
    movs r1,#imm ... pop {r1}    3   int  g(int a)     { return f(a, imm); }
    movs r1,#imm ... pop {r0}    1   void g(int a)     { f(a, imm); }

The register naming the argument position and the `pop` register naming
void-vs-value-returning are four different C templates, not four spellings of
one. Erasing registers hands an agent a "family" whose members need four
different bodies, which is exactly the thing batching is supposed to avoid.
Erasing them buys 16 extra clustered members ROM-wide and costs the guarantee.
So: registers in.

Everything else follows fe_signatures unchanged, and each choice is a claim about
what the compiler was free to vary given fixed source:

  immediates -> `#`      A different constant is the point of a family.
  local labels -> `L`    Includes literal-pool labels, so `ldr r0,_0804586C`
                         normalises without dragging the pool word in with it.
  other symbols -> `S`   Callee names and direct data symbols. Erasing the callee
                         is load-bearing: the 41 forwarders at 0x08071F88 call
                         eight different functions and are four templates, and
                         `push {lr}; bl f; pop {r0}; bx r0` is 55 functions
                         calling 48 distinct targets. Keeping callees would
                         shatter both into singletons.
  branch to label -> delta in instruction indices, so two copies of one predicate
                         at different addresses agree.
  literal pool -> dropped entirely. awlib.instructions() already skips `.4byte`
                         directives; pool words are data, and "same shape, other
                         global" is the family you want to find, not a split.

Two tiers are emitted. EXACT is a key collision. FUZZY joins exact families whose
shapes differ by at most a couple of tokens -- an instruction reordered or one
added -- which is still one batch for one agent. Fuzzy is restricted to long
shapes (see MIN_FUZZY_INSNS) because at five instructions everything is within
two edits of everything else and the tier degenerates into one blob.

Self-validation is not optional and runs on every invocation: a clustering tool
that cannot show it rediscovers the families already known by hand would get
believed, and the next wave would batch on it blindly. See validate().

Usage:
    python tools/families.py [--report] [--min-members N] [--no-fuzzy]
"""

import argparse
import collections
import difflib
import json
import os
import re
import sys

import awlib
import fe_signatures as fes

OUT = os.path.join(awlib.DATA_DIR, "families.json")

# Below this a shape is a coincidence, not a family. `push; bl; pop; bx` is the
# shortest thing anyone would call a family and it is four.
MIN_INSNS = 4

# A family is worth an agent's setup cost at three. Two is a coincidence often
# enough that including pairs triples the family count without adding batches.
MIN_MEMBERS = 3

# Fuzzy linking needs enough instructions that "within two edits" is a real
# statement. At six or fewer, `push/bl/pop/bx` and `push/movs/bl/pop/bx` are one
# edit apart and the whole 4-8 instruction wrapper population fuses. Measured: at
# 8 the tier produced a 110-member cluster spanning 71 distinct shapes and sizes
# 20 through 48, which is not a batch, it is the wrapper population. 10 is where
# the neighbourhoods stop touching. Short shapes lose nothing by being excluded:
# they are already clustered exactly, and fuzz only blurs them.
MIN_FUZZY_INSNS = 10
FUZZY_MIN_RATIO = 0.85
FUZZY_MAX_LEN_DELTA = 2

POOL_COMMENT_RE = re.compile(r'@\s*=(\S+)')
# Same token vocabulary as fe_signatures.TOKEN_RE, but this one is used with
# re.sub so the surrounding `[`, `]`, `{`, `}` and commas survive and the key
# stays readable: `ldr r0,[r1,#]` rather than a bare token list.
TOKEN_SUB_RE = re.compile(r'#-?(?:0x[0-9A-Fa-f]+|\d+)|-?0x[0-9A-Fa-f]+|'
                          r'\b\d+\b|[A-Za-z_.$][\w.$]*')


def body(fn):
    """[(code, pool_comment)] for each real instruction, in source order.

    awlib.instructions() is the same walk but discards the `@ =symbol` comment,
    and that comment is the only place the literal pool's contents are named. It
    stays out of the key -- see the module docstring -- but it is exactly what
    varies between members, so the caller needs it to describe a family.
    """
    out = []
    for ln in fn.lines:
        code = ln.split("@")[0].strip()
        comment = POOL_COMMENT_RE.search(ln)
        if not code:
            continue
        if awlib.LABEL_RE.match(code):
            code = code.split(":", 1)[1].strip()
            if not code:
                continue
        if code.startswith(".") or awlib.MACRO_RE.match(code):
            continue
        out.append((code, comment.group(1) if comment else None))
    return out


def signature(fn, keep_registers=True):
    """(key, values) -- the normalised shape and the concrete tokens it erased.

    `key` is a tuple of one string per instruction. `values` is the parallel
    tuple of what was thrown away at that instruction: the immediate, the callee
    name, or the pool word the `ldr` reaches. Positions where `key` agrees across
    members but `values` disagrees are precisely the axes a batch varies along,
    which is what a wave brief needs to say.
    """
    insns = body(fn)
    labels = fes.label_positions(fn)
    key, values = [], []

    for i, (text, pool) in enumerate(insns):
        mnem, operands = fes.split_insn(text)

        if mnem in fes.BRANCH_MNEM:
            target = operands.strip()
            if target in labels:
                # Relative in instruction indices. Absolute labels are addresses
                # and differ for every copy of the same predicate.
                key.append(f"{mnem} L{labels[target] - i:+d}")
                values.append(None)
            elif fes.REG_RE.match(target):
                key.append(f"{mnem} {target.lower() if keep_registers else 'R'}")
                values.append(None)
            else:
                key.append(f"{mnem} S")
                values.append(target)
            continue

        captured = []

        def sub(m):
            tok = m.group(0)
            if fes.REG_RE.match(tok):
                return tok.lower() if keep_registers else "R"
            if fes.IMM_RE.match(tok) or tok.lstrip("-#").replace("0x", "").isdigit():
                captured.append(tok)
                return "#"
            if tok in labels:
                # A pool label. The pool word itself is named in the comment; the
                # label is just the address the assembler picked for it.
                captured.append(pool if pool else tok)
                return "L"
            captured.append(tok)
            return "S"

        shape = re.sub(r"\s+", "", TOKEN_SUB_RE.sub(sub, operands))
        key.append(mnem + " " + shape if shape else mnem)
        values.append(",".join(captured) if captured else None)

    return tuple(key), tuple(values)


def varies(members, sigs):
    """What differs between a family's members, per instruction position.

    Returns a list of {index, insn, values} for every position whose erased
    token is not the same for everyone. A family with an empty list is N literal
    copies of one function, which happens and is worth flagging.
    """
    key = sigs[members[0].name][0]
    axes = []
    for i in range(len(key)):
        seen = [sigs[m.name][1][i] for m in members]
        if len(set(seen)) > 1:
            axes.append({
                "index": i,
                "insn": key[i],
                "values": [s if s is not None else "" for s in seen],
                "distinct": len(set(seen)),
            })
    return axes


def source_files():
    """Matched function name -> the .c it lives in.

    Derived by scanning rather than by formatting the address into
    `src/decomp/c_%08X.c`: promote.py merges address-adjacent drafts, so a
    function is usually in a file named after some *other* member of its block.
    Five of the 42 exemplars had a guessed path that did not exist, and an
    exemplar pointer that 404s is worse than none -- the agent stops trusting
    the file. Same signature regexes as index_functions.decompiled_symbols().
    """
    found = {}
    src = os.path.join(awlib.REPO, "src")
    sig = re.compile(r'^[A-Za-z_][\w \*]*?\b([A-Za-z_]\w*)\s*\([^;]*\)\s*\{?\s*$')
    fptr = re.compile(r'^[A-Za-z_][\w \*]*\(\s*\*\s*([A-Za-z_]\w*)\s*\(')
    for dirpath, _, filenames in os.walk(src):
        for entry in sorted(filenames):
            if not entry.endswith(".c"):
                continue
            path = os.path.join(dirpath, entry)
            with open(path, encoding="utf-8", errors="replace") as fh:
                for ln in fh:
                    m = sig.match(ln) or fptr.match(ln)
                    if m:
                        found.setdefault(m.group(1),
                                         os.path.relpath(path, awlib.REPO)
                                         .replace(os.sep, "/"))
    return found


def eligible(fn, record):
    """Shapes worth clustering.

    Return stubs are excluded even though they cluster beautifully: 83 functions
    are the single instruction `bx lr`, and they are already handled in bulk by
    the stub sweep rather than by an agent apiece. Including them would put a
    meaningless 83-member family at the top of every ranking.
    """
    if record["kind"] == "bios" or record["trivial"]:
        return False
    return True


def build(min_members, do_fuzzy):
    files = awlib.load_all()
    funcs = [fn for af in files for fn in af.funcs]
    with open(os.path.join(awlib.DATA_DIR, "functions.json"), encoding="utf-8") as fh:
        records = {r["name"]: r for r in json.load(fh)}
    sources = source_files()

    sigs, loose = {}, {}
    pool = []
    for fn in funcs:
        rec = records.get(fn.name)
        if rec is None or not eligible(fn, rec):
            continue
        key, values = signature(fn, keep_registers=True)
        if len(key) < MIN_INSNS:
            continue
        sigs[fn.name] = (key, values)
        loose[fn.name] = signature(fn, keep_registers=False)[0]
        pool.append(fn)

    # Mode is in the key only as a guard. An ARM and a THUMB function sharing a
    # mnemonic sequence would be a false family; there are 20 ARM functions left,
    # so the guard is nearly free and the failure it prevents is silent.
    groups = collections.defaultdict(list)
    for fn in pool:
        groups[(fn.mode,) + sigs[fn.name][0]].append(fn)

    families = []
    for key, members in groups.items():
        if len(members) < min_members:
            continue
        members.sort(key=lambda f: f.addr)
        families.append(make_family(members, sigs, records, sources, key[1:]))

    families.sort(key=lambda f: (-f["n_members"], f["representative"]))
    for n, fam in enumerate(families):
        fam["id"] = f"F{n:03d}"

    # After the IDs exist: every fuzzy cluster names the exact family it widens.
    fuzzy = fuzzy_link(families, pool, loose, min_members) if do_fuzzy else []
    return families, fuzzy, records


def make_family(members, sigs, records, sources, key):
    unmatched = [m for m in members if records[m.name]["status"] == "asm"]
    matched = [m for m in members if records[m.name]["status"] == "matched"]
    axes = varies(members, sigs)
    return {
        "id": None,
        "n_members": len(members),
        "n_unmatched": len(unmatched),
        "n_matched": len(matched),
        "n_insns": len(key),
        "sizes": sorted({m.size for m in members}),
        # The representative is a MATCHED member when one exists: that is a
        # worked exemplar of the whole family and makes the batch nearly free.
        # Otherwise the smallest unmatched one, as the cheapest way in. A family
        # with neither is all asm-resident -- hand-written assembly clusters just
        # as well as compiler output, and those need a representative too.
        "representative": (matched[0].name if matched
                           else min(unmatched or members,
                                    key=lambda m: m.size).name),
        "exemplar_is_matched": bool(matched),
        "exemplar_src": sources.get(matched[0].name) if matched else None,
        "shape": list(key),
        "varies": axes,
        "members": [{"name": m.name, "addr": f"0x{m.addr:08X}", "size": m.size,
                     "src": m.src, "status": records[m.name]["status"]}
                    for m in members],
    }


def fuzzy_link(families, pool, loose, min_members):
    """Widen each exact family to the shapes within a couple of edits of it.

    The 5-member bitfield family at 0x08045848 is the motivating case: four
    members are identical in shape and the fifth hoists one `ldr` two
    instructions earlier, which is the same source through a different schedule.
    An exact key cannot see that; a human scanning for equal sizes could.

    Each cluster is ANCHORED on an exact family and never on another fuzzy
    cluster. The first cut of this used union-find over all pairwise links, and
    transitivity destroyed it: A-B and B-C merge even when A and C share nothing,
    and the result was a 110-member "family" spanning 71 shapes and eight
    distinct sizes. Anchoring makes the relation non-transitive, which costs some
    recall and buys the property that actually matters -- every member is within
    two edits of the one function the agent is told to solve first.

    Comparison is on the register-ERASED token sequence. Fuzzy is asking "close
    enough to brief as one batch", and at that resolution a reallocated register
    is not worth splitting on; the strictness that matters is already spent
    inside the exact tier.
    """
    anchors = [f for f in families if f["n_insns"] >= MIN_FUZZY_INSNS]
    cands = [fn for fn in pool if len(loose[fn.name]) >= MIN_FUZZY_INSNS]
    counts = {fn.name: collections.Counter(loose[fn.name]) for fn in cands}
    by_len = collections.defaultdict(list)
    for fn in cands:
        by_len[len(loose[fn.name])].append(fn)

    out = []
    for fam in anchors:
        seq = loose[fam["representative"]]
        cnt = collections.Counter(seq)
        own = {m["name"] for m in fam["members"]}
        extra = []
        for n in range(len(seq) - FUZZY_MAX_LEN_DELTA,
                       len(seq) + FUZZY_MAX_LEN_DELTA + 1):
            for fn in by_len.get(n, ()):
                if fn.name in own:
                    continue
                # Cheap bound before the O(n^2) matcher: sequences within two
                # edits share all but two instructions as a multiset.
                if sum((cnt & counts[fn.name]).values()) < max(len(seq), n) \
                        - FUZZY_MAX_LEN_DELTA:
                    continue
                if difflib.SequenceMatcher(None, seq, loose[fn.name]).ratio() \
                        < FUZZY_MIN_RATIO:
                    continue
                extra.append(fn)
        if not extra:
            continue
        members = sorted(
            [(m["name"], m["addr"]) for m in fam["members"]]
            + [(fn.name, f"0x{fn.addr:08X}") for fn in extra],
            key=lambda p: p[1])
        out.append({
            "id": None,
            "anchor": fam["id"],
            "n_members": len(members),
            "n_exact": fam["n_members"],
            "n_added": len(extra),
            "n_insns": fam["n_insns"],
            "sizes": sorted({m["size"] for m in fam["members"]}
                            | {fn.size for fn in extra}),
            "representative": fam["representative"],
            "members": [f"{n}@{a}" for n, a in members],
        })
    out.sort(key=lambda c: -c["n_added"])
    for n, c in enumerate(out):
        c["id"] = f"Z{n:03d}"
    return out


# --------------------------------------------------------------------------
# Validation. Three families are already known by hand; the tool has to
# rediscover all three without being told they exist. Anything less and the
# clusters are unfalsifiable, which is worse than having none, because the next
# wave would batch on them.
# --------------------------------------------------------------------------

FORWARDER_LO, FORWARDER_HI = 0x08071F88, 0x08072288
PROC_FIND_PROBE = "sub_08078150"       # a known member; the family is 29 wide
BITFIELD_PROBE = "sub_08045848"        # 5 x 44 bytes, one of them reordered


def validate(families, fuzzy, verbose=True):
    by_member = {}
    for fam in families:
        for m in fam["members"]:
            by_member[m["name"]] = (fam, int(m["addr"], 16))
    results = []

    # 1. The 41 forwarders at 0x08071F88-0x08072288 are four templates. They call
    #    eight different functions, so this fails loudly if callee names leak
    #    into the key.
    fwd = collections.Counter()
    for name, (fam, addr) in by_member.items():
        if FORWARDER_LO <= addr <= FORWARDER_HI:
            fwd[fam["id"]] += 1
    ok1 = 3 <= len(fwd) <= 5
    results.append(("forwarders 0x08071F88-0x08072288 -> ~4 clusters", ok1,
                    f"{len(fwd)} clusters, sizes {sorted(fwd.values(), reverse=True)}, "
                    f"{sum(fwd.values())}/41 clustered"))

    # 2. Proc_Find existence predicates: 29, scattered across 0x0801C7B4-0x0808AA88.
    #    docs/agbcc-codegen.md said 13 because 13 are adjacent.
    fam = by_member.get(PROC_FIND_PROBE, (None, 0))[0]
    n = fam["n_members"] if fam else 0
    span = f"{fam['members'][0]['addr']}-{fam['members'][-1]['addr']}" if fam else ""
    ok2 = n == 29
    results.append(("Proc_Find predicate family -> 29 members", ok2,
                    f"{n} members, {span}"))

    # 3. The 44-byte bitfield family must stay separate from unrelated 44-byte
    #    code. Size is not a shape and must not behave like one.
    fam = by_member.get(BITFIELD_PROBE, (None, 0))[0]
    n = fam["n_members"] if fam else 0
    same_size = sum(1 for f in families
                    for m in f["members"] if m["size"] == 44)
    fuzzy_n = 0
    for c in fuzzy:
        if any(m.startswith(BITFIELD_PROBE + "@") for m in c["members"]):
            fuzzy_n = c["n_members"]
    ok3 = n in (4, 5) and fuzzy_n in (0, 5)
    results.append(("44-byte bitfield family not merged by size", ok3,
                    f"exact {n} members (fuzzy tier {fuzzy_n}); "
                    f"{same_size} clustered 44-byte functions ROM-wide"))

    if verbose:
        print("\nvalidation -- rediscovering families found by hand")
        for label, ok, detail in results:
            print(f"  [{'PASS' if ok else 'FAIL'}] {label}\n         {detail}")
    return results


def cold_plan(families):
    """Families with nothing matched yet, biggest first."""
    return sorted((f for f in families if f["n_matched"] == 0),
                  key=lambda f: -f["n_members"])


def warm_plan(families):
    """Families with a matched exemplar and open members left, most open first.

    These are strictly cheaper than the cold list -- the shape is already solved
    and sitting in src/decomp/ -- and F000 alone is 71 open functions behind one
    four-line exemplar. Ranking only the cold families, which is the obvious
    reading of "still unmatched", would bury them.
    """
    return sorted((f for f in families
                   if f["exemplar_is_matched"] and f["n_unmatched"] > 0),
                  key=lambda f: -f["n_unmatched"])


def report(families, fuzzy):
    total = sum(f["n_members"] for f in families)
    unmatched = sum(f["n_unmatched"] for f in families)
    print(f"exact families (>= {MIN_MEMBERS} members): {len(families):,}")
    print(f"  members            {total:,}")
    print(f"  still unmatched    {unmatched:,}")
    print(f"  with a matched exemplar  "
          f"{sum(1 for f in families if f['exemplar_is_matched']):,}")
    print(f"fuzzy clusters (>= {MIN_FUZZY_INSNS} insns, joined across shapes): "
          f"{len(fuzzy):,}")

    print("\ntop families by size")
    for f in families[:20]:
        tag = "exemplar" if f["exemplar_is_matched"] else "cold"
        print(f"  {f['id']}  n={f['n_members']:3}  {f['n_unmatched']:3} open  "
              f"{f['n_insns']:3} insns  {tag:8}  {f['representative']:14} "
              f"{' '.join(f['shape'])[:70]}")

    print("\ntop entirely-unmatched families -- nothing worked out yet")
    for f in cold_plan(families)[:15]:
        axes = ", ".join(a["insn"] for a in f["varies"][:3]) or "identical bodies"
        print(f"  {f['id']}  n={f['n_members']:3}  {f['n_insns']:3} insns  "
              f"{f['representative']:14} sizes={f['sizes']}  varies: {axes}")

    print("\ntop families with a MATCHED exemplar -- cheaper than the above, "
          "ranked by open members")
    for f in warm_plan(families)[:15]:
        print(f"  {f['id']}  {f['n_unmatched']:3} open of {f['n_members']:3}  "
              f"{f['n_insns']:3} insns  {f['representative']:14} "
              f"-> {f['exemplar_src']}")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--min-members", type=int, default=MIN_MEMBERS)
    ap.add_argument("--no-fuzzy", action="store_true")
    ap.add_argument("--report", action="store_true")
    args = ap.parse_args()

    families, fuzzy, records = build(args.min_members, not args.no_fuzzy)
    checks = validate(families, fuzzy)

    cold, warm = cold_plan(families), warm_plan(families)

    def plan_entry(f):
        return {
            "id": f["id"], "n_members": f["n_members"],
            "n_unmatched": f["n_unmatched"], "n_insns": f["n_insns"],
            "sizes": f["sizes"], "representative": f["representative"],
            "exemplar_src": f["exemplar_src"],
            "addr_span": [f["members"][0]["addr"], f["members"][-1]["addr"]],
            "varies": [a["insn"] for a in f["varies"]],
            "members": [m["name"] for m in f["members"]
                        if m["status"] != "matched"],
        }

    payload = {
        "normalisation": {
            "base": "fe_signatures.signature() `full`, registers retained",
            "registers": "kept verbatim -- they encode argument position and "
                         "void-vs-value return; see tools/families.py docstring",
            "immediates": "erased",
            "callee_and_data_symbols": "erased",
            "local_branches": "delta in instruction indices",
            "literal_pool": "excluded from the key, reported under `varies`",
            "excluded": "BIOS stubs and awlib.is_trivial() return stubs",
            "min_insns": MIN_INSNS,
            "min_members": args.min_members,
            "fuzzy": {"min_insns": MIN_FUZZY_INSNS, "min_ratio": FUZZY_MIN_RATIO,
                      "max_len_delta": FUZZY_MAX_LEN_DELTA,
                      "compared_on": "register-erased token sequence"},
        },
        "validation": [{"check": c, "pass": ok, "detail": d} for c, ok, d in checks],
        "counts": {
            "families": len(families),
            "members": sum(f["n_members"] for f in families),
            "unmatched_members": sum(f["n_unmatched"] for f in families),
            "entirely_unmatched_families": len(cold),
            "fuzzy_clusters": len(fuzzy),
        },
        # The deliverable a wave brief is written from. Two lists because the
        # cheap batches and the entirely-untouched ones are different questions:
        # `with_exemplar` has the shape already solved in src/decomp/, `cold`
        # needs someone to solve it once.
        "batching_plan": {
            "cold": [plan_entry(f) for f in cold[:15]],
            "with_exemplar": [plan_entry(f) for f in warm[:15]],
        },
        "families": families,
        "fuzzy_clusters": fuzzy,
    }
    awlib.write_text(OUT, json.dumps(payload, indent=1) + "\n")
    print(f"\nwrote {os.path.relpath(OUT, awlib.REPO)}  "
          f"({len(families):,} families, {len(fuzzy):,} fuzzy clusters)")

    if args.report:
        print()
        report(families, fuzzy)
    return 0 if all(ok for _, ok, _ in checks) else 1


if __name__ == "__main__":
    sys.exit(main())
