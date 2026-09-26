# sub_08068A00

0x08068A00, 196 bytes, THUMB, parked.

Best score so far: 25.5%, -20 bytes.

## Files

- `sub_08068A00.c`: the current draft
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

25.5% identical, candidate 176 bytes (-20), first difference at +0x6 -- inside the switch's comparison tree. Re-measured by W59-E; unchanged since wave 36.

### What still differs

FOUR MISSING CASE PIVOTS, and nothing else. The ROM's decision tree tests nine values (0, 0x26, 0x4e, 0x58, 0x60, 0x62, 0x80, 0xb4, 0xc7) and roots at 0x4e; four of them (0x26, 0x4e, 0x58, 0x62) branch to the after-switch label, which is also the default target. Written as empty break arms agbcc emits only SIX pivots (0, 0x26, 0x60, 0x80, 0xb4, 0xc7) rooted at 0x60. Below the tree the diff is nothing but branch-target offsets: all five bodies, the gDispIo mask chain and both Decompress destinations assemble instruction-for-instruction.

### Why it is close

Every body is right and every constant agrees; the residual is entirely the dispatch tree. WAVE 59 (W59-E) ALSO CONFIRMED THE CASE ORDER POSITIVELY rather than assuming it: two probes differing only in the order of the case labels leave the comparison tree byte-identical and move only the body blocks, which come out in source order. The ROM's descending body order (0xc7, 0xb4, 0x80, 0x60, 0) plus its literal pool sitting immediately after the 0xc7 body therefore fix the original's case order as DESCENDING, which is how this draft is written.

### Already ruled out

- Wave 36 (W36-K): an explicit empty 'default: break;'. Identical six-pivot tree.
- Wave 36 (W36-K): giving each of the four dead arms a statement live at RTL-expansion time and deleted later (a store to an unused int local), aimed at group_case_nodes. Identical six-pivot tree, which rules out label-grouping as the mechanism.
- Wave 59 (W59-E): the four values grouped as consecutive labels on ONE break ('case 0x26: case 0x4e: case 0x58: case 0x62: break;'), which is the natural way a programmer writes 'these do nothing'. Byte-identical to four separate empty arms -- same six pivots, same root.
- Wave 59 (W59-E): arms that survive to expansion AND emit no code after jump optimisation -- 'case X: proc->unk2c--; return;', i.e. the tail duplicated so it cross-jumps rather than being deleted. This DOES keep all nine case nodes alive and emits all nine pivots, but the tree then roots at 0x60 (index 4), not the ROM's 0x4e (index 2), and each arm costs a live 'movs rD,#imm'. This was wave 36's stated 'next thing to try' and it is now measured and dead.
- Wave 59 (W59-E) -- THE STRUCTURAL RESULT THAT SHOULD STOP FURTHER ATTEMPTS. agbcc's tree root is a deterministic function of the case-node COUNT alone (measured on this function: 2 nodes -> root index 0, 3 -> 0, 4 -> 1, 6 -> 2, 9 -> 4; written up in docs/agbcc-codegen.md next to W59-A's source-order section). The ROM emits NINE pivots but roots at index 2, and nine live nodes root at index 4 every time. The ROM's right sub-tree (6 nodes -> 0x62) and left (2 nodes -> 0x26 over 0) both obey the table exactly; only the top split does not. So NO flat nine-case switch compiled by this toolchain produces this tree, however the empty arms are spelled -- the whole family of 'find the spelling that keeps the four dead nodes alive' attempts is retired. What remains open is what OTHER construct puts a case node's 'beq default' at the root; do not spend another wave on case-arm spellings.
- Wave 59 (W59-E): THE TOOLCHAIN. A throwaway data/compiler-overrides.json entry with cc1 old_agbcc and -fprologue-bugfix removed gives the SAME six-pivot tree at the same 25.5%, and additionally gets the gDispIo chain wrong (it emits 'movs r0,#1' before 'ldrb r1,[r2,#1]', where the ROM and default agbcc both load first). So old_agbcc is not the axis and is strictly worse here. Entry reverted.

### Wave 87

WAVE 87 (W87-A): pre-registered shared-label form (`case 0x4e: default: break;`, `default: case 0x4e:`, and all four dead values + `default:` on one break) REFUTED -- all three give the SAME six-pivot tree rooted at 0x60: `default:` is not a case node and cannot keep a dead node alive; the dead nodes are deleted before balance_case_nodes runs. Fifth spelling of 'keep the dead arms alive' across three waves, one identical tree; W59-E's closure stands. NEW INDEPENDENT STRUCTURAL RESULT: the ROM's LEFT subtree is rooted at 0x26 with 0 as its left child (cmp #0x26/beq default; cmp #0x26/bgt default; cmp #0/beq body0) -- balance_case_nodes only splits a sublist when i > 2, so a two-node sublist stays a chain tested head-first (0 first, blt default). Hence the sublist below 0x4e held THREE OR MORE case nodes of which only two survive as pivots: the original switch had MORE case values than the nine the tree tests. estimate_case_costs' cost-table path is unreachable (needs every value in [-1,127]; 0x80/0xb4/0xc7 are not). The top split cannot be an `if (x == 0x4e)` guard before an eight-case switch (eight nodes root at 0x60, and the ROM's second instruction is `cmp 0x4e / bgt`, a case node's own right branch). Live leads are about node COUNT: a construct leaving >= 3 nodes below 0x4e (a value in (0,0x26), a negative value, or a `case A ... B:` range). Configured, 176/196 (-20), 25.5%, unchanged, 0 try_match.
