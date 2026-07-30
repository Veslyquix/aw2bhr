#!/usr/bin/env python3
"""CFG-accurate symbolic execution of a straight-line THUMB listing.

Blocks are split at labels; predecessor exit states are JOINED (a register
whose value differs between predecessors becomes unknown) before a block is
interpreted. There are no back edges in the target, so one pass in address
order reaches the fixpoint.

    python w20b_cfg.py <listing.s>
"""
import re
import sys

COND = ("beq", "bne", "bgt", "bge", "blt", "ble", "bhi", "bls", "bcs", "bcc")


def simp(e):
    for _ in range(12):
        n = re.sub(r"\((-?\d+)\+(-?\d+)\)", lambda m: str(int(m.group(1)) + int(m.group(2))), e)
        n = re.sub(r"\((-?\d+)\*(-?\d+)\)", lambda m: str(int(m.group(1)) * int(m.group(2))), n)
        n = re.sub(r"\(([A-Za-z_0-9]+)\+0\)", r"\1", n)
        if n == e:
            break
        e = n
    return e


def fold(e):
    for _ in range(10):
        n = re.sub(r"H\[\(\(ROWS\)\+\(([^*]+?)\*2\)\)\]", r"ro[\1]", e)
        n = re.sub(r"H\[\(\(([^*]+?)\*2\)\+\(ROWS\)\)\]", r"ro[\1]", n)
        n = re.sub(r"H\[\(\(TILES\)\+\(([^\]]+?)\*2\)\)\]", r"cell[\1]", n)
        n = re.sub(r"H\[\(\(([^\]]+?)\*2\)\+\(TILES\)\)\]", r"cell[\1]", n)
        if n == e:
            break
        e = n
    e = e.replace("H[P]", "WIDTH").replace("H[(P+2)]", "HEIGHT")
    e = re.sub(r"u16\(\((.+)\+-134\)\*65536\)", r"BRIDGE(\1)", e)
    e = re.sub(r"u16\(\((.+)\+-(\d+)\)\*65536\)", r"NEAR(\1,\2)", e)
    e = re.sub(r"\+-(\d+)", r"-\1", e)
    return e


lines = [l.split("@")[0].rstrip() for l in open(sys.argv[1])]

pool = {}
for s in (l.strip() for l in lines):
    m = re.match(r"^(_[0-9A-Fa-f]+):\s*\.4byte\s+(\S+)$", s)
    if m:
        v = m.group(2)
        pool[m.group(1)] = ("P" if v == "gUnknown_08499590" else
                            "&P" if v == "gUnknown_0808D88C" else
                            str(int(v, 16)) if v.startswith("0x") else v)

# --- split into blocks -------------------------------------------------
blocks, order, cur, label = {}, [], [], "ENTRY"
jump_targets = []
for s in (l.strip() for l in lines):
    if not s or s.startswith("thumb_func") or s.startswith(".align"):
        continue
    m = re.match(r"^(_[0-9A-Fa-f]+|sub_[0-9A-Fa-f]+):\s*(.*)$", s)
    if m and not m.group(2).startswith(".4byte"):
        blocks[label] = cur
        order.append(label)
        label, cur = m.group(1), []
        if m.group(2).strip():
            cur.append(m.group(2).strip())
        continue
    mm = re.match(r"^\.4byte\s+(_[0-9A-Fa-f]+)$", s)
    if mm:
        jump_targets.append(mm.group(1))
        continue
    if s.startswith(".4byte") or re.match(r"^_[0-9A-Fa-f]+:\s*\.4byte", s):
        continue
    cur.append(s)
blocks[label] = cur
order.append(label)

# --- successors --------------------------------------------------------
succ = {}
for i, lb in enumerate(order):
    ins = blocks[lb]
    nxt = order[i + 1] if i + 1 < len(order) else None
    s = []
    terminal = False
    for x in ins:
        p = x.split()
        if p[0] in COND:
            s.append(p[1])
        elif p[0] == "b" and len(p) > 1:
            s.append(p[1])
            terminal = True
        elif p[0] == "bl" and p[1].startswith("_"):
            s.append(p[1])
            terminal = True
        elif p[0] in ("bx", "pop") and "pc" in x:
            terminal = True
        elif p[0] == "mov" and x.replace(" ", "").startswith("movpc"):
            s.extend(jump_targets)
            terminal = True
    if not terminal and nxt:
        s.append(nxt)
    succ[lb] = s

pred = {lb: [] for lb in order}
for lb, ss in succ.items():
    for t in ss:
        if t in pred:
            pred[t].append(lb)

# --- interpret ---------------------------------------------------------
entry_state = {lb: None for lb in order}
entry_state[order[0]] = {"r0": "x", "r1": "y"}
out = []

SCRATCH = ("r0", "r1", "r2", "r3", "ip", "lr")


def interp(ins, reg, emit):
    def g(r):
        return reg.get(r, "?" + r)

    def imm(v):
        return int(v[1:], 0)

    for s in ins:
        p = s.replace(",", " ").split()
        op = p[0]
        if op in ("adds", "add") and len(p) == 4 and p[3].startswith("#"):
            reg[p[1]] = simp("(%s+%d)" % (g(p[2]), imm(p[3])))
        elif op in ("adds", "add") and len(p) == 3 and p[2].startswith("#"):
            reg[p[1]] = simp("(%s+%d)" % (g(p[1]), imm(p[2])))
        elif op in ("adds", "add") and len(p) == 4:
            reg[p[1]] = simp("(%s+%s)" % (g(p[2]), g(p[3])))
        elif op in ("adds", "add") and len(p) == 3:
            reg[p[1]] = simp("(%s+%s)" % (g(p[1]), g(p[2])))
        elif op in ("subs", "sub") and len(p) == 4 and p[3].startswith("#"):
            reg[p[1]] = simp("(%s+-%d)" % (g(p[2]), imm(p[3])))
        elif op in ("subs", "sub") and len(p) == 3 and p[2].startswith("#"):
            reg[p[1]] = simp("(%s+-%d)" % (g(p[1]), imm(p[2])))
        elif op in ("subs", "sub") and len(p) == 4:
            reg[p[1]] = simp("(%s-%s)" % (g(p[2]), g(p[3])))
        elif op == "lsls" and len(p) == 4:
            reg[p[1]] = simp("(%s*%d)" % (g(p[2]), 2 ** imm(p[3])))
        elif op == "lsrs" and len(p) == 4:
            reg[p[1]] = ("u16(%s)" % g(p[2])) if imm(p[3]) == 0x10 else "(%s>>%d)" % (g(p[2]), imm(p[3]))
        elif op in ("mov", "movs") and len(p) == 3 and p[2].startswith("#"):
            reg[p[1]] = str(imm(p[2]))
        elif op in ("mov", "movs") and len(p) == 3:
            reg[p[1]] = g(p[2])
        elif op == "ldr" and len(p) == 3 and p[2].startswith("_"):
            reg[p[1]] = pool.get(p[2], p[2])
        elif op in ("ldr", "ldrh", "ldrb", "ldrsh") and "[" in s:
            inner = s[s.index("[") + 1:s.index("]")].replace(",", " ").split()
            base = g(inner[0])
            if len(inner) > 1 and inner[1].startswith("#"):
                addr = simp("(%s+%d)" % (base, imm(inner[1])))
            elif len(inner) > 1:
                addr = simp("(%s+%s)" % (base, g(inner[1])))
            else:
                addr = base
            tag = {"ldr": "W", "ldrh": "H", "ldrb": "B", "ldrsh": "SH"}[op]
            reg[p[1]] = "%s[%s]" % (tag, addr)
        elif op == "cmp":
            rhs = str(imm(p[2])) if p[2].startswith("#") else g(p[2])
            emit("    CMP   %s   ?   %s" % (fold(g(p[1])), fold(rhs)))
        elif op == "bl" and p[1].startswith("sub_"):
            emit("    CALL  %s(%s, %s)" % (p[1], fold(g("r0")), fold(g("r1"))))
            for k in SCRATCH:
                reg.pop(k, None)
            reg["r0"] = "RET"
        elif op == "bl":
            emit("    RETURN (far jump %s)" % p[1])
        elif op in COND or op == "b":
            emit("    %-4s  -> %s" % (op, p[1]))
        elif op == "ands":
            reg[p[1]] = simp("(%s&%s)" % (g(p[1]), g(p[2])))
            emit("    %s = %s" % (p[1], fold(reg[p[1]])))
        elif op in ("strh", "str", "strb") and "[" in s:
            inner = s[s.index("[") + 1:s.index("]")].replace(",", " ").split()
            emit("    STORE [%s] <- %s" % (fold(g(inner[0])), fold(g(p[1]))))
    return reg


for lb in order:
    st = entry_state[lb]
    if st is None and lb != order[0]:
        # unreachable (e.g. the jump-table data block): do not let its empty
        # state poison the join of whatever it physically precedes
        out.append("")
        out.append("%s:   [data / unreachable]" % lb)
        continue
    if st is None:
        st = {}
    # name the three anchors so fold() can see them
    reg = dict(st)
    out.append("")
    out.append("%s:" % lb)
    buf = []
    # pre-tag anchors
    for r, v in list(reg.items()):
        pass
    reg2 = dict(reg)

    def emit(x, buf=buf):
        buf.append(x)

    # rewrite anchor expressions on the fly
    exit_state = interp(blocks[lb], reg2, emit)
    # anchor substitution for display
    txt = "\n".join(buf)
    txt = txt.replace("(W[P]+16762)", "(ROWS)").replace("(W[P]+2594)", "(TILES)")
    out.extend(txt.split("\n") if txt else [])
    for t in succ[lb]:
        if t in entry_state:
            if entry_state[t] is None:
                entry_state[t] = dict(exit_state)
            else:
                cur = entry_state[t]
                entry_state[t] = {k: v for k, v in cur.items()
                                  if k in exit_state and exit_state[k] == v}

res = "\n".join(out)
res = res.replace("(W[P]+16762)", "(ROWS)").replace("(W[P]+2594)", "(TILES)")
for _ in range(10):
    n = fold(res)
    if n == res:
        break
    res = n
res = res.replace("W[P]", "p")
print(re.sub(r"\n\s*\n+", "\n\n", res))
