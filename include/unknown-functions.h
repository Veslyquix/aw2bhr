#ifndef UNKNOWN_FUNCS_H
#define UNKNOWN_FUNCS_H

#include "global.h"

/* These eight take a 32-bit first argument, not the s16 they were declared with
 * until wave 7. All eight open with a bare `adds r4, r0, #0` and no extension,
 * and the ROM's own ARM PROMOTE_MODE zero-extends any sub-word parameter that
 * has to survive a call -- `s16` compiles to `adds r4, r0, #0; lsl #16; lsr #16`
 * and cannot match. Their callers in proc.c pass `dataImm`, which is s16, so
 * the caller side is unaffected either way. */
void sub_08011550(int);
void sub_0801156C(int);
void sub_08011588(int);
void sub_080115B4(int);
void sub_080115E0(int, ProcPtr);
void sub_080115F8(int, ProcPtr);
void sub_08011610(int, ProcPtr);
void sub_0801163C(int, ProcPtr);
/* Same shape and the same `int` argument as the eight above: both are
 * `adds r4, r0, #0` / `ldr r0,=<script>` / `movs r1,#3` / `bl Proc_Start` /
 * `strh r4,[r0,#0x64]`, with no narrowing on the saved argument. Both end
 * `pop {r4}; pop {r0}`, so both are void. */
void sub_08011668(int);
void sub_08011684(int);
/* What that `int` IS, since ten functions now carry it: a fade SPEED, in
 * per-frame units, and not a channel or layer mask. gUnknown_0848923C's script
 * is `CALL sub_08011054; SLEEP; REPEAT sub_080110A4`, and Proc_Start runs the
 * script to its first block BEFORE returning (src/proc.c: `RunProcessScript`
 * sits inside Proc_Start), so the CALL's own `unk64 = 0x100` is a DEFAULT that
 * the caller's `strh r4,[r0,#0x64]` then overwrites. Each frame sub_080110A4
 * does `unk66 += unk64`, clamps at 0x1000, and publishes
 * `gUnknown_03001FFC = (s16)unk66 >> 8` -- the 0..0x10 blend coefficient. So
 * the fade runs for 0x1000/arg frames, and the 4 / 0x10 / 0x40 that the
 * wrappers at 0x08071F88-0x08072040 pass are a slow / normal / fast ladder.
 * (Unproven: whether the value is meant to be read as 8.8 fixed point. The
 * accumulator is, but nothing narrows the argument to 16 bits.) */
/* `Proc_Find` on each of the four scripts the starters above run --
 * 084892C4, 0848929C, 0848925C, 0848923C -- returning 1 if any is alive and 0
 * otherwise, i.e. "a fade is in progress". `bool8` and not `int`: its only
 * caller, sub_08072288, narrows the result with `lsls r0, r0, #0x18` before
 * `cmp r0, #0`, and an int-wide return emits no such shift. */
bool8 sub_080116A0(void);
void Decompress(u8 *, void *);

/* Two leaves in the 0x08000-0x08004 block, both reached from the wrapper family
 * at 0x08004A60-0x08004B6C. sub_08000654 is already promoted in
 * src/decomp/c_08000654.c as void(void). sub_08004A30 takes an `int`: its
 * prologue is a bare `adds r4, r0, #0` with no narrowing, which PROMOTE_MODE
 * makes `int` and not a narrow type (a u8/u16 parameter surviving a `bl` would
 * carry `lsl #24; lsr #24` / `lsl #16; lsr #16`), and sub_08004A90 passes -1,
 * which fixes the sign. It ends `pop {r4}; pop {r0}; bx r0`, so it is void. */
void sub_08000654(void);
void sub_08004A30(int);
/* A sixteen-byte halfword fill in the same block, and the whole body is
 * readable: `cmp r1,#0; ble out; loop: strh r2,[r0]; adds r0,#2; subs r1,#1;
 * bgt loop`. So r0 is a `u16 *` (the `strh` with a +2 stride), r1 is a SIGNED
 * count (`ble`/`bgt`, and the zero-trip test is signed), and r2 is the halfword
 * written. Its one caller, sub_08072A88, passes a VRAM char-block address, 0x10
 * and 0 -- all three arguments are constants or an address there, so the widths
 * are byte-neutral at that call site and only the body constrains them.
 *
 * And the body rules the third one OUT as `u16`, which this was declared as
 * for part of wave 21. PROMOTE_MODE emits the `lsl #16; lsr #16` in the
 * PROLOGUE for a sub-word parameter, unconditionally -- it does NOT get
 * deleted when the only use is a `strh` that discards the upper half. A `u16`
 * third parameter compiles this function to 20 bytes; the ROM is 16 and its
 * prologue is bare. So `int`, and the sign stays undetermined because the one
 * call site passes 0. Both functions are matched, which pins it. */
void sub_08001148(u16 *, int, int);

/* Two builders of the same gUnknown_030044B0 command block, both handing it to
 * sub_080308B4 at the end and both void (`pop {r0}; bx r0`).
 *
 * In each, the argument that indexes gUnknown_08499594 is the one narrowed at
 * entry with `lsls #0x18; lsrs #0x18` -- sub_08034534's second and
 * sub_080344B4's first -- so those two are `u8` and the rest are `int`. That
 * pair is the whole type readout: every other parameter reaches memory through
 * a bare `strb` into the block (+0, +1, +6, +7), which is byte-identical for
 * `int` and `u8` alike, so `int` is the weakest model that fits. sub_08034534's
 * first parameter is a command id (sub_0802CFFC passes 2) and is the field
 * sub_080344B4 hard-codes to 8. Verified at sub_0802CFFC, which calls both. */
/* Wave 30, W30-A retypes the third and fourth parameters from `int` to `u8`.
 * sub_08041E48 passes two whole-word proc members and the ROM narrows each with
 * `lsls #0x18; lsrs #0x18` before the `bl` -- 8 bytes that an `int` parameter
 * does not emit. The previous `int, int` was never evidence: the only other
 * caller, src/decomp/c_0802CFFC.c, passes two literal zeros, which are
 * byte-identical at any width. */
void sub_08034534(int, u8, u8, u8);
void sub_080344B4(u8, int, int);
/* Definition promoted in src/decomp/c_080308B4.c; its body copies src[0..19]
 * into the 0x08090CD8 ring, so the block is 20 bytes. */
void sub_080308B4(u8 *);

void sub_08012358(void);
/* Unprototyped: only ever called, never with a settled signature. r0 selects
 * among three cases and r1 is forwarded; fill this in when it is matched. */
void sub_0801BB10();
void sub_0801237C(void);
void sub_08012C58(void *); // possibly "SetupBackgrounds"

/* The two halves of the 16-slot callback list on gUnknown_03000000/0808E518:
 * sub_08011B34 inserts, sub_08011B5C removes. Both take the entry as `void *`
 * -- that is how c_08011B34.c already defines it -- so call sites registering
 * a function have to cast. */
void sub_08011B34(void *);
/* A gUnknown_03000000 list entry, registered by ADDRESS through
 * sub_08011B34 by sub_0807420C and never called directly, so `void (void)`
 * comes from the registration; corroborated by its own bytes -- `push {lr}`,
 * `pop {r0}`, and it reads no argument register (wave 28, W28-B). */
void sub_08037F1C(void);
void sub_08011B5C(void *);
/* The same "register an entry" shape on the 16-slot gUnknown_03002FA0 list, and
 * already defined this way in src/decomp/c_08011AAC.c. Its only two callers
 * (sub_0802C260, sub_0802C270) register a FUNCTION by address, so they cast --
 * exactly as the note on sub_08011B34 above describes. */
void sub_08011AAC(void *);
/* Registered by address through sub_08011AAC and never called directly, so
 * `void (void)` comes from the registration and not from a call site. Both end
 * `pop {r0}; bx r0` and neither reads an argument register. */
void sub_080184A4(void);
void sub_080184C8(void);
/* Three more entries named only by ADDRESS through that pair of lists, so the
 * `void (void)` again comes from the registration and not from a call site --
 * but here it is corroborated by a definition rather than only by the callee's
 * own bytes: sub_080111BC (src/decomp/c_080111BC.c), sub_08012A34
 * (src/decomp/c_08012A24.c) and sub_08049BAC (src/decomp/c_08049BAC.c) are all
 * already promoted as void(void). Declared here because the wrappers that
 * register them -- sub_080111AC and sub_08012A74 via sub_08011AAC,
 * sub_08049B70 via sub_08011B34 -- live in other translation units and need
 * the symbol visible to take its address. */
void sub_080111BC(void);
void sub_08012A34(void);
void sub_08049BAC(void);
/* The fourth: removed from the gUnknown_03000000 list by sub_08037780 through
 * sub_08011B5C. Not promoted yet, so `void (void)` is read off its own bytes --
 * `push {lr}` ... `pop {r0}; bx r0` (void, per the epilogue rule in
 * docs/agbcc-codegen.md) and no argument register is read before the first
 * write to it. */
void sub_08037790(void);

/* The gUnknown_0200C528 list pair. sub_080193B0 installs a script: it allocates
 * a slot, stores the script pointer into .unk00 and .unk04 and returns
 * &gUnknown_0200C528[i], or 0 when sub_08019290 reports -1 -- both arms end
 * `pop {r1}; bx r1`, so it returns a value. sub_0801930C removes every slot
 * whose .unk00 equals the argument and always returns -1. The argument is a
 * `const u8 *` because that is how the scripts it is handed (gUnknown_0849A8F0
 * and friends) are declared; nothing dereferences it here. */
struct Unk0200C528 *sub_080193B0(const u8 *);
int sub_0801930C(const u8 *);

/* `bl sub_0801537C` on gUnknown_0848A42C and nothing else. It ends
 * `pop {r1}; bx r1`, so it returns a value, and the value is sub_0801537C's --
 * a gUnknown_03001470 slot index narrowed with `lsls #0x18; asrs #0x18`, or -1
 * when the scan falls off the end. Only the non-void-ness is proved here: every
 * caller found so far (eleven in the 0x08004xxx wrapper family alone) discards
 * the result, so the width is inherited from the forwarded callee and nothing
 * in the tree contradicts or confirms it yet.
 * `int`, not the `s8` it carried until wave 12, and sub_0801537C had to move
 * with it -- the two are one decision, written up in full on sub_0801537C's
 * declaration below. Short version: with an `s8` callee agbcc re-narrows at the
 * `bl` and this function comes out four bytes too long; `int` on both sides
 * matches (work/sub_0801A168/). The one thing the ROM does NOT settle is
 * whether the source said `return` at all -- `s8 f(void) { sub_0801537C(g); }`,
 * with the keyword missing, is byte-identical -- so this is the natural-C
 * reading rather than a proof, and it is byte-neutral for every existing
 * caller either way. */
int sub_0801A168(void);

/* `pop {r0}; bx r0`, so void. The parameter is the address of a record like
 * gUnknown_030013D0 -- see that global's comment for the offsets. `void *` and
 * not a struct pointer: this is the weakest declaration that gives a clean
 * pool word at the two call sites (sub_080251AC passes gUnknown_030013D0 by
 * name, sub_080250E8 passes it and `*gUnknown_08090A40`), and the record's
 * extent is not settled. Not `const void *` -- the body writes +0x04 of the
 * pointer at +0x00. */
void sub_0802505C(void *);
/* `pop {r0}; bx r0`, so void. Four callers, all in family F000 and all passing
 * a POOL CONSTANT (0xC9A/0xC9B/0xC9C/0xC9D), which per docs/agbcc-codegen.md
 * cannot discriminate parameter width at all -- `int`, `u32` and `u16` are the
 * same `ldr r0,=imm` and even `s16` is, for a positive constant that fits. So
 * the declaration is chosen to be the one that is never wrong at a call site.
 * The callee's own prologue is `adds r5, r0, #0` THEN `lsls r5,#0x10;
 * lsrs r5,#0x10`, and the split copy is the reason `u16` is not claimed: a
 * genuine `u16` parameter narrows straight into its home register in one step
 * (compare sub_0803B524's `lsls r0,#0x10; lsrs r4,r0,#0x10`). The narrowed
 * value feeds sub_080146D4's fourth argument, which the doc's "a prologue
 * narrowing is not a parameter-width tell when the narrowed value feeds
 * another call" rule says to read as a cast at a use. Note the raw r0 is dead
 * across the following `bl sub_0802D33C`: that callee takes no arguments (it
 * loads gUnknown_0848A42C into r0 as its first instruction), so the leftover
 * is not evidence of a forwarded argument. */
void sub_0802D35C(int);
/* `int`, not a narrow type: the prologue saves the argument with a bare
 * `adds r6, r0, #0` and it survives four calls, which PROMOTE_MODE would have
 * narrowed for any sub-word parameter. Only ever called as 0 (sub_0802C0CC) or
 * 1 (sub_0802C0D8), and each value picks a different sub_0803B4DC sound id.
 * `pop {r0}; bx r0`, so void. */
void sub_0802BFD0(int);

/* `int`, not `s16` -- the same correction wave 7 made to the eight starters
 * above, and for the same reason. Both open with a bare `adds r4, r0, #0`;
 * declaring the parameter `s16` adds `lsl #16; lsr #16` (PROMOTE_MODE widening
 * a narrow parameter that has to survive the `bl`) and cannot match. Their only
 * call sites are ProcCmd_1D_0801D0E4/ProcCmd_1E_0801D104 in proc.c, which pass
 * `dataImm` -- already sign-extended by its `ldrsh`, so the caller side emits
 * the same code either way. */
void sub_08013098(int, ProcPtr);
void sub_080130B0(int, ProcPtr);
/* Starts gUnknown_0848936C and stashes three halfwords at +0x64/+0x66/+0x68 of
 * the new proc; a NULL fourth argument selects Proc_Start on tree 3 over
 * Proc_StartBlocking. The three values are bare `strh` stores, which fixes them
 * at >= 16 bits and no further. */
void sub_080130DC(int, int, int, ProcPtr);
/* Same shape on gUnknown_084893AC: arg 0 indexes gUnknown_0848950C by words
 * into +0x4c, arg 1 is a halfword at +0x44, arg 2 is the parent-or-NULL. */
void sub_08013338(int, int, ProcPtr);
void sub_08013AEC(void);
void sub_08013C00(void);
void sub_08024268(void);
/* Registered by address into the gUnknown_03000000 callback list, never called
 * directly, so `void (void)` comes from the list and not from a call site. */
void sub_080246B4(void);
void sub_08024720(void);

/* The halfword CpuSet wrapper ApplyPaletteExt and sub_080135F4 both forward to:
 * `lsls r2,#0x10; lsrs r2,#0x11; bl CpuSet`, i.e. it halves a u16 byte count
 * into CpuSet's word/halfword count. The THIRD parameter is u16 -- the entry
 * narrowing is PROMOTE_MODE on a declared-narrow parameter, and it is also
 * what would make a caller with a WIDER third parameter emit `lsls #0x10;
 * lsrs #0x10` in front of the call -- see the ApplyPaletteExt note below, which
 * is exactly that case read backwards (wave 20, W20-C). */
void sub_08011C58(const void *, void *, u16);
/* Both `void (void)`. sub_0801F00C is matched and is three instructions --
 * `gUnknown_03001FE0 = 1` and `bx lr`, no argument register read. sub_08036B4C
 * opens `push {r4,lr}; ldr r0,=gUnknown_030040A0; movs r4,#0` and never reads
 * r0-r3; it ends `pop {r0}`. Named by sub_08036C4C / sub_08036C80 (wave 20,
 * W20-C). */
void sub_0801F00C(void);
void sub_08036B4C(void);
void sub_080135A4(void);
/* THE THIRD PARAMETER IS u16, NOT u32 (wave 20, W20-C). ApplyPaletteExt is one
 * of a family of four byte-identical palette wrappers -- sub_080135F4,
 * sub_08013640, sub_08013664 and this one -- and the other three are now
 * MATCHED, all with `u16`. The readout: the entry `lsls r2,#0x10; lsrs
 * r2,#0x10` is PROMOTE_MODE on a declared-narrow parameter and therefore sits
 * at the TOP of the function, ahead of the gPal address arithmetic. Declared
 * `u32`, the same two instructions still appear -- they are the conversion to
 * sub_08011C58's u16 third parameter -- but they land AFTER the address work,
 * at the call, which is one instruction pair in the wrong place and the only
 * difference between the two spellings. Every call site in the tree passes a
 * constant, so narrowing costs nothing at any of them; the 12 promoted callers
 * were re-verified after the change. */
void ApplyPaletteExt(u16 *, u32, u16);
void sub_080136C4(void);
void sub_080137AC(s32);
void sub_080139C4(s32);

/* SUSPECT DECLARATION -- the first parameter is almost certainly
 * `const void *`, not `s32`, and this is left alone only because changing it
 * needs an edit to src/proc.c that cannot be verified without a full build.
 * The evidence, gathered in wave 12:
 *   - the body is the structural twin of sub_080152EC below (allocate a
 *     gUnknown_03001470 slot with sub_08015BD0, then forward the UNTOUCHED r0
 *     to sub_08015224 / sub_0801527C), and sub_080152EC's first parameter is
 *     settled as `const void *`;
 *   - every one of its six wrapper call sites (sub_0802A514, sub_0802A538,
 *     sub_0802A7B0, sub_080364E0, sub_0803B240, sub_08049B14) passes a ROM
 *     script-blob SYMBOL, declared `const u8 []`;
 *   - two of those blobs (0849A108, 0849E6D4) are stopped by
 *     sub_0801537C(const void *) on the same symbol, so the two ends of the
 *     pair disagree about the type of one object;
 *   - the only caller that is not a wrapper, proc.c's ProcCmd_19_0801D214,
 *     reaches the argument as `(s32)p->proc_scrUnk->dataPtr` -- a pointer the
 *     source had to cast to satisfy this declaration.
 * The cost of leaving it is one `(s32)` cast in each of the six wrappers; the
 * cast is byte-neutral (`ldr r0,=gSym` either way), so nothing is blocked.
 * To fix it: change the parameter here, drop the `(s32)` in proc.c and in the
 * six wrappers, then `make SPLIT=1 compare` -- proc.c is a multi-function file
 * so per-function trymatch is not a sufficient check.
 *
 * The RETURN type is wrong too, and independently of the above: the function
 * ends `adds r0, r4, #0; pop {r4, r5, r6}; pop {r1}; bx r1`, and `pop {r1}` is
 * the returns-a-value epilogue (docs/agbcc-codegen.md). The value is r4, i.e.
 * sub_08015BD0's slot index kept as `lsls #0x18; asrs #0x18`, so `s8` -- the
 * same readout that types sub_08015BD0 and sub_0801537C. This half is
 * byte-neutral for every caller in the tree, because all of them (proc.c and
 * the six wrappers alike) discard the result and a discarded return emits no
 * narrowing.
 *
 * FIXED IN WAVE 25, and the note above was wrong about needing to wait for the
 * parameter. `s32` is not a problem to solve: every one of the eight call
 * sites already passes a pointer through an explicit `(s32)` cast, which is
 * byte-neutral, and the body casts it back with `(const void *)`. So the
 * return type was the only thing blocking sub_080152C0, and it can be fixed
 * ALONE. Verified by reading all eight call sites -- seven in src/decomp plus
 * src/proc.c:1079 -- every one a bare expression statement discarding the
 * result. src/proc.c is NOT edited by this change; only this line moves. */
s8 sub_080152C0(s32, u8);
/* Allocates a gUnknown_03001470 slot and returns &gUnknown_03001470[i], or NULL
 * when sub_08015BD0 reports -1. Second parameter is `u8`: the prologue is
 * `lsls r1,#0x18; lsrs r1,#0x18`, which the table in docs/agbcc-codegen.md
 * gives as a narrow parameter widened for a call. Callers store a u16 through
 * the result at +0x20 (sub_08035144, sub_08042B84). 86 callers. */
struct Unk03001470 *sub_080152EC(const void *, u8);
/* The remover for the same list. It walks all 0x1e slots of
 * gUnknown_03001470 looking for the one whose .unk00 word equals the argument,
 * calls sub_08015328 on that index and returns it as `lsls #0x18; asrs #0x18`,
 * or -1 off the end of the scan -- so `s8`, exactly the readout that already
 * types its forwarder sub_0801A168 above (which is `bl sub_0801537C` and
 * nothing else). Parameter is `const void *` for the same reason
 * sub_080152EC's is: the argument is always a ROM script blob, and the pairing
 * proves it -- 0849A108, 0849D41C, 0849D55C, 0849E6D4 and 084C2198 each have a
 * sub_080152C0/sub_080152EC starter and a sub_0801537C stopper naming the same
 * symbol (see the gUnknown_0849A108 comment in unknown-globals.h). Nothing
 * here dereferences it.
 *
 * THE RETURN WIDTH IS NOT CONSTRAINED BY ANYTHING IN THE ROM, and the line
 * above used to say only "not constrained by the nine F000 wrappers -- all
 * nine discard the result". Wave 12 checked the one caller that does NOT
 * discard it, sub_0801A168 (`push {lr}; ldr r0,=0848A42C; bl sub_0801537C;
 * pop {r1}; bx r1`, sixteen bytes with no shift in it), expecting that to
 * settle the question. It does not, and the reason is worth knowing:
 *
 *   - agbcc RE-NARROWS a narrow-returning callee's result AT THE CALL SITE.
 *     With `s8` here, `return sub_0801537C(g);` emits `lsl #0x18; asr #0x18`
 *     after the `bl` whatever the caller's own return type is -- probed with
 *     `int` and `s8` returns and with an `s8` local in between, all three.
 *     So the natural `return <call>;` spelling needs `int` here, and `int` on
 *     sub_0801A168 as well.
 *   - BUT `s8 sub_0801A168(void)` with the `return` keyword simply ABSENT is
 *     byte-identical: the callee's result is already in r0, so falling off the
 *     end of a non-void function emits `pop {r1}; bx r1` and nothing else --
 *     and agbcc does not warn about it even under -Werror.
 *
 * Two source spellings, one byte sequence, opposite conclusions about this
 * declaration. Wave 12 took the `int` side and retyped both, because it is the
 * only spelling that is valid, warning-free, non-UB C for a function whose
 * whole body forwards a value -- not because the ROM decides. The change is
 * byte-neutral everywhere else: every other caller of sub_0801537C in the ROM
 * discards the result, no file in src/ calls it at all, and its own body
 * matches under either declaration (the `lsls #0x18; asrs #0x18` on the index
 * is `return (s8)i;` under `int` just as it is `return i;` under `s8`).
 * Verified by recompiling all 20 promoted src/ files that name any touched
 * symbol -- zero failures.
 * If you are matching sub_0801537C itself and this line fights you, the
 * counter-evidence you need is a caller that NARROWS its result; there is none
 * in the ROM today, and finding one flips both lines back. */
int sub_0801537C(const void *);
s8 sub_08015BD0(s32);
/* Three whole-list sweeps over gUnknown_0200E438, each reached only through a
 * bare `push {lr}; bl <it>; pop {r0}` forwarder (sub_08015544, sub_08015550,
 * sub_0801555C). None of them reads r0-r3 and all three end `pop {r0}; bx r0`,
 * so all three are void(void) -- which is also what makes their forwarders
 * argument-free. */
void sub_0801D8B4(void);
void sub_0801DED8(void);
void sub_0801DF20(void);
/* The heap pair on gUnknown_03000050. sub_08014E44 returns the block (its
 * epilogue is `pop {r1}; bx r1`) or NULL when no arena is installed;
 * sub_08014ED4 releases one and is `pop {r0}; bx r0`, i.e. void. */
void *sub_08014E44(int);
void sub_08014ED4(void *);

/* A pair always called together on the same object, each `(ptr, u8 flag)` and
 * each returning an accumulated total in r0. The pointer is left `void *`
 * because the struct it walks (bytes at +0, +4, +6, a 4-bit and a 7-bit field)
 * is not modelled anywhere yet; sub_08044518 only forwards it. */
int sub_08029978(void *, u8);
int sub_08029A48(void *, u8);
/* Both parameters are `s16`: the prologue sign-extends r0 and r1 with
 * `lsls #16; asrs #16` before forwarding to sub_080290B0. */
void sub_08029088(s16, s16);

void sub_0801BD00(s32, s32, void *, s32);
/* Only referenced as a value, by sub_0801F4A4 storing it in gUnknown_030013EC.
 * Its assembly takes five arguments (r0-r3 plus one halfword on the stack), but
 * nothing calls it, so the argument list is left unprototyped rather than
 * guessed -- fill it in when sub_0801F4B4 itself is matched.
 */
void sub_0801F4B4();
void PutSprite(u32, u32, u32, u16 *, u32);
void PutSpriteExt(u32, u32, u32, u16 *, u32);

void SetObjAffine(s32 index, s16 pa, s16 pb, s16 pc, s16 pd);

void sub_08030ED4(void);

/* The gUnknown_085D3DD0 lookup family. Every one of them is
 * `if (!gUnknown_03003FC0.unk08) return <fallback>; return <table entry>;` and
 * each has a one-line forwarder next to it that supplies (unk1d, unk1e) out of
 * gUnknown_08499598. sub_08042F34 and sub_08042F7C IGNORE their second
 * argument -- it is still declared, because their forwarders load and pass it.
 */
int sub_08042DCC(int);
/* `int` and not `u8`, even though its body is a bare `ldrb`. The conclusion
 * stands but the evidence recorded here and in src/decomp/c_08042E18.c was the
 * WRONG CALLER, corrected in wave 12: sub_08042DFC is a bare
 * `bl sub_08042E18; pop {r1}; bx r1` tail forwarder, and for those a missing
 * `return` keyword is byte-identical to `return <call>;` with an int-wide
 * callee, so it proves nothing (see the forwarding carve-out in
 * docs/agbcc-codegen.md). What actually pins it is the OTHER caller,
 * sub_0807F630: `bl sub_08042E18; adds r1, r0, #0; bl sub_08026AC0` re-passes
 * the result as an argument with no narrowing, and a `u8` return would have put
 * `lsls #24; lsrs #24` in that gap. */
int sub_08042E18(int);
int sub_08042E2C(int, int);
int sub_08042E84(int, int);
int sub_08042EDC(int, int);
int sub_08042F34(int, int);
int sub_08042F7C(int, int);
int sub_08042FC4(int, int);
u32 sub_0804301C(int, int);

/* Parameter is `u8` -- prologue narrows r0 with `lsls #24; lsrs #24` before the
 * value survives a call. Ends `pop {r0}; bx r0`, so void. */
void sub_08035144(u8);

void sub_08039F58(void);

/* Reads bit `id` of one of three bit arrays chosen by range. `int`, not a
 * narrow type: sub_080485C4 tests the result with a bare `cmp r0, #0` and no
 * `lsls #24`, which a bool8 return would have forced. */
int sub_0803CBD8(int);

/* The gUnknown_02028030 single-bit readers -- `return (1 << (id & 7)) & base[id >> 3];`
 * one per byte range of the struct (unk10, unk2a, unk2d ...). Their return type
 * is EIGHT BITS WIDE, not `int`: every caller in the 0x0803C354-0x0803C670
 * predicate block narrows the result with `lsls r0, r0, #0x18` before testing
 * it, and an `int` return emits no such shift. This is the opposite reading
 * from sub_0803CBD8 four lines up, whose callers test with a bare `cmp r0, #0`
 * -- the two live side by side in the same functions (sub_0803C48C calls
 * sub_0803CAB8 with the shift and sub_0803CBD8 without), which is as direct a
 * control as this file has.
 * `u8` and not `bool8`, because the value returned is the mask bit itself
 * (0 or 1 << n), never normalised to 0/1. The declared width is all that
 * matters to codegen; the promoted definitions in src/decomp/c_0803CA9C.c and
 * c_0803CAD4.c were re-typed to `u8` and still match byte-for-byte, because the
 * `ldrb`-derived operand already has nonzero_bits <= 0xff so the narrowing is a
 * no-op. sub_0803CAF0/CB0C/CB24/CB74 are the same family and the same rule
 * applies to them; they are left out here only because nothing declared needs
 * them yet. */
u8 sub_0803CA9C(u32);
u8 sub_0803CAB8(u32);
u8 sub_0803CAD4(u32);
/* Same family, same `lsls #24` evidence: sub_0803C658 narrows its result before
 * testing it. The definition in src/decomp/c_0803CAF0.c was re-typed from `int`
 * to `u8` when this was added and still matches byte-for-byte, exactly as the
 * paragraph above predicts. sub_0803CB0C in the same file is left `int` only
 * because nothing declared needs it yet. */
u8 sub_0803CAF0(u32);
/* Same family, but reached through sub_080206B0 rather than indexing directly;
 * still unmatched. The argument is passed straight through to sub_080206B0 --
 * sub_0803CA70 opens `adds r3, r0, #0` (a dead save of the incoming parameter)
 * -- and the callers in the predicate block forward their own first parameter
 * without touching r0, so the width is unconstrained; `u32` matches the rest of
 * the family. The `u8` return is pinned by the same `lsls #24` evidence. */
u8 sub_0803CA70(u32);
/* Three one-line readers of gUnknown_03003F30's bytes +1, +3 and +5, already
 * promoted as `u8` in src/decomp/c_0803BC7C.c and declared here for the first
 * time in wave 19 because the 0x08083 sprite builders need them. The `u8` is
 * corroborated on the CALLER side by the same evidence as the family above:
 * sub_080831FC / sub_08083484 / sub_08083738 each narrow the result with a bare
 * `lsls r0, r0, #0x18` before `cmp r0, #0`, which an `int` return would not
 * emit. Declared to match the promoted definitions, not against them. */
/* Two more of the 0x08079xxx proc helpers, both void and both taking TWO
 * arguments with the FIRST unused in the body: sub_080795A8 opens
 * `adds r4, r1, #0` and then writes r0 before reading it, so the proc pointer
 * its caller leaves sitting in r0 costs nothing and is not evidence of arity --
 * the `movs r1, #0` is. sub_08079EA4 is the caller for both.
 *
 * sub_08079B38 IS NOT A REAL SYMBOL YET, and nothing may be promoted against it
 * until it is. 0x08079B38 is a genuine function entry that tools/split_asm.py
 * merged into sub_08079B04 -- see "bl to a mid-function local label is NOT a
 * tell" in docs/agbcc-codegen.md -- so `asm/` defines it only as the LOCAL label
 * `_08079B38` and no global symbol exists at that address in either build. A C
 * caller therefore cannot link against it. Declared here so the blocker is
 * recorded next to the thing that trips over it; see data/parked.json for
 * sub_08079EA4. */
/* sub_08072B54 copies BOTH arguments to callee-saved registers and then narrows
 * the first with `lsls #16; asrs #16` before handing it to sub_0803B4DC -- which
 * is copy-then-narrow, i.e. an `int` parameter with a cast at a use, not an s16
 * parameter. The second is forwarded unnarrowed. sub_08075AC4 likewise takes two
 * word arguments; its only caller passes an `ldrsh` member and a literal, which
 * constrains neither width, so both stay `int`. */
void sub_08072B54(int, int);

/* A one-line palette poke: `(x & 0x1f) / 2` indexes the u16 ROM table
 * gUnknown_081D1624, the entry goes into gPal + 0xb2, and sub_080135A4 flushes
 * it -- so the argument is a 5-bit animation phase and the halving is why the
 * table has sixteen entries for thirty-two phases. `int` because nothing is
 * narrowed at entry and its only caller, sub_08075368, passes the `int` proc
 * field +0x40 and the literal 0x18; a narrow declaration would be
 * indistinguishable at the callee (PROMOTE_MODE) and would make that caller
 * re-narrow. `pop {r0}; bx r0` -> void. */
void sub_08075340(int);
void sub_08075AC4(int, int);
void sub_080795A8(ProcPtr, int);
void sub_08079B38(ProcPtr, int);
u8 sub_0803BC7C(void);
u8 sub_0803BC88(void);
u8 sub_0803BC94(void);
int sub_08044374(int);

bool8 sub_0803B18C(void);
/* `int`, not the `s16` these carried until wave 11. Both prologues narrow r0
 * (`lsl #16; asr #16` in sub_0803B4DC, `lsl #16; lsr #16` in sub_0803B524),
 * which reads as a narrow parameter -- but those are conversions at the USE
 * site inside the body (sub_0803B4DC forwards to sub_0803B48C, sub_0803B524
 * needs both `(u16)a` and `(s16)a`), not PROMOTE_MODE on the parameter. The
 * discriminator is on the caller side: sub_08016104 and sub_08016130 pass a
 * u16 read out of a script stream with a bare `ldrh r0, [r0, #4]`, and an
 * `s16` parameter folds that whole thing into `movs r1,#4; ldrsh r0,[r0,r1]`
 * -- 2 bytes longer and impossible to reach any other way.
 * Safe for the existing call sites, verified by probe: proc.c's
 * ProcCmd_1B/ProcCmd_1C pass an `s16` dataImm, and `int` and `s16` compile
 * byte-identically there (both `ldrsh`); `u16` does NOT (it gives `ldrh`) and
 * would have broken proc.c, so `u16` is ruled out even though sub_0803B524's
 * own prologue looks like it. Every other caller passes a literal. */
void sub_0803B4DC(int);
void sub_0803B524(int);
/* CORRECTION, wave 24 (W24-B): this read `s16` from wave 7 until now, and the
 * assembly contradicts it. sub_0803B5A4's prologue is a BARE `adds r4, r0, #0`
 * -- the parameter is copied to a callee-saved register with no masking at all,
 * and PROMOTE_MODE fires unconditionally, so an `s16` (or `u16`, or `u8`)
 * parameter would have to carry `lsls #0x10; lsrs #0x10` there. It does not, so
 * the parameter is word-width. This is the same readout that types the two
 * lines above and sub_0803B55C's `int` in src/decomp/c_0803B55C.c, whose
 * prologue is the identical `adds r4, r0, #0`.
 * Corroborating, inside the body: `cmp r4, #0` compares the saved value
 * unnarrowed, and the `lsls r1,r4,#0x10; lsrs r1,r1,#0x10` further down is
 * PROMOTE_MODE at the sub_08070610 CALL (its second parameter is u16), not at
 * entry -- it lands after gUnknown_03005AE0 has been loaded into r0, i.e. in
 * the middle of the argument setup, which is a conversion at a use.
 * Safe for both call sites, verified by probe: src/proc.c's ProcCmd handler at
 * line 818 passes an `s16` dataImm, and `int` and `s16` compile byte-identically
 * there (both `ldrsh`) for the reason recorded on sub_0803B4DC above; the other
 * caller, src/decomp/c_0803B5E8.c, passes the literal 2. */
void sub_0803B5A4(int);
void sub_0803B5E8(void);

/* The 0x0803B0EC-0x0803B640 block, wave 24. Widths are recorded on each.
 *   sub_0803B0EC  void(void)  -- `pop {r0}`; no argument register is read.
 *   sub_0803B118  its one parameter is forwarded UNCHANGED to sub_080153B8 in
 *                 the else arm (`adds r0, r2, #0`), which fixes the type as
 *                 sub_080153B8's own `struct Unk03001470 *`; the then arm
 *                 reaches ->unk1e through the same register.
 *   sub_0803B198  void(void).
 *   sub_0803B37C  void(void).
 *   sub_0803B3B0  `int`: the prologue goes straight to `lsls r0, r0, #2` to
 *                 index gUnknown_080910FC with no PROMOTE_MODE masking of the
 *                 incoming register, so it is word-width (wave 21's bare-
 *                 prologue rule). Its one caller passes a literal.
 *   sub_0803B4EC  `int` with a `u16` LOCAL, not a `u16` parameter -- see the
 *                 note on the definition in src/decomp/c_0803B4EC.c; both
 *                 spellings give the same entry `lsls #0x10; lsrs #0x10`, and
 *                 the local is what sub_0803B524 next door already uses.
 *   sub_0803B588  void(void).
 *   sub_0803B640  void(void). */
void sub_0803B0EC(void);
void sub_0803B118(struct Unk03001470 *);
void sub_0803B198(void);
void sub_0803B37C(void);
void sub_0803B3B0(int);
void sub_0803B4EC(int);
/* sub_0803B578 is deliberately NOT declared here. It has fan-in 0 -- no `bl`
 * to it exists anywhere in asm/ and it is reached only through a ProcCmd table
 * -- so its parameter is the proc pointer, and its definition in
 * src/decomp/c_0803B578.c names a file-local struct for it the way every other
 * promoted proc callback does. A `ProcPtr` declaration here would conflict with
 * that definition and buys nothing, since nothing calls it by name. */
void sub_0803B588(void);
void sub_0803B640(void);
/* Both already promoted (src/decomp/c_0803B0D8.c, src/decomp/c_0803B350.c) but
 * never declared, because until wave 24 nothing outside their own file called
 * them. sub_0803B118 calls the first and sub_0803B37C the second; the types
 * below are copied from those definitions, not re-derived. */
void sub_0803B0D8(void);
void sub_0803B350(u16);

/* sub_0803ABD8 is a bare `bx lr` at 4 bytes with three callers (sub_0803AD48,
 * sub_0803AFA0, sub_0803B198), all of which call it with no argument setup;
 * nothing about its signature is recoverable and void(void) is the weakest
 * model. sub_0803AF5C is already promoted as void(void) in
 * src/decomp/c_0803AF5C.c; declared here so sub_0803B0EC can call it. */
void sub_0803ABD8(void);
void sub_0803AF5C(void);

/* Four more m4a entry points, on top of the five listed above. All four names
 * come from data/fe_matches.json at `full` strength except sub_080705AC and
 * sub_08070610, which are not in it and are named from the shape of the call
 * sites instead:
 *   sub_080703F4  m4aSoundInit         void(void) -- `full` in fe_matches
 *   sub_08070478  m4aSongNumStart      void(u16). The width is read off the
 *                 CALLEE, which opens `lsls r0,r0,#0x10; lsrs r0,r0,#0xd` --
 *                 PROMOTE_MODE's zero-extension with the `<<2` table index
 *                 folded into the second shift, so `u16` and not `int`.
 *   sub_080705AC  void(void): the body is a fixed eleven-iteration loop over
 *                 gUnknown_08242308 at stride 0xc calling sub_08070C90 on each
 *                 -- m4aMPlayAllStop.
 *   sub_08070610  void(void *, u16): a two-line forwarder to sub_080703D4
 *                 (MPlayFadeOut, `full` in fe_matches) that zero-extends r1 and
 *                 passes r0 through untouched, i.e. m4aMPlayFadeOut(mplayInfo,
 *                 speed). The first parameter is `void *` and not a struct
 *                 pointer because gUnknown_03005AE0 is the only thing ever
 *                 passed and no member of it is reachable from C yet.
 * sub_08071420 is MPlayVolumeControl (`full` in fe_matches), whose FE
 * signature is (MusicPlayerInfo *, u16 trackBits, u16 volume); sub_0803B35C
 * calls it with the literal 0xFFFF as the track mask. */
void sub_080703F4(void);
void sub_08070478(u16);
void sub_080705AC(void);
void sub_08070610(void *, u16);
void sub_08071420(void *, u16, u16);
/* Two more, both `full` in data/fe_matches.json and both leaves that end in a
 * bare `bx lr` -- m4aMPlayFadeOutPause (sub_08070620, from sub_0803B7D8) and
 * m4aMPlayFadeInContinue (sub_08070640, from sub_0803B804). The second
 * parameter is `u16` off the CALLEE in both: each opens `adds r2,r0,#0;
 * lsls r1,r1,#0x10; lsrs r1,r1,#0x10`, PROMOTE_MODE's zero-extension on the
 * incoming r1 before anything else happens, and stores it with `strh` at +0x24
 * and +0x26 of the MusicPlayerInfo.
 *
 * WAVE 24: these two take `struct MusicPlayerInfo *`, NOT `void *`. Both are
 * already promoted -- src/decomp/c_08070620.c and c_08070640.c define them
 * with the named struct -- and a `void *` declaration here compiles fine under
 * `trymatch`, which builds ONE unit, then fails the SPLIT build with
 * `conflicting types`. The struct is visible at this line: global.h includes
 * unknown-globals.h (which defines it) before unknown-functions.h. When a
 * promoted file has already named a type, agree with it; weakest-model applies
 * only to types nobody has named. */
void sub_08070620(struct MusicPlayerInfo *, u16);
void sub_08070640(struct MusicPlayerInfo *, u16);

/* `int`: the prologue is a bare `adds r4, r0, #0` with no masking of the
 * incoming register, so the parameter is word-width per wave 21's bare-prologue
 * rule. The body raises gUnknown_030040A0, starts the gUnknown_084858DC blob
 * through sub_080152EC and parks the argument in the resulting object's +0x1e
 * with a `strh`. That is the SAME member sub_0803B118 reads back sign-extended
 * to drive its 0x5a timeout -- a producer and a consumer of struct
 * Unk03001470's unk1e agreeing independently, which is the discriminating pair
 * the `s16` on that member rests on. The store itself is byte-neutral.
 * `pop {r4}; pop {r0}` -> void. */
void sub_08001038(int);
/* A one-line forwarder: `Proc_Start(gUnknown_0849BC98, parent)`, with the
 * incoming r0 copied to r1 and nothing else touched, so the parameter IS
 * Proc_Start's parent and carries its type. Its one caller, sub_0803BE40,
 * passes the literal 3, i.e. PROC_TREE_3. `pop {r0}; bx r0` -> void, so the new
 * proc is discarded. */
void sub_0803433C(ProcPtr);

/* The five m4a entry points the 0x0803B3C8-0x0803B408 forwarder run wraps. All
 * five names come from data/fe_matches.json at `full` strength, and all five
 * epilogues are `pop {r0}; bx r0` (or a bare `bx lr`), so every one is void:
 *   sub_0806FD98  m4aSoundVSync        void(void), leaf
 *   sub_08070990  m4aSoundMode         void(u32) -- the mode word, masked
 *                 0xFF / 0xF00 / 0xF000 in the body, which is the canonical
 *                 SOUND_MODE_REVERB / MAXCHN / MASVOL layout
 *   sub_08070A7C  m4aSoundVSyncOff     void(void)
 *   sub_0807046C  a void(void) forwarder to sub_0806F744 (m4aSoundMain)
 *   sub_08070AF8  m4aSoundVSyncOn -- already promoted as void(void) in
 *                 src/decomp/c_08070AF8.c; declared here so the wrapper can
 *                 call it. */
void sub_0806FD98(void);
void sub_08070990(u32);
void sub_08070A7C(void);
void sub_0807046C(void);
void sub_08070AF8(void);

/* sub_0803B3C8 is `sub_0803B3D4(8)` and sub_0803B3D4 is
 * `m4aSoundMode(n << 8)`, i.e. "use n mixer channels" -- 8 is the only value
 * the ROM asks for. `int`, not a narrow type: the parameter reaches the `bl`
 * through a bare `lsls r0, r0, #8` with no PROMOTE_MODE narrowing in front of
 * it, which a `u8`/`u16` parameter surviving a call would have carried. */
void sub_0803B3D4(int);

/* The two shared bodies behind the 0x0803C574-0x0803C644 predicate wrappers.
 * Both return -1 / 0 / 1 and both end `pop {r1}; bx r1`; the eight wrappers
 * forward the result with no re-narrowing, which fixes the return at int width
 * (a `u8`/`bool8` return would have put `lsls #24; lsrs #24` after each `bl`).
 *   sub_0803C52C(id, n)  -1 if sub_0803CAB8(id), else 1 when unlock 0x21 is set
 *                        and sub_08037DA4(gUnknown_0200C420.unk10) >= n, else 0.
 *                        `n` is `int`: it is compared with a signed `blt`
 *                        against sub_08037DA4's 2..5 result.
 *   sub_0803C5E8(id)     -1 if sub_0803CAD4(id), 1 if sub_0803CAB8(id), else 0.
 * `u32` for the id, matching the rest of the gUnknown_02028030 bit family it
 * forwards to unchanged. */
int sub_0803C52C(u32, int);
int sub_0803C5E8(u32);

/* On the constants this block passes, because they look like one enum and are
 * two different things. Do not spend a wave naming them.
 *
 * The arguments to sub_0803CBD8 -- 0x21 (sub_0803C598, sub_0803C52C), 0x22
 * (sub_0803C5C0), 0x26 (sub_0803C504) -- ARE tag-like: sub_0803CBD8 dispatches
 * on the range and 0x20..0x5f indexes bit (id - 0x20) of
 * gUnknown_02028030.unk00, so they are global flag ids out of one numbering.
 * Three values is not enough to reconstruct the enum, and nothing else in the
 * tree names one yet.
 *
 * The second argument to sub_0803C52C -- 3 (sub_0803C574), 4 (sub_0803C580),
 * 5 (sub_0803C58C) -- is NOT a tag. It is an ordinal compared with `>=`
 * against sub_08037DA4's band of gUnknown_0200C420.unk10:
 *
 *     unk10 <= 0xc7 -> 2   <= 0xf9 -> 3   <= 0x117 -> 4   else 5
 *
 * i.e. the three wrappers are "rank >= 3 / 4 / 5" on a 2..5 scale whose top
 * value nothing asks for by itself, and 2 is the floor rather than a case.
 * An enum would have to be dense over 2..5 and the wrappers only cover the
 * upper three, which is what a threshold looks like and not what a tag looks
 * like.
 *
 * And the third run in the same block (sub_0803C614/620/62C/638/644) passes no
 * constant at all: five byte-identical `return sub_0803C5E8(id);` forwarders,
 * distinguished only by their addresses. Whatever separates them lived in the
 * original's names, not in its code, so five distinct source functions is the
 * only thing the ROM proves here. */

/* Maps gUnknown_0200C420.unk10 onto a 2..5 band (`> 0xc7` -> 2, `> 0xf9` -> 3,
 * `> 0x117` -> 5, else 4). Leaf, bare `bx lr`. The argument is compared with
 * signed `bgt`, and sub_08038474 forwards the result with no re-narrowing, so
 * both ends are int-wide. */
int sub_08037DA4(int);

/* Returns 0/1 and every caller narrows the result with `lsls #24` before
 * testing it, which an `int` return would not need -- so the declared return
 * type is 8 bits wide. The argument is compared with `blt`/`bgt` against 1, 3
 * and 5, i.e. signed, hence `int` rather than a narrow type. */
bool8 sub_0803E388(int);

/* Same 0/1-plus-`lsls #24` shape as sub_0803E388, at the call site in
 * sub_08045830. */
bool8 sub_08045650(void);
/* Indexes gUnknown_08499598 by its argument and ends `pop {r0}; bx r0`. */
void sub_08044AB8(int);

/* NINE arguments -- four in registers and five on the stack -- behind the five
 * wrappers at 0x08044C44-0x08044D34. Read off its body: r0 is a proc script it
 * forwards to Proc_Start; r1/r2 become words at +0x4c/+0x50 of that proc (a
 * blob and a palette); r3 and the first four stack slots become bytes at
 * +0x2c..+0x30; and the FIFTH stack slot -- the wrappers' own parameter -- is
 * `ldr r1,[sp,#0x30]` immediately before `bl Proc_StartBlocking`, so it is the
 * parent ProcPtr and not payload.
 * The four small integers are `int` because three of the five wrappers pass -1
 * in slot 6: a `u8` parameter truncates that to 0xff at the call and gives
 * `movs #0xff` where the ROM has `movs #0; subs #1`. Callee-side those two
 * slots are narrower (slot 6 is `ldrb` straight off the stack slot, slot 7
 * carries an explicit `lsl #24; lsr #24`), so `s8` is what satisfies both
 * sides; it is caller-side byte-identical to `int` for every constant these
 * five pass, and whoever matches sub_08044D70 should switch to it. */
void sub_08044D70(const struct ProcCmd *, void *, void *, int, int, int, int, int, ProcPtr);

/* `s8`, not int: sub_08016D04 returns -1 on its default path (`movs r0,#1;
 * rsbs r0,r0,#0`), and sub_0803B904 converts the result with
 * `lsls #24; asrs #8; lsrs #16`, which is exactly `(u16)(s8)ret` -- an int
 * return would emit only the `lsl #16; lsr #16` half. The parameter is `u8`
 * because the body opens by narrowing r0 with `lsls #24; lsrs #24`. */
s8 sub_08016D04(u8);
/* First parameter `u8` -- the prologue narrows r0 before the value survives a
 * call. The second is a `void (*)(void)` callback stashed at +0x4c of the proc
 * it starts; the three call sites (sub_08038548, sub_08038568, sub_08045770)
 * pass sub_0803BA00, sub_0803B8B8 and sub_0803B8A0, all of which ignore r0. */
void sub_0803D73C(u8, void (*)(void));
void sub_0803B8A0(void);
/* The first of the three callbacks the comment above names, and the one
 * sub_08038548 passes; `void (void)` on the same evidence (wave 20, W20-C). */
void sub_0803BA00(void);

/* Only referenced as values, stored into gUnknown_03004778 by sub_0805CDF0 and
 * sub_0805CE20. Both take no arguments and both end `pop {r0}; bx r0`, so both
 * are void(void). */
void sub_0805DB64(void);
void sub_0805DB70(void);
/* The rest of the same gUnknown_03004778 callback set, stored as values by the
 * 0x0805CA60-0x0805D1F0 list builders. None reads an argument register and all
 * end `pop {r0}; bx r0`, so all are void(void). */
void sub_0805D888(void);
void sub_0805DA84(void);
void sub_0805DB0C(void);
void sub_0805DB50(void);
void sub_0805DCA4(void);
void sub_0805DCD4(void);
void sub_0805DFB8(void);
void sub_0805DFE8(void);
void sub_0805DFF4(void);
void sub_0805E160(void);

/* Sorts the gUnknown_030045F0 id list the 0x0805Cxxx builders have just filled.
 * Its argument arrives in r0, is spilled whole with `str r0,[sp]` and only ever
 * tested `!= 0`, so it is word-wide; every caller passes gUnknown_0300477C. */
void sub_0805D344(u32);

void sub_08063994(void);
void sub_0806A454(void);
void sub_0806CC4C(void);
void sub_0806CC64(void);

void sub_080718F0(void);
/* `ldrb r0, [r0]; bx lr` -- a 4-byte routine that exists to be COPIED, not
 * called in place: sub_0808AD6C relocates its two halfwords into a
 * caller-supplied buffer and publishes the copy through gUnknown_03000F6C.
 * The signature comes from that call site (one pointer in r0, result narrowed
 * with `lsls #24; lsrs #24` by sub_0808ADA4), not from the body. */
u8 sub_0808AD68(u8 *);
/* Two whole-list sweeps, each reached only through a 16-byte
 * `push {lr}; ldr r0,=g; bl <it>; pop {r0}; bx r0` forwarder. Both end
 * `pop {r4,...}; pop {r0}; bx r0`, so both are void.
 *
 * sub_0806377C walks gUnknown_03001470[29..0] (stride 0x60, cursor starting at
 * base + 0xAE0 and stepping down) comparing `.unk00` against its argument and
 * calling sub_08015C30(i) on each hit -- the descending twin of sub_0801537C,
 * which does the same scan ascending and calls sub_08015328. `.unk00` holds the
 * blob the slot was created for: sub_080656E0 is `sub_080152EC(gUnknown_08580C7C,
 * 3)` and sub_08065700 is `sub_0806377C(gUnknown_08580C7C)`, with the identical
 * pair repeated at sub_0806D820 / sub_0806D840 over gUnknown_08581F40. So the
 * parameter is sub_080152EC's `const void *` and nothing narrower is provable:
 * the body only compares it as a word.
 *
 * sub_08067504 is Proc_BreakEach open-coded over proc.c's sProcArray -- 32
 * slots at stride 0x6c, `proc->proc_script == arg` selects, Proc_Break(proc)
 * acts. The compared word IS proc_script, so the parameter is proc.h's
 * `const struct ProcCmd *` rather than an opaque pointer. */
void sub_0806377C(const void *);
void sub_08067504(const struct ProcCmd *);
/* The gUnknown_08613EE4 screen-fade driver, plus the three void(void) routines
 * the 41 wrappers at 0x08071F88-0x08072288 hand to it or call beside it.
 *
 * sub_080722B8(kind, speed, parent, onDone):
 *   `kind` is 0..7 and indexes gUnknown_081CBF68 -- 0x60 bytes of data, i.e.
 *   exactly 8 records of 12, which is why the prologue scales it by `n*3<<2`.
 *   Each record is
 *     { ProcPtr (*start)(const struct ProcCmd *, ProcPtr);
 *       void (*setup)(s8);
 *       s32 dir; }
 *   `start` is 0x0801C8F4 or 0x0801C95C (the Proc_Start / Proc_StartBlocking
 *   pair) applied to gUnknown_08613EE4 with `parent` as the second argument --
 *   which is what fixes the wrappers' third parameter as ProcPtr; `setup` is
 *   one of sub_080137AC / sub_08013830 / sub_080138B0 / sub_0801394C; `dir` is
 *   +1 or -1, i.e. fade in versus fade out. The ROM passes kind 0,1,2,3,4,6,7.
 *
 *   `speed` is the same quantity as the `int` on the sub_08011550 family at the
 *   top of this header, on a different accumulator, and again it is NOT a
 *   bitmask. It is stored as a WORD at +0x54 and read twice: sub_08072344 adds
 *   it to the +0x5c accumulator every frame and finishes at 0x200, so the fade
 *   lasts 0x200/speed frames; and sub_080722B8 itself passes
 *   `(s8)(MAX(speed >> 4, 1) * dir)` to `setup` as the per-step delta. That
 *   shift is `asrs`, not `lsrs`, so `speed` is signed -- `int`, not `u32`.
 *   The wrappers pass 4 / 8 / 0x10 / 0x20 / 0x40 = 128 / 64 / 32 / 16 / 8
 *   frames, with 0x10 the nominal rate (it is also what sub_08072394 passes to
 *   sub_08013780, and what leaves the `>> 4` scale at 1).
 *
 *   `onDone` is stored at +0x4c and invoked by sub_08072320 through a bare
 *   `bl _call_via_r0` with no arguments, guarded by `cmp r0, #0` -- so it is a
 *   `void (*)(void)` and NULL is the "nothing to do" case. It has to be
 *   declared as a function pointer rather than an int: that is what makes the
 *   wrappers' literal-pool word relocate against sub_080723DC / sub_08072454
 *   instead of becoming a plain constant. */
void sub_080722B8(int, int, ProcPtr, void (*)(void));
void sub_080723DC(void);
void sub_08072454(void);
void sub_08072394(void);
/* Already matched and promoted as src/decomp/c_08013780.c, which is where this
 * signature comes from -- the definition wins over any weaker model. It is
 * declared here because wave 26 promoted its two callers (sub_08072394 and
 * sub_080723A8) into a different unit. */
void sub_08013780(u16, u16, u8);
/* Promoted as src/decomp/c_080723C0.c. Declared here for sub_08072394 and
 * sub_080723A8, which both call it as their tail statement. */
void sub_080723C0(void);
/* The per-frame step of the gUnknown_08613EE4 fade sub_08072320 drives. It
 * returns "still fading": sub_08072320 narrows the result with `lsls #0x18`
 * before testing it, which is the caller-side tell for an 8-bit return, and
 * `movs r0,#1` / `movs r0,#0` reaching a common epilogue via `b` is the value
 * itself. It reads the proc's +0x54/+0x58/+0x5c, so it takes the proc; ProcPtr
 * is the weakest model and this will want a struct once it is matched. */
u8 sub_08072344(ProcPtr);
/* Starts the gUnknown_08613F2C proc and RETURNS it -- settled from the
 * callers, since the value in r0 at the epilogue is a coincidence of the last
 * store. sub_080725E4 and sub_080725FC both write +0x3a through the result,
 * which is what makes the return real rather than accidental. The fifth
 * argument arrives on the stack and is the parent. */
ProcPtr sub_080725A8(int, int, int, int, ProcPtr);
/* Promoted as src/decomp/c_08072970.c, whose definition fixes all three
 * parameters as u32. The first is really a FUNCTION POINTER -- sub_08072948
 * calls the +0x2c field it lands in through `_call_via_r1` -- so its callers
 * cast, e.g. sub_08072BA4 passing `(u32)sub_08072BBC`. */
void sub_0807298C(u32, u32, u32);
/* Publishes an x/y scroll pair into one of four BG scroll shadows selected by
 * the first argument (0..3 -> BG0/BG1/BG2/BG3; anything else is a no-op).
 *
 * ALL THREE parameters are 16-bit, not just the second. sub_08072C40's own
 * prologue is `lsls/lsrs #16` on r0, r1 AND r2 -- PROMOTE_MODE zero-extends
 * every sub-word parameter at entry, so those three pairs ARE the declaration,
 * and a `u32` parameter could not produce one. Declared `(u32, u16, u32)` from
 * wave 12 until wave 21 matched the callee itself; the first and third were
 * never checked against a body, only against callers that happened to agree.
 * They agree because every promoted caller passes either a literal or a `u16`
 * lvalue, so the retype is byte-neutral at all of them (re-verified with
 * trymatch: c_08068AC4, c_08069EAC, c_0806A054, c_0806BB08, c_0806C52C,
 * c_0806EB5C, c_08075368) -- which is exactly why the wrong spelling survived
 * nine waves. The `(u16)` casts some promoted call sites carry on the third
 * argument were compensating for the wrong declaration; they are now
 * redundant, and harmless.
 *
 * The `bgt` on the selector is taken on the ZERO-EXTENDED value with no
 * sign-extension inserted, which is what makes the first parameter `u16`
 * rather than `s16`. */
void sub_08072C40(u16, u16, u16);
s32 Interpolate(s32, s32, s32, s32, s32);

s32 Div(s32, s32);

/* ---- callees of the three wrapper families worked in wave 12 ---- */

/* Run-or-defer. If gUnknown_03001FE0 is non-zero it calls
 * `fn(gUnknown_03001FE0, arg)` immediately through `bl _call_via_r2`;
 * otherwise it queues the pair with `sub_0801EDC0(fn, (s16)arg)`.
 * `pop {r1}; bx r1`, so it returns a value -- both of its wrappers
 * (sub_0802BCD8, sub_0803A53C) discard it and are themselves void.
 * The callback is `void *` and cast at the call site, the same convention
 * sub_08011AAC / sub_08011B34 already use: the two functions registered here
 * (sub_0802BC5C, sub_0803A07C) are void(void) bodies that ignore both of the
 * arguments they are handed, so no honest function-pointer type exists.
 * The second parameter's WIDTH is not recoverable -- sub_0801F024 narrows r1
 * with `lsls #16; lsrs #16` in its own prologue, but both call sites pass a
 * `movs`-sized literal and that is byte-identical for every integer type.
 *
 * THE SECOND PARAMETER IS `u16` (wave 29, W29-B, matching the definition). The
 * paragraph above is right that the two call sites cannot see it -- both pass a
 * `movs`-sized literal -- but the definition can: r1 is narrowed
 * `lsls #0x10; lsrs #0x10` IN PLACE at entry, which is PROMOTE_MODE on a
 * declared-narrow parameter, and the queueing arm then converts it to `s16`
 * with `lsls #0x10; asrs #0x10` for sub_0801EDC0. A declared `int` gives
 * neither shift pair. Both promoted callers stay byte-identical. */
int sub_0801F024(void *, u16);
/* sub_0801F024's queueing arm. Its second parameter is `s16` (`lsls #0x10;
 * asrs #0x10` at entry) and its first is ORed with 0x80000000 before being
 * handed to sub_0801ECE8, i.e. a tagged callback word; `void *` is what its one
 * caller passes and needs no conversion. Returns a value. */
int sub_0801EDC0(void *, s16);

/* ---- wave 29, W29-B: address-locality block 0x0801F --------------------- */
/* The gUnknown_0848B738 palette loader. Argument 1 indexes the table (no entry
 * narrowing, so `int`); argument 2 is a palette slot, scaled `* 0x20` and cut
 * to 16 bits -- `lsls #0x15; lsrs #0x10` is a NET LEFT SHIFT OF FIVE under a
 * `(u16)` cast, not a mask plus a shift, and it has to be written as the
 * MULTIPLY `(u16)(b * 0x20)`. BOTH parameters are `int`, and that is measured:
 * a `u8` second parameter splits the pair into `lsls #0x18` at entry and
 * `lsrs #0x13` at the use, and it also forces a narrowing into sub_0801F150 in
 * front of the `bl` that the ROM does not have. */
void sub_0801F178(int, int);
/* sub_0801F084's if-arm callees. sub_0801BF2C walks the gUnknown_0200D510 layer
 * list whose head it selects with `lsls #4` on its argument -- a SpriteEntry
 * index, so `int` and no narrowing anywhere; sub_0801EE10 ignores r0 entirely
 * (`b` straight past the prologue). Both end `pop {rN}; pop {r0}; bx r0`, so
 * both are void. */
void sub_0801BF2C(int);
void sub_0801EE10(void);
void sub_0801F084(void);
/* Two halves of one mapping between a tile/palette id and the six-entry
 * gUnknown_0848B738 table: sub_0801F400 is the table's third column read out of
 * a jump table, and sub_0801F3D4 the inverse, a descending if/else ladder over
 * the same six bounds. Both are SIGNED compares on an unnarrowed argument, and
 * both fall off the end on an out-of-range value -- sub_0801F400 with r0 never
 * written, so the argument itself comes back out. */
int sub_0801F3D4(int);
int sub_0801F400(int);

/* A `bx lr` stub taking the address of one of the two gUnknown_030013B0 /
 * gUnknown_030013D0 records; sub_080252EC calls it once on each. The body
 * reads nothing, so the parameter type is unconstrained and `void *` is the
 * weakest model that accepts both. */
void sub_080252E8(void *);

/* All void(void): every one ends `pop {r0}` (or a bare `bx lr`), and none of
 * them reads r0-r3 before writing it. They are here because the wave-12
 * three-call wrapper family (sub_08002EB4, sub_08028154, sub_0802CD00,
 * sub_0802CD14, sub_08034FD8, sub_08034FEC, sub_0805DB50) and the two
 * sub_0801F024 wrappers name them and nothing else declared them yet.
 * Note in particular that the three-call wrappers are three INDEPENDENT
 * statements and not a nest: no argument register is set up anywhere in them,
 * and every callee here takes none. */
/* The two single-slot callback setters on gUnknown_030040D0 / gUnknown_030040EC,
 * already defined this way in src/decomp/c_080366C4.c and declared here only
 * because sub_080370F0 lives in another translation unit. They take
 * `void (*)(void)` and NOT `void *`, so their call sites pass a function by
 * name with no cast -- the opposite of the sub_08011AAC / sub_08011B34 /
 * sub_0801F024 convention a few lines up. sub_0803662C registers sub_08036944 /
 * sub_080369BC through the same pair, sub_080370F0 registers sub_08036884 /
 * sub_080368E8; the two wrappers are what fix which setter drives which slot. */
void sub_080366C4(void (*)(void));
void sub_080366D0(void (*)(void));
void sub_08002D7C(void);
void sub_08002DEC(void);
void sub_08002E5C(void);
void sub_0801A614(void);
void sub_08023348(void);
void sub_08023354(void);
void sub_08024584(void);
void sub_0802BC5C(void);
void sub_0802D4B0(void);
void sub_0802D504(void);
void sub_0803662C(void);
void sub_08036884(void);
void sub_080368E8(void);
void sub_0803A07C(void);
/* Wave 29, W29-B: sub_0803A440 registers this one alongside sub_0803A07C
 * through the same sub_0801F024, so the same void(void) shape. */
void sub_08039F80(void);
void sub_0805E5AC(void);
void sub_0805E718(void);
void sub_0805F4CC(void);
/* Already promoted in src/decomp/c_080735B0.c (a DMA0 shutdown); declared here
 * so sub_0806F2C0 / sub_080735D0 / sub_080736D8 can hand its address to
 * sub_08011AAC. */
void sub_080735B0(void);

/* --- wave 12, families F003 and F005 -------------------------------------
 * F003 is 34 twelve-byte `push {lr}; movs r0,#K; bl S; pop {r0}; bx r0`
 * forwarders and F005 is 19 sixteen-byte `push {lr}; bl S; bl S; pop {r0};
 * bx r0` pairs. Every one is `void f(void)` by the `pop {r0}` rule. The
 * callees below are what those 40 wrappers name; the ones already promoted
 * are declared here verbatim from their definitions, the rest carry their
 * evidence.
 *
 * Caveat that applies to every PARAMETER type in this block: F003 always
 * passes a literal `movs r0,#K`, so the call site emits the same two bytes
 * for `int`/`u32`/`u16`/`s16`/`u8` alike. None of the wrappers constrains
 * these widths, and none of them changes if a later wave corrects one. The
 * widths come from the callee's own prologue, which the doc warns is weak
 * whenever the narrowed value goes on to feed a call -- flagged per entry. */

/* Already promoted, declared here from their definitions:
 *   src/decomp/c_0800056C.c  void sub_0800056C(u16 a)
 *   src/decomp/c_0803B6E8.c  void sub_0803B6E8(int a)
 *   src/decomp/c_08073900.c  void sub_08073900(s32 arg)
 *   src/decomp/c_08073C88.c  void sub_08073C88(s32 a) */
void sub_0800056C(u16);
void sub_0803B6E8(int);
void sub_08073900(s32);
void sub_08073C88(s32);

/* `int`: the prologue is a bare `adds r4, r0, #0` and the saved value then
 * survives `bl sub_08011B18` before being compared, which PROMOTE_MODE would
 * have narrowed for any sub-word parameter. `pop {r4,r5,r6}; pop {r0}`, void.
 * Only ever called as 1 (sub_08023348) and 0 (sub_08023354). */
void sub_08023360(int);
/* `u8`: opens `lsls r0,#0x18; lsrs r0,#0x18` with the result going straight
 * into a four-way `cmp`/`beq` chain, not into a call, so this is PROMOTE_MODE
 * on the parameter rather than a cast at a use. `pop {r0}`, void. */
void sub_0802776C(u8);
/* `u8`: opens `lsls r0,#0x18; lsrs r3,r0,#0x18` and stores the result with
 * `strb`. Independently confirmed -- the gUnknown_0849ECDC comment in
 * unknown-globals.h already records "a u8 argument by sub_0803B930".
 * `pop {r4,r5,r6,r7}; pop {r0}`, void. */
void sub_0803B930(u8);
/* At least 16 bits, and nothing narrower is provable: the whole body is
 * `strh r0, [=gUnknown_030005CE]` followed by a sub_08071420 call, and the
 * doc's setter table makes a bare `strh` identical for int/u32/u16/s16.
 * `int` is the weakest reading. `pop {r0}`, void. */
void sub_0803B35C(int);
/* `int`, on the sub_0803B4DC precedent: the prologue is a bare
 * `adds r4, r0, #0` and the `lsls #0x10; asrs #0x10` lands in the MIDDLE of
 * the argument setup for sub_08023168, after both globals have been loaded --
 * a cast at the use, not PROMOTE_MODE at entry. The same value is handed to
 * sub_08043418 later, also as `(s16)`. `pop {r4,r5}; pop {r0}`, void. */
void sub_08023274(int);
/* `int`: the prologue saves r0 with a bare `adds r4, r0, #0`, adds 0x28 to a
 * copy and calls sub_0801B768 with it, then masks the saved value `& 0x3ff` --
 * no narrowing anywhere, and a u8/u16 parameter surviving a `bl` would carry
 * one. `pop {r4}; pop {r0}`, void. */
void sub_0801B780(int);
/* `u16`, but only on the Proc-wrapper table's `adds r4, r0, #0; lsl #16;
 * lsr #16` row -- the copy and its narrowing are the first two things the
 * function does, before any global is touched. Weaker than the entries above
 * because the narrowed value does then feed `bl sub_0801A548`, which is the
 * shape wave 11 showed can be a cast at a use (sub_0803B524). Its only known
 * caller, sub_0804A03C, passes 0, so nothing here can settle it.
 * `pop {r4}; pop {r0}`, void. */
void sub_0801A5B0(u16);

/* CORRECTION, wave 20 (W20-C): the F005 header above says "Every one is
 * `void f(void)` by the `pop {r0}` rule". That rule settles the RETURN type
 * and nothing else; the empty PARAMETER list was an assumption and it is wrong
 * for two of the nineteen. Every call site of all 19 was re-read: only these
 * two have caller-side argument setup, and both are decisive.
 *   sub_0801A538 takes FOUR -- sub_08019DA8 passes 0, 1, 6 and 0xC, four
 * distinct non-zero constants, and the other three sites pass four zeros.
 *   sub_08085298 takes ONE -- all four callers do `adds r0, rN, #0` off a
 * callee-saved proc pointer in the instruction before the `bl`.
 * In both, the parameters are DEAD: the body's first `bl` overwrites r0, so
 * the definitions are byte-identical either way and no oracle in this tree
 * could have caught it from the callee side. Both promoted definitions were
 * retyped and re-verified. THE GENERAL POINT, since it recurs: an unused
 * parameter is invisible in the callee and visible only at a call site, which
 * is why arity has to be read from the CALLERS even when the body is two
 * instructions long. */
void sub_0801A538(int, int, int, int);
/* Both are `void (void)`: each opens `push {r4,r5,r6,r7,lr}; movs r5,#0` with
 * no read of r0-r3 anywhere, and both end `pop {r0}; bx r0`. They are a pair
 * of 76-byte twins over gUnknown_080909A4 and gUnknown_080909B0 respectively,
 * and sub_0803A460 / sub_08047094 call them back to back (wave 20, W20-C). */
void sub_08022580(void);
void sub_080227A8(void);
void sub_08085298(ProcPtr);
/* Wave 30, W30-E. Nullary on the callee's own evidence: it opens
 * `push {r4,r5,lr}; movs r4,#0; ldr r5,=gUnknown_081D93F8` and never reads r0.
 * sub_080851CC/sub_08085208 still hold their proc pointer in r0 at the `bl`,
 * which costs no instruction and is not argument setup. */
void sub_080853B0(void);

/* F005's callees. None of the 38 reads an argument register before writing
 * it -- every one opens with a `bl`, a pool `ldr` or a `movs` into r0 -- so
 * all take no parameters, and that is what makes the family two statements
 * rather than `g(f())`: a nullary second callee cannot consume the first's
 * result, and with a parameter it would need one. All end `pop {r0}` and are
 * void except sub_0801B4C0. Already promoted, declared from their
 * definitions: sub_0803B3EC (c_0803B3C8.c), sub_080199F8 (c_080199E0.c),
 * sub_08042C10, sub_08042B70, sub_08034F7C (c_08034F6C.c), sub_08013C54,
 * sub_08013AFC (c_08013AD4.c), sub_08034F48, sub_0805AC88. Three more of the
 * set -- sub_08023348, sub_08024584 and sub_0803662C -- are declared further
 * up this file by the F001 forwarder block, which reached them independently;
 * they are not repeated here. The probe behind the "two `bl`s" claim is in
 * docs/agbcc-codegen.md under Proc wrappers. */
void sub_0800485C(void);
void sub_08012A74(void);
void sub_08016E3C(void);
void sub_08017208(void);
void sub_0801759C(void);
void sub_080199F8(void);
void sub_0801A664(void);
void sub_080258CC(void);
void sub_08034890(void);
void sub_08034F48(void);
void sub_08034F7C(void);
void sub_08035224(void);
void sub_08035354(void);
void sub_08042B70(void);
void sub_08042C10(void);
void sub_08013C54(void);
void sub_08013AFC(void);
void sub_0803B3EC(void);
void sub_080553C8(void);
void sub_08054C04(void);
void sub_0805AC88(void);
void sub_08061B4C(void);
/* The one non-void member: `pop {r3,r4,r5}; pop {r4,r5,r6,r7}; pop {r1};
 * bx r1`. Its only caller, sub_0803AF90, discards the result, so only the
 * non-void-ness is proved and the width is a guess. */
int sub_0801B4C0(void);


/* ---------------------------------------------------------------------------
 * Callees of the 12-byte forwarder family (`push {lr}; bl X; pop {r0}; bx r0`
 * -- family F001 in data/families.json, 50 members), settled in wave 12.
 *
 * A forwarder proves NOTHING about its callee: its `pop {r0}` overwrites
 * whatever came back, so `void f(void)` and `int f(void)` are byte-identical at
 * that call site. Every line below was therefore read off the CALLEE's own
 * body -- `pop {r0}; bx r0` (or a bare `bx lr` with no `movs r0` before it) is
 * what makes each one void, and the argument count is the number of r0-r3 read
 * before being written. The forwarders set up no argument register at all, so
 * each one passes its own parameters straight through; that is also why the
 * arity is invisible on the forwarder side and had to come from the callee.
 * -------------------------------------------------------------------------- */

/* void(void): none reads r0-r3 before writing it, and every one ends
 * `pop {r0}; bx r0`. The ones marked with a file are already promoted, and
 * these declarations have to keep agreeing with those definitions. */
void sub_080039E4(void);
void sub_08002FE4(void);
void sub_080123EC(void);
void sub_08022A08(void);
void sub_08024830(void);
void sub_0802481C(void);
void sub_08026290(void);
void sub_080267AC(void);
void sub_0802D3B0(void);
void sub_08011B18(void);            /* src/decomp/c_08011B18.c */
void sub_08013378(void);
void sub_08037678(void);
void sub_0803B774(void);            /* src/decomp/c_0803B774.c */
void sub_0803C890(void);
void sub_08049BD8(void);            /* src/decomp/c_08049BD8.c */
void sub_08052F3C(void);
void sub_080736D8(void);
void sub_080767A8(void);            /* src/decomp/c_080767A8.c */
void sub_08078790(void);
void sub_08078864(void);
void sub_0808A6A0(void);

/* Two EMPTY functions -- each is a lone `bx lr`, four bytes, nothing else.
 * `void(void)` and not `void(int)`: their only call sites are inside
 * sub_0803AFA0 (reached through the forwarders sub_0803AF78 / sub_0803AF84),
 * and there r0 holds the `1 & flags` / `4 & flags` of the test that just
 * branched -- a leftover, not an argument anyone set up. */
void sub_0801B4B8(void);
void sub_0801B4BC(void);

/* strcpy-shaped, and already defined as `char *(char *, const char *)` in
 * src/decomp/c_0808B678.c. Declared here so its forwarder sub_08004E38 can call
 * it; sub_08004E88 confirms the two arguments (`ldr r0,[r4]; adds r0,#0x9c;
 * adds r1, r5, #0`). The forwarder itself is void -- `pop {r0}`, not
 * `pop {r1}` -- so the char * result is dropped. */
char * sub_0808B678(char *, const char *);

/* One pointer in r0, void. NOT a Proc: it loads a pointer out of +0x20, which
 * is `proc_prev` inside PROC_HEADER, and indexes that as an array of 0x20-byte
 * records with a callback at +0x0c. Fields named: +0x20 (the record array),
 * +0x24 (one byte per record index), +0x31 and +0x42. Left `void *` until the
 * object is modelled; sub_08019B80 is the sibling that walks the same thing. */
void sub_08019B50(void *);

/* Proc callbacks, each `void(ProcPtr)`: all four read exactly r0, dereference
 * it past PROC_HEADER's 0x29 bytes, and end `pop {r0}`. sub_0803927C is proved
 * rather than inferred -- its siblings sub_080392C8 / sub_080392F4 hand the
 * same pointer to Proc_Break. `ProcPtr` is a placeholder for whatever struct
 * each one eventually gets; it is `void *`, so it costs no codegen, and it will
 * need retyping when these callees are matched themselves. */
void sub_08035F68(ProcPtr);         /* +0x36, and +0x39 via sub_08035E90 */
void sub_08035FA8(ProcPtr);         /* +0x36 */
void sub_0803927C(ProcPtr);         /* +0x2c, +0x30, +0x64 */
void sub_0807BF74(ProcPtr);         /* +0x58, a counter it decrements by 0x100 */

/* m4a. sub_0806F744 is SoundMain (data/fe_matches.json, `full`) and belongs to
 * the m4a_asm.s half of the driver -- see data/asm-resident.json for why no C
 * will match it. It is declared here only so m4aSoundMain (sub_0807046C,
 * declared above) can call it. sub_080703B8 is MPlayContinue, already defined
 * in src/decomp/c_080703B8.c; its forwarder sub_080705D8 is therefore
 * m4aMPlayContinue, and sub_080705E4 beside it is m4aMPlayAllContinue. */
void sub_0806F744(void);
void sub_080703B8(struct MusicPlayerInfo *);

/* The gUnknown_0200C528 lookup, and the s16 twin of sub_08015BD0: it scans the
 * ten 0x18-byte slots for the one whose .unk00 equals its argument and returns
 * that index, or -1. `const u8 *` for the argument to agree with
 * sub_080193B0/sub_0801930C, which take the same script pointers; `s16`
 * because its one result-keeping caller (sub_08019850) re-narrows with
 * `lsls #0x10; asrs #0x10`, and because the scan's own counter is a halfword
 * (`lsls #0x10; asrs #0x10` on every iteration). */
s16 sub_08019290(const u8 *);

/* Three argument-free routines named by the gUnknown_0200C528 cursor-advance
 * family at 0x08017E8C-0x0801903C, which lives in another translation unit and
 * so needs them visible. sub_08017E74/sub_08017E80 are already promoted in
 * src/decomp/c_08017E74.c as void(void) (`gUnknown_03001404 = 1` / `= 0`);
 * sub_08042B9C ends `pop {r0}; bx r0` and reads no argument register, so it is
 * void too. `(void)` is load-bearing at the call sites, not cosmetic: it is
 * what leaves the wrapper's own r0 untouched across the `bl`, which is exactly
 * what the ROM has, and it is why the wrapper's prologue narrowing is a
 * parameter-width tell there rather than a cast at a use. */
void sub_08017E74(void);
void sub_08017E80(void);
void sub_08042B9C(void);
/* Wave 28, W28-A: a fourth, promoted in src/decomp/c_08017EEC.c as void(void).
 * sub_0801820C is its first cross-file user and only takes its ADDRESS, handing
 * it to sub_08011AAC's `void *` parameter. */
void sub_08017EEC(void);

/* The six redraw passes the four wrappers at 0x08023DCC-0x08023EA4 forward
 * their whole argument list to. All six are `pop {r0}`, i.e. void, and all six
 * narrow the arguments they use with `lsls #0x10; lsrs #0x10` -- PROMOTE_MODE
 * on u16 parameters that have to survive a call. 08023A4C/08023BAC mask their
 * first two with `& 0xf` instead, which is consistent with u16 and does not
 * contradict it. */
void sub_08023A4C(u16, u16, u16, u16);
void sub_08023BAC(u16, u16, u16, u16);
void sub_08023D14(u16, u16, u16, u16);
void sub_08023D48(u16, u16, u16, u16);
void sub_08023D7C(u16, u16, u16, u16);
void sub_08023DA4(u16, u16, u16, u16);


/* Dependencies of the F001 callees matched in wave 12.
 *
 * sub_08037790 and sub_08037628 are both void(void): neither reads r0-r3
 * before writing it, and both end `pop {r0}; bx r0`. sub_08037790 is only ever
 * named by address -- sub_08037678 registers it with sub_08011B5C and nothing
 * calls it -- so `void (void)` there comes from the registration list, exactly
 * as it does for sub_080184A4 higher up this file. */
void sub_08037628(void);

/* The gUnknown_030058E0 display-list builders. sub_080785FC resets the cursor
 * (`gUnknown_03005944 = 0`, then `bx lr`) and sub_08078758 fills the five words
 * of gUnknown_030059C0 with 1; both take nothing and return nothing.
 *
 * The middle four are `int(int)`. Each takes a byte index in r0, writes three
 * or four bytes into gUnknown_030058E0 starting there, and RETURNS the advanced
 * index -- every one ends `pop {r1}; bx r1`, which is the value-returning
 * epilogue. The width is pinned by sub_08078864, which chains all four
 * (`bl` ... `bl` with NOTHING between them, so each result is the next
 * argument): a narrow parameter or return would have put `lsl #24; lsr #24`
 * between consecutive calls, and there is none. */
void sub_080785FC(void);
int sub_08078608(int);
int sub_08078658(int);
int sub_080786A4(int);
int sub_080786F0(int);
/* sub_08078740 is sub_08078758's twin: it walks the same five words of
 * gUnknown_030059C0 backwards storing 0 (`ldr r1,=g; movs r2,#0; adds r0,r1,#0;
 * adds r0,#0x10;` loop `str r2,[r0]; subs r0,#4; cmp r0,r1; bge`), takes
 * nothing and ends `bx lr`. It is DEFINED and matching in
 * src/decomp/c_08078740.c and was simply never declared -- the wave-14
 * "promoted but no prototype" trap. Its nullary-ness is what makes the third
 * `bl` of family F035 a statement of its own rather than a nest. */
void sub_08078740(void);
void sub_08078758(void);

/* The three gUnknown_0200E438 accessors that the ~40 sprite-attribute setters
 * between 0x0804B180 and 0x08053614 all use. Already promoted (and matched) in
 * src/decomp/c_0801566C.c, c_08015608.c and c_08015928.c; declared here so
 * callers can be written. The `struct UnkVec` by-value third form is real --
 * sub_08015608's two arguments arrive in r1 and r2 and are stored as
 * consecutive words -- and the eight bytes it moves are a `struct OamData`;
 * see the note on that type in unknown-globals.h. */
void sub_0801566C(s16, struct UnkVec *);
void sub_08015608(s16, struct UnkVec);
void sub_08015928(s16, u32);
/* ---- wave 25 (W25-C): the 0x08015 slot-accessor callees. None of these ten
 * had ever been declared, and three of them are the "PROMOTED BUT NEVER
 * DECLARED" trap -- sub_0801D96C, sub_0801DA44 and sub_0801DA54 are already
 * matched in src/decomp/c_0801D96C.c, c_0801DA44.c and c_0801DA54.c, so their
 * types below are COPIED FROM THOSE DEFINITIONS and were not re-derived.
 *
 * THE COPIED TYPES REFUTE THE sub_080156C4 NOTE DIRECTLY BELOW. That note
 * argues the `lsls #0x10; asrs #0x10` in sub_080156C4's tail is agbcc
 * re-narrowing an s16-returning sub_0801DA54; sub_0801DA54's promoted
 * definition returns `u32`, so no re-narrowing happens and the shift pair is
 * sub_080156C4's own `return (s16)...` cast under an `int` return type. Same
 * for sub_080156A0/sub_0801DA44. The declaration below is unchanged and still
 * right -- only the reason for it was wrong. Wave 25.
 *
 * The seven genuinely new ones, each read off the callee's own body:
 *   sub_080151B0  the slot initialiser. r0 is stored to BOTH .unk00 and .unk04
 *     (`const void *`), r1 narrows IN PLACE (`lsls #0x18; lsrs #0x18`, no copy)
 *     so it is a declared `u8`, r2 is a bare `strb` into .unk14 (u8). Ends
 *     `pop {r0}; bx r0`, so void.
 *   sub_08015A30  runs the slot's script through gUnknown_0848A160; r0 narrows
 *     in place to u8 and it ends `pop {r0}`, so void.
 *   sub_08015224  sub_0801527C's twin -- same save/restore of gUnknown_03001FBC
 *     around sub_080151B0/sub_08015A30, but it stores 0 to .unk12 where
 *     sub_0801527C stores 4, and narrows its index u16 rather than u8. Returns
 *     `adds r0,r5,#0` off an `asrs #0x18`, so s8.
 *   sub_08015438  parameters 3 and 4 are declared HERE AS ITS CALLER ALREADY
 *     DECLARES THEM (`void *`), deliberately not re-derived: inside
 *     sub_08015438 parameter 4's only use is `lsls #0x10; asrs #0x10`, i.e. a
 *     small SIGNED INTEGER and almost certainly not a pointer. Left alone
 *     because sub_08015410 is its only promoted caller, forwards both unchanged
 *     and is byte-identical either way. Settle it when sub_08015438 is matched.
 *   sub_0801D778 / sub_0801D804  ARITY IS READ OFF THE CALLEE, NOT THE WRAPPER:
 *     D778 forwards r0-r3 and supplies a fifth 0 to sub_0801D6E8, so four
 *     parameters; D804 writes r3 itself before calling sub_0801D78C, so three.
 *     `int` returns: neither narrows its own result, and the SINGLE
 *     `lsls #0x18; asrs #0x18` at sub_08015578's merge point is that function's
 *     own s8 return -- an s8 return here would have put one after EACH `bl`.
 *   sub_0801D9E4  THREE parameters, and this is the pass-through-wrapper trap
 *     in its pure form: its only caller sub_080155E8 touches r0 alone, so the
 *     arity is completely invisible there. The body `strh`s into [r1] and [r2]
 *     after an `asrs #8`, so both are `s16 *` out-parameters. */
void sub_080151B0(const void *, u8, u8);
void sub_08015A30(u8);
s8 sub_08015224(const void *, s16, u8);
s8 sub_08015438(void *, int, void *, void *, int);
int sub_0801D778(int, int, int, int);
int sub_0801D804(int, int, int);
void sub_0801D96C(int, s16, s16);
void sub_0801D9E4(int, s16 *, s16 *);
u32 sub_0801DA44(int);
u32 sub_0801DA54(int);
/* The six 0x08015 block members matched in wave 25 that had no prototype.
 *   sub_0801527C  sub_08015224's twin and sub_080152EC's worker: same
 *     save/restore of gUnknown_03001FBC around sub_080151B0/sub_08015A30,
 *     storing 4 rather than 0 to the slot's .unk12. Returns its own second
 *     argument re-narrowed `lsls #0x18; asrs #0x18`, so s8 out of a u8
 *     parameter -- the sign change is real code and not a spelling.
 *   sub_08015578  dispatches on `a != 0xff` between sub_0801D778 (four
 *     arguments, `a` included) and sub_0801D804 (three, `a` dropped). s8
 *     return; parameters 2 and 3 are forwarded untouched to both callees and
 *     are therefore invisible here -- `int` is the weakest fit, not a proof.
 *   sub_080155A0  `return sub_08015578(0xff, a, b, c);`, i.e. the "no first
 *     argument" entry point to the same dispatcher.
 *   sub_080155E8  a THREE-argument forwarder whose last two arguments are
 *     invisible in its own body; see the sub_0801D9E4 note above.
 *   sub_080156A0  sub_080156C4's exact twin on sub_0801DA44 instead of
 *     sub_0801DA54, `int` return for the same reason.
 *   sub_08015CE4  `sub_08015328(a); return 0;` -- the `movs r0,#0` before the
 *     epilogue is what makes it non-void. Nothing constrains the return type
 *     further; its single caller discards it. */
s8 sub_0801527C(const void *, u8, u8);
s8 sub_08015578(s16, int, int, u8);
s8 sub_080155A0(int, int, u8);
void sub_080155E8(s16, s16 *, s16 *);
int sub_080156A0(s16);
int sub_08015CE4(u8);
/* Two more from the wave-25 extension.
 *   sub_08015158  counts the slots whose .unk00 is 0 -- the same 30-slot scan
 *     sub_08015184 clears and sub_08015BD0 searches. A leaf with no `push`;
 *     the u8 accumulator comes back already zero-extended, so nothing
 *     constrains the return width and `int` is the weakest fit.
 *   sub_08015CF4  one step of a slot's command list, advancing the .unk04
 *     cursor by 8 and always returning 1. The 8-byte record type is local to
 *     src/decomp/c_08015CF4.c because it only ever describes that cursor. */
int sub_08015158(void);
int sub_08015CF4(u8);
/* `return sub_0801DA54(gUnknown_03001470[a].unk26);` -- a lookup keyed on the
 * same slot index everything else in this family uses. The PARAMETER is a free
 * choice at every call site found so far: sub_0804E7A8 and sub_0804FCA4 pass
 * gUnknown_03001FBC, which is a declared `s16` global and therefore loads with
 * `ldrsh` whichever way the parameter is declared. The RETURN is `int` on the
 * caller's evidence rather than the callee's: both callers put the result in a
 * `u16` local and get `lsls #0x10; lsrs #0x10`, which an `s16`-declared return
 * would have made `asrs`. The `lsls #0x10; asrs #0x10` in sub_080156C4's own
 * tail belongs to sub_0801DA54's declared return width, not to this one --
 * see the "missing return keyword" carve-out in docs/agbcc-codegen.md. */
int sub_080156C4(s16);
/* Continuation callbacks handed to sub_08015928 as a bare pool word by
 * sub_0804D928 and sub_0804E3B4. Only the symbol's address is used, so the
 * signature is not recoverable from the call site; both are themselves members
 * of the same setter family and take no arguments there. Declared `void(void)`
 * so `(u32)` casts of them compile. */
void sub_0804DA40(void);
void sub_0804E4CC(void);

/* ---- wave 13 (A1) ----
 * sub_08001D04 is a 32-byte linear search over the byte pairs at
 * gUnknown_084859E0: it walks two bytes at a time until `[p] == arg` and
 * returns `[p+1]`, or 14 if it hits the 0xFF terminator. `int(int)` and not a
 * narrow type either side -- the argument is compared with a bare `cmp` after
 * a `ldrb` of the table (so no promotion is visible on it) and sub_0800272C
 * feeds the result straight into `<< 12` with no `lsl/lsr` pair in between.
 *
 * sub_0803F6BC is the VRAM loader behind it: r2 is passed to sub_08011E54 as
 * a destination pointer (hence `void *`), r3 is only ever tested against zero
 * and gates the whole body, and r0 is the 6..17 switch selector. */
int sub_08001D04(int);
void sub_0803F6BC(int, int, void *, int);

/* The deferred-copy queue push, with 58 callers -- the widest fan-in in the
 * ROM after the proc API. It appends (src, dest, size) to gUnknown_0200B3B4[]
 * and returns the slot index, or -1 when the 0x30 slots are full and 0 when
 * gUnknown_030044D0 says to copy immediately; the value-returning epilogue
 * (`pop {r4,r5,r6}; pop {r1}; bx r1`) is what makes it non-void, and every
 * caller found so far discards the result. The third parameter is `u16`, not
 * `int`: the prologue narrows r2 with `lsls #16; lsrs #16` before the `strh`,
 * which is PROMOTE_MODE on a declared-narrow parameter and is not emitted for
 * an `int` that merely gets stored as a halfword. Neither pointer is `const`
 * -- both are stored into the queue record as plain words. */
int sub_08011E54(void *, void *, u16);
/* CpuFastSet wrapper: r0 indexes the (width, height) byte pair at
 * gUnknown_0848B780 + 4*r0 to get a tile count, r1 is a VRAM base and r2 a
 * tile index, and it copies `((w*h) & 0x3FF) * 0x20` bytes to
 * `r1 + ((r2 & 0x3FF) << 5)`. So the base is a `void *` and the index a plain
 * int; `pop {r0}` makes it void. */
void sub_0801F19C(int, void *, int);
/* gUnknown_0810BE60 / gUnknown_0810E820 by name and nothing else; both are
 * already promoted (matched) in src/decomp/c_08026190.c. */
u8 *sub_08026190(void);
u8 *sub_08026198(void);
/* `gUnknown_08499608[sub_08042DE0(a1) - 1][a2] << 2` over a 0x32-halfword row
 * -- a tile index, which is why sub_08002844 masks the result with 0x3FF.
 * `pop {r4}; pop {r1}` is the value-returning epilogue; both parameters arrive
 * bare and unnarrowed, so both are `int`. */
int sub_080261A4(int, int);

/* ---- wave 13 (A4) ----
 * All twelve already have a matched definition in src/decomp/ and none had a
 * prototype here yet; the signatures below are copied from those definitions
 * except the three that are still assembly.
 *
 * sub_0803CE28 takes two `int`s: `adds r6,r0,#0; adds r4,r1,#0` and then
 * `lsls r4,#5; adds r4,r4,r6; lsls r4,#1` with no sign- or zero-extension on
 * either, which is the `int` tell from the parameter rule in
 * docs/agbcc-codegen.md. sub_08023908 saves r0 bare (`adds r6,r0,#0`) with no
 * extension, same reading. sub_08023518 reads no argument register. */
void sub_08001D8C(void);
void sub_08001D9C(void);
void sub_08003934(void);
void sub_08003948(void);
void sub_080039BC(void);
void sub_080039D0(void);
void sub_08012BC8(u16 *, u16, u16, u16, u16, u16);
void sub_08023518(void);
void sub_08023824(void);
void sub_08023908(int);
void sub_0803CE28(int, int);
void sub_0803CEAC(void);

/* The sub_08023360 screen-init batch. sub_08011C68 is the VRAM blitter behind
 * sub_080116E8 and friends: r0 is a source of every pointer type in the tree
 * (`u16 *` tilemap buffers, the `u8 *` returns of sub_08026190/sub_08026198
 * and bare ROM blobs), so `const void *` is the only first parameter every
 * call site compiles against; r1 is always an absolute VRAM address and r2 a
 * byte count that the body narrows itself (`lsls r2,#0x10`), so it is not a
 * narrow parameter.
 *
 * sub_08035020 and sub_0801A57C take `u16`: both open `lsls r0,#0x10;
 * lsrs r0,#0x10` on an argument that survives a `bl`, which is PROMOTE_MODE on
 * a u16 parameter. sub_0803F80C, sub_08037150 and sub_08043834 save r0 bare
 * with no extension, so `int`. The rest read no argument register. */
void sub_08010FE0(void);
void sub_08011018(void);
void sub_080116E8(void);
/* THIRD PARAMETER RETYPED int -> u16 in wave 27, when the definition was
 * promoted. It is not a byte-neutral choice and the probe blind-spot warning
 * does NOT apply here -- `int` plus a `(u16)` cast at each use is a visibly
 * different function. With u16, PROMOTE_MODE's `lsls r2,#0x10` is emitted once
 * and every use folds its `lsrs #0x10` away: the `& 0x1f` test happens in the
 * shifted domain against 0x1f0000 (`movs #0xf8; lsls #0xd`), and `/2` and `/4`
 * come out as a bare `lsrs #0x11` / `#0x12`. With `int` the mask is a plain
 * imm8 AND that clobbers r1, which costs the dst pointer a spill into r4 and
 * turns `push {lr}` into `push {r4, lr}` -- 8 bytes and a different prologue.
 * sub_08011C90 follows its sibling; its own body is byte-identical either way.
 * Re-verified afterwards: the matched caller src/decomp/c_08023360.c, whose
 * `((u16)sub_080261A0() & 0x3ff) * 0x20` argument is the only non-constant one
 * in the ROM, still matches -- shorten_binary_op keeps that multiply in HImode
 * so the narrowing conversion is free. */
void sub_08011C68(const void *, void *, u16);
void sub_080128D0(void);
void sub_0801A57C(u16);
void sub_08022A34(void);
void sub_08023860(void);
int sub_080261A0(void);
void sub_0802D2EC(void);
void sub_08035020(u16);
void sub_080354FC(void);
void sub_08035568(void);
void sub_08037150(int);
void sub_0803F80C(int);
void sub_08043834(int);
void sub_080546BC(void); /* src/decomp/c_080546BC.c */
/* sub_080315E8 ends `pop {r1}; bx r1`, so it returns a value -- its own
 * second argument, re-narrowed to u16. Its first two arguments arrive
 * `lsls #0x10`, so both are u16; the THIRD is never read by the body, but
 * sub_080339B0 passes 0x40 in r2, so the declaration really does have three
 * parameters and only the width of the unused one is open. */
u16 sub_080315E8(u16, u16, int);
void sub_08033930(void);
void sub_0803D48C(void);
void sub_08085AF4(void); /* src/decomp/c_08085AF4.c */
/* sub_08027B10 takes five arguments and narrows none of them: r0-r3 are
 * `adds rN, rM, #0` / `mov r8, r3` and go straight into the proc it starts
 * as words at +0x2c..+0x38, and the fifth (`ldr r1,[sp,#0x14]`) is handed to
 * Proc_Start as the parent, so it is a ProcPtr. sub_0802813C is a bare
 * `bx lr` table read of gUnknown_08499E38[gUnknown_02028E40] whose caller
 * compares it with 4. */
void sub_08027B10(int, int, int, int, ProcPtr);
void *sub_0802813C(void);
/* The sub_0802966C batch. sub_08015328 takes s16 (`lsls #0x10` and then BOTH
 * `lsrs` and `asrs` on the same value); sub_08015C30 and sub_08029868 take u8
 * (`lsls #0x18; lsrs #0x18`), and sub_0802966C passes the s16 gUnknown_03001FBC
 * to both, which is why the call site reads it with `ldrb`. sub_0802E7C8's
 * third argument is saved bare (`adds r5,r2,#0`) so it is a pointer, and its
 * result is narrowed by the CALLER, so the return is int and the caller's u8
 * is a local. Its other three are `int` and NOT the narrow types its own body
 * re-narrows them to: sub_0802966C reaches it with `ldrsh` on two u16 globals
 * and with `movs r3,#1; negs r3,r3` for -1, and neither is expressible through
 * a u16/u8 parameter (those give `ldrh` and `movs r3,#255`). The narrowing
 * inside the callee is its own cast. sub_080357E0 narrows all four
 * register arguments to u16 and forwards its fifth straight to
 * sub_08035760 as a pointer. */
void sub_08015328(s16);
void sub_08015C30(u8);
void sub_080294FC(void);
void sub_08029570(void);
void sub_08029868(u8);
void sub_0802D558(void);
int sub_0802E7C8(int, int, void *, int);
void sub_08034F8C(void);
int sub_080357E0(u16, u16, u16, u16, void *);
/* `bool8` on the sub_080116A0 precedent: sub_0802B91C tests the result with
 * `lsls r0,#0x18; cmp r0,#0`, and an int-wide return emits no such shift. Its
 * first argument is narrowed to u8 by the body and its third to u16; the
 * second is passed through unnarrowed and sub_0802B91C hands it the u16
 * gUnknown_030033EC. */
bool8 sub_0802706C(u8, u16, u16);
/* A `gUnknown_030030F0.unk02 = 1` / `= 0` pair, both `bx lr` leaves with no
 * argument register read. */
void sub_0803BD54(void);
void sub_0803BD60(void);

/* Three more of the same sprite-attribute setter family's helpers, all reached
 * from sub_0804D290/sub_0804DCA8.
 *
 * sub_080155C0 is the position setter: `lsl #16; asr #16` on all three
 * arguments inside the callee AND at every call site, which is s16 on both
 * ends. sub_0804BCB8 is the same shape with `lsl #16; lsr #16` -- four u16s.
 * sub_08057D44 is already matched in src/decomp/c_08057D44.c and returns
 * `gUnknown_08555450[a2][a1]`, a u32 its callers use as the base of an array
 * of halfword pairs. */
void sub_080155C0(s16, s16, s16);
/* All four parameters are narrow -- the prologue is four `lsls #0x10; lsrs
 * #0x10` pairs in argument order -- but PROMOTE_MODE zero-extends every
 * sub-word parameter regardless of signedness, so the prologue cannot separate
 * u16 from s16 and the CALLERS have to. Argument 3 is SIGNED, from two of them:
 * sub_0804F658 and sub_0804E584 both pass gUnknown_0855214C[side] and both emit
 * `movs rN, #0; ldrsh rD, [rB, rN]` -- a u16 parameter rewrites an `ldrsh` into
 * an `ldrh` and needs no zero register, so the register-offset form is only
 * reachable with a narrow signed parameter. The other three have no informative
 * call site yet (sub_0804D290, sub_0804DCA8 and sub_0804F18C all pass literals
 * for 3 and 4), so they stay u16 as the weaker choice. Retyping 3 is
 * byte-neutral for the two promoted callers, which pass a literal 0. */
void sub_0804BCB8(u16, u16, s16, u16);
u32 sub_08057D44(int, int);
/* Two more sub_08015928 continuations, in exactly the position sub_0804DA40 and
 * sub_0804E4CC occupy above: sub_0804C6DC and its twin sub_0804CC38 hand each
 * one over as a bare pool word and nothing else in the ROM references either,
 * so only the address is used and `void(void)` comes from the registration
 * rather than from a call site. */
void sub_0804C8C8(void);
void sub_0804CE24(void);

/* ---- wave 13 (A2): sub_0802E4B4's callees ----
 * Every signature below is read off the CALLEE's own prologue, not off the
 * call site.
 *
 * sub_080242B0 / sub_0802D5E8 take `s16`: both open by narrowing r0 and r1
 * with `lsls #0x10; asrs #0x10` (the y one folded into `asrs #0xf` because it
 * is immediately doubled) before touching anything else, which is PROMOTE_MODE
 * on signed halfword parameters. sub_080242B0 returns a BYTE -- its only
 * caller narrows the result with `lsls #0x18` before the test.
 *
 * sub_08074320 / sub_08035584 / sub_080202A4 all take one gUnknown_08499594
 * ELEMENT pointer: each recovers the index with `p - gUnknown_08499594` and
 * multiplies it back up by the 0x0c stride. They are declared on
 * struct Unk030040D8 * because that is the type of the global every caller
 * hands them; see the note on struct Unk030040D8 in unknown-globals.h.
 *
 * sub_08022990's first two arguments are NOT narrowed at entry -- it forwards
 * r0/r1 untouched to sub_08013C00 -- so they are word-wide; only the third is
 * `u16` (`lsls #0x10; lsrs #0x10; mov r8, r2`). */
u8 sub_080242B0(s16, s16);
void sub_0802D5E8(s16, s16);
void sub_0802D458(void);
void sub_08074320(struct Unk030040D8 *);
/* CORRECTION, wave 28 (W28-A): declared `void` here, and it returns a value.
 * The epilogue is `pop {r4}; pop {r1}; bx r1` -- the value-returning form -- and
 * the two arms set r0 to the sub_080355CC result and to 0 respectively. Its one
 * promoted caller (src/decomp/c_0802E4B4.c) discards the result, which is why
 * nothing caught it; re-verified byte-for-byte after the change. */
ProcPtr sub_08035584(struct Unk030040D8 *);
void sub_08024454(void);
void sub_0801F92C(u8 *);
void sub_080202A4(struct Unk030040D8 *);
void sub_08022990(int, int, u16);
void sub_08038C98(void);

/* ---- wave 13 (A2): sub_080345C8's gUnknown_030032D8 state-machine table ----
 * All eighteen are void(void): not one reads r0-r3 before writing it (every
 * body opens with a `bl`, a pool `ldr` or a `movs` into r0) and every one ends
 * `pop {r0}; bx r0`. That is also what makes the dispatch a bare `bl` per arm
 * with no argument setup. */
void sub_0802DC2C(void);
void sub_08034350(void);

/* ---- wave 25: the 0x08034xxx block's own callees ----
 * The void(void) group first: every one of these is reached by a bare `bl`
 * with no argument setup and its callers discard r0.
 */
void sub_0802150C(void);
void sub_08021598(void);
void sub_080215B8(void);
void sub_080215D0(void);
void sub_0802FA64(void);
void sub_0805FD64(void);
void sub_08034394(void);
void sub_080343D8(void);
void sub_08034598(void);
void sub_08034780(void);
void sub_08034838(void);
/* sub_08034890 loads gUnknown_03003FC0.unk02 with `ldrb` and passes it with no
 * further narrowing, which is byte-identical for `int` and `u8`, so `int` is
 * the weakest model. */
void sub_0802163C(int);
/* sub_08034290 and sub_080342BC both pass a `movs`-sized 0. */
void sub_080638D0(int);
/* Definitions promoted in src/decomp/c_08034380.c and c_08034400.c -- these
 * declarations must agree with those. */
int sub_08034380(u8 *);
void sub_08034400(u8 *, u8 *);
/* Returns s16: sub_08034394 re-narrows the result with `lsls #0x10; asrs #0x10`
 * before comparing it against -1. The first parameter is `void *` and not a
 * struct pointer -- sub_08031790 and sub_08033678 pass gUnknown_03004400 where
 * sub_08034394 passes &gUnknown_030046C0, so no one struct type covers it. The
 * second is a predicate run over the object; sub_08034394 passes
 * sub_08034380 and the other two call sites pass a `movs`-sized 0. */
s16 sub_080309AC(void *, int (*)(u8 *));
/* A text-width helper: sub_08034A44 turns the result into the centred x of a
 * 240-pixel line, `(0xf0 - len * 8) / 2`, and the `/ 2` is a bare `lsrs #1`, so
 * the value is UNSIGNED -- a signed halving would have been the
 * `lsr #31; add; asr #1` triple. */
u32 sub_0808B6B0(const char *);
/* More void(void) callees of the 0x08034xxx block, all reached by a bare `bl`
 * with the result discarded. */
void sub_08028CF4(void);
void sub_08037F80(void);
/* WAVE 28 (W28-B): sub_080742FC and sub_08074460 return `u8`, not `void`.
 * Both end `lsls r0,#0x18; lsrs r0,#0x18` then `pop {r1}; bx r1` -- the shift
 * pair is the declared-narrow return's own epilogue narrowing and the `pop`
 * into r1 rather than r0 is agbcc keeping r0 live out, which it does only for
 * a non-void return.  Declared `void` each is 6 bytes off.  They are two of
 * six identical null-guards around one slot of struct Unk08074584. */
u8 sub_080742FC(void);
u8 sub_08074410(int, struct Unk030040D8 *);
u8 sub_0807443C(void);
const struct Unk08074584 *sub_08074584(void);
/* Already PROMOTED (src/decomp/c_08035000.c) and never declared here;
 * signature copied verbatim from that definition. */
const struct Unk085C77A0 *sub_08035000(int);
u8 sub_08074484(u8 *, struct Unk030040D8 *, int);
void sub_0802817C(void);
u8 sub_08074460(void);
/* sub_08034DB0 tests the result with a BARE `lsls #0x18` -- flags only, no
 * `lsrs` -- which is the truth-test shape of a byte-wide return. */
bool8 sub_0803B628(void);
/* sub_08034DCC reaches it as `ldr r0, =gUnknown_030033EC; ldrb r0, [r0]`. That
 * global is a u16, so the `ldrb` is a truncation folded into the load, which is
 * what a `u8` parameter costs and an `int` one would not. */
/* It returns `int`, not `void` (wave 28, W28-B) -- and never executes a
 * `return` statement: every arm of its switch ends in a call to a void
 * function and the value in r0 is whatever that call left there. The tell is
 * the epilogue: `pop {r1}; bx r1` rather than `pop {r0}; bx r0`. agbcc pops
 * the return address into r1 precisely when r0 is live out, i.e. when the
 * function has a non-void return type, and declaring it void is 2 bytes off.
 * This is an implicit-int definition with no return, not a value anyone uses:
 * its callers discard r0. */
int sub_08043DAC(u8);
/* Centred x for `s` on a 240-pixel line. Returns `int`: its one caller narrows
 * the result with `lsls #0x10; lsrs #0x10`, which is also exactly what passing
 * an int to sub_080119A0's `u16` first parameter costs, so the shift pair is
 * not evidence of a narrow return. */
int sub_08034A44(const char *);
void sub_08034938(void);
void sub_080349E4(void);
void sub_08034AF8(void);
void sub_08034C90(void);
void sub_08034CA4(void);
void sub_08034CB8(void);
void sub_08034CD4(void);
void sub_08034D18(void);
void sub_08034DB0(void);
void sub_08034DCC(void);
void sub_08034DF8(void);
void sub_08034EA4(void);
void sub_08034ED0(void);
void sub_08034EF0(void);
void sub_08034F1C(void);
void sub_0806171C(void);
/* `int`, NOT `s8`, and the call site is the proof: sub_080345C8 tests the
 * result twice with a bare `cmp r0, #0` and an `s8` return puts a
 * `lsls r0, #0x18` in front of each one (PROMOTE_MODE on the return value).
 * Its own body is byte-identical under either -- `ldrb; lsls #0x18; asrs #0x18`
 * is the s8 MEMBER read, not the return conversion -- so src/decomp/c_08034F6C.c
 * was retyped to agree; it still matches. */
int sub_08034F6C(void);

/* ---- wave 13 (A2): sub_080355CC's callees ----
 * sub_0803649C scans gUnknown_03003124[0..2] for a free slot and returns the
 * index or -1; `s16` because both returns are narrowed (`lsls #0x10;
 * asrs #0x10`) inside it and the caller narrows nothing.
 * sub_08035AE8 and sub_08035B00 both end on an `ldrsh`, so both return s16;
 * their parameters are read off their own prologues (`lsls #0x10; asrs #0x10`
 * = s16, `lsls #0x10; lsrs #0x10` = u16).
 * sub_0801C210's three parameters are likewise its own: a bare pointer copy,
 * then `lsls #0x10; lsrs #0x10` and `lsls #0x18; lsrs #0x18`. It returns
 * sub_0801C6E8's allocation or NULL.
 * sub_0801C4D4's second parameter is word-wide -- it copies r1 with a bare
 * `adds r4, r1, #0` and uses it as `lsls r4, #1` -- so the `ldrsb` at the call
 * site is the s8 STRUCT FIELD being read, not a narrow parameter.
 * sub_08035B3C returns the compressed graphic sub_080355CC hands to
 * Decompress, so `u8 *` (NOT const -- Decompress takes `u8 *`). */
s16 sub_0803649C(void);
void *sub_080364C4(void);
void *sub_08035B68(u16);
struct Unk0801C210 *sub_0801C210(void *, u16, u8);
void sub_0801C4D4(struct Unk0801C210 *, int);
/* Four parameters, read off sub_080272C4 / sub_08027428 (its only callers) and
 * its own prologue: r0 is compared against 0x7f with a SIGNED `ble`, r1 is
 * dead until r2 is copied over it, r2 is the value that copy carries, and r3
 * goes straight to sub_0801C4D4's `struct Unk0801C210 *` first parameter.
 * Nothing narrows any of them at entry, so `int` for the first three, and the
 * callers pass three words out of the proc plus the sub_0801C210 result
 * (wave 20, W20-C). */
void sub_08027560(int, int, int, struct Unk0801C210 *);
s16 sub_08035AE8(s16);
s16 sub_08035B00(u16);
u8 *sub_08035B3C(ProcPtr);
void sub_080359A4(ProcPtr);
/* sub_080359A4's own callees. All three are declared `int`-wide on the CALLER
 * side: sub_080359A4 hands them `(v + 8) / 16` expressions and struct fields
 * with no narrowing anywhere, and a u16 parameter would have put
 * `lsls #0x10; lsrs #0x10` in front of every one. Their own prologues do
 * narrow, which under the wave-11 reading is a cast at a use rather than
 * PROMOTE_MODE. sub_080255F4 returns a BYTE -- the caller tests it with
 * `lsls r0, #0x18`. */
void sub_080358C4(int, int);
/* CORRECTED in wave 18 (W18-C): sub_080255F4 is
 * `u8 (struct Unk08499594 *, s16, s16)`, not `(int, int, int)`.
 *   - Parameter 0 is a POINTER, not an int: the body NULL-tests it
 *     (`cmp r3,#0`), reads `[r3,#1]`, and takes `r3 - gUnknown_08499594` as an
 *     exact pointer difference by 12 (the *0xAAAAAAAB;asr#2 magic). Its caller
 *     sub_0802571C passes `&gUnknown_08499594[id]`.
 *   - Parameters 1 and 2 are 16 bits: the prologue carries `lsls #0x10;
 *     lsrs #0x10` on BOTH, which is PROMOTE_MODE and which an `int` parameter
 *     never produces. They are SIGNED because each is re-narrowed with
 *     `lsls #0x10; asrs #0x10` at its use.
 * The wave-15 comment above inferred `int` from sub_080359A4 passing
 * `(v + 8) / 16` with no narrowing, on the grounds that "a u16 parameter would
 * have put `lsls #0x10; lsrs #0x10` in front of every one". That is true of
 * u16 and NOT of s16: the argument there is `ldrsh` + 8 + `asrs #4`, which
 * gcc's num_sign_bit_copies puts at 20 sign bits, so the s16 conversion is
 * provably a no-op and combine deletes it. The other caller passes two `ldrb`s,
 * which is a no-op for the same reason. Neither call site was ever evidence
 * against s16 -- READ AN ABSENT NARROWING AS PROOF ONLY WHEN THE VALUE'S RANGE
 * DOES NOT ALREADY FIT. Neither caller is promoted. */
u8 sub_080255F4(struct Unk08499594 *, s16, s16);
/* Wave 29 (C) retyped the return from `int` to `u8`, on two independent
 * readings that agree. CALLEE side: sub_0801C254's own tail is
 * `bl sub_0801C2DC; lsls r0,#0x18; lsrs r0,#0x18` before the shared epilogue,
 * and its early-out arm sets `movs r0,#0` -- a byte-wide result being
 * normalised on the way out. CALLER side: sub_0803F4C8 (wave 29) truth-tests
 * the result with `lsls r0,#0x18; cmp r0,#0`, which is the re-narrowing agbcc
 * puts at every call of a narrow-returning callee; an `int` return there is a
 * bare `cmp r0,#0`. The only promoted caller, src/decomp/c_08075C98.c, DISCARDS
 * the result, so the change is byte-neutral for it -- rechecked with
 * try_match. */
u8 sub_0801C254(struct Unk0801C210 *, int, int);

/* ---- wave 18 (W18-C): the 0x080255F4 / 0x080257C0 neighbour-scan pair ----
 * All four return a byte -- every call site tests the result with a bare
 * `lsls r0, #0x18; cmp r0, #0` and sub_08025744 re-narrows sub_08026F5C's
 * result before returning it. sub_08025598 and sub_08025744 have the SAME
 * body shape (both open `lsls #0x10; asrs #0x10` on r0 and `lsls #0x10;
 * asrs #0xf` on r1, the latter being the `y * 2` row index folded into the
 * sign extension) and they still take DIFFERENT parameter widths. Each width
 * was read off the matched caller, which is the only place it is visible:
 *
 *   sub_08025598(s16, s16) -- sub_080255F4 narrows `x - 1` / `y - 1` with
 *     `lsls #0x10; asrs #0x10` in front of the call and leaves the bare
 *     `x` / `y` alone. That asymmetry IS the s16 conversion: its operands come
 *     from `(s16)` parameters, so num_sign_bit_copies proves the bare values
 *     already fit and drops those two, and does not for the +-1 forms.
 *
 *   sub_08025744(int, int) -- sub_080257C0's four arguments are all
 *     `ldrb`-derived, so an s16 conversion would be elided at ALL FOUR sites
 *     and the usual narrowing readout is blind here. The width still shows,
 *     as an ORDERING difference: with `int` the two calls whose second
 *     argument carries the arithmetic emit `subs r1, r5, #1; adds r0, r4, #0`,
 *     which is the ROM; with `s16` they come out in argument-number order.
 *     sub_08025744's other caller sub_08020DBC has the same tail and the same
 *     order. WHERE A NARROWING WOULD BE ELIDED, ARGUMENT-SETUP ORDER IS STILL
 *     A READOUT.
 *
 * sub_08026F5C takes s16 for the same reason its sibling sub_08026FD0 does:
 * the body is `(s16)a >> 6` (`lsls #0x10; asrs #0x16`) and sub_080257C0
 * narrows a pointer difference to s16 to pass it. */
bool8 sub_08026F5C(s16);
u8 sub_08025598(s16, s16);
u8 sub_08025744(int, int);
u8 sub_080257C0(u16);

/* ---- wave 13 (A2): sub_08040640's callees ----
 * sub_08026100 takes three word-wide arguments (`adds r4, r0, #0;
 * adds r5, r2, #0` and a signed `cmp r4, #0; blt`, no narrowing) and is void
 * (`pop {r4,r5,r6}; pop {r0}`).
 * sub_0801C70C takes SIX -- four in registers and two on the stack. Only the
 * last is narrow: it arrives as `ldr r1, [sp, #0x1c]; lsls #0x10; lsrs #0x10`
 * on its way to sub_0801C210's u16 second parameter. The first is `const void *`
 * so the ROM blobs its callers pass (gUnknown_08111D94 here, gUnknown_0810A3E8
 * and gUnknown_0810AFC8 from sub_0803F128) do not have to drop const; it is
 * forwarded to sub_0801C210, whose own first parameter will need widening to
 * match when that function is written. Returns a value, discarded here. */
void sub_08026100(int, int, int);
int sub_0801C70C(const void *, int, int, int, int, u16);

/* ---- wave 13 (A8) ----
 * sub_08053614(procId, palette): the id is SIGNED (`lsls #0x10; asrs #0x10` at
 * entry, and it is compared against -1) and the palette is UNSIGNED
 * (`lsls #0x10; lsrs #0x10`), which is the entry-narrowing readout and not a
 * guess. sub_0805741C's single argument is unsigned by the same test.
 * Both return nothing -- each ends `pop {r0}; bx r0` after a `pop` of the
 * callee-saved set, and their 41 call sites in sub_08053860 / sub_08053BB8
 * discard r0. */
void sub_08053614(s16, u16);
void sub_0805741C(u16);

/* The two halves of the "poke the eight neighbours of (x, y)" pair
 * sub_080081E0/sub_080083E0. Both arguments arrive as bare `adds rN, r0, #0`
 * with no narrowing on either end, so `int` on both, and sub_080015E4's result
 * is only ever `cmp r0, #0` -- an int return, since a bool8 one would carry
 * `lsl #24; lsr #24` at the eleven call sites. sub_08007F14's third argument is
 * a tile value out of the +0x0A22 u16 array, compared against 0x2a and 1 in the
 * callee with no narrowing. */
int sub_080015E4(int, int);
void sub_08007F14(int, int, int);

/* ---- wave 13 (A6) ----
 * The tile-edit helpers sub_0800B244 drives, all keyed by the same (x, y) cell
 * coordinate pair. Every argument arrives as a bare `adds rN, r0, #0` with no
 * narrowing at either end, so `int` throughout; sub_08001158 is already
 * defined that way in src/decomp/c_08001158.c and is only missing a prototype.
 * sub_0800B1FC's result is switched on against -1, 0 and 1, so it is a signed
 * int and not a bool; sub_0800119C's and sub_0800AFCC's are only ever
 * `cmp r0, #0`, and sub_08001704's and sub_08001A04's are forwarded straight
 * into sub_08001158's third parameter, which fixes them as int. */
void sub_08001158(int, int, int);
int sub_0800119C(int, int, int);
int sub_08001704(int, int, int);
int sub_08001A04(int, int, int);
int sub_0800AFCC(int, int);
int sub_0800B1FC(int, int);

/* ---- wave 14 (C) ----
 * Four more cell predicates on the same (x, y) key, all read off their own
 * prologues rather than guessed from a call site: each opens with a bare
 * `adds rN, r0, #0` / `adds rN, r1, #0` pair and no narrowing, so both
 * parameters are `int`, and each ends `pop {r1}; bx r1`, so all four return a
 * value. `int` on the return for all four: sub_0800A3D4 and sub_0800BF78 test
 * every one of them with a bare `cmp r0, #0` and no `lsls #0x18`, and
 * sub_0800A798 returns -1 on its first path (`movs r0,#1; rsbs r0,r0,#0`), so
 * it is signed. sub_080094EC is already defined as int(int, int) in
 * src/decomp/c_080094EC.c and was only missing a prototype; sub_08009B84's
 * result is forwarded into sub_08001158's third parameter, which is int. */
int sub_080094EC(int, int);
int sub_08009B38(int, int);
int sub_08009B84(int, int);
int sub_0800A798(int, int);

/* Three more on the same key, from sub_0800BF78. Same `adds rN, r0, #0` entry
 * reading for the parameters. The epilogues split: sub_0800BC98 ends
 * `pop {r4}; pop {r1}; bx r1` and its one call site tests the result with a
 * bare `cmp r0, #0`, so `int`; sub_0800C124 and sub_0800C22C both end
 * `pop {r0}; bx r0`, so both are void. */
int sub_0800BC98(int, int);
void sub_0800C124(int, int);
void sub_0800C22C(int, int);

/* Two more, from sub_0800977C. Same entry reading, and both end `pop {r1}`, so
 * both return a value; sub_08009720's result is only ever `cmp r0, #0`'d, and
 * sub_08009BF4's is fed to the branchless `rsbs; orrs; lsrs #0x1f` form of
 * `!= 0`, which is a plain int operand here (no `lsls #0x18` in front of it). */
int sub_08009720(int, int);
int sub_08009BF4(int, int);

/* ---- wave 23 (W23-C) ----
 * sub_0801A368 draws a box into one of the four 0x800-byte tilemap buffers
 * (gUnknown_08499578/7C/80/84, `u16 *` per src/decomp/c_08023360.c): one call
 * for the top row, `height - 2` calls for the middle rows and one for the
 * bottom, each 32 entries apart, then it marks whichever of the four buffers
 * it wrote with sub_08013AD4(0..3).
 *
 * The three helpers' parameter widths are read from the CALL SITE, not from
 * their own prologues: sub_0801A368 holds its own third argument as a bare
 * `int` (nothing masks r2 at entry, and it is spilled whole to [sp,#4]) and
 * re-narrows it with `lsls #0x10; asrs #0x10` before all three calls, and
 * narrows a `u16` local the same SIGNED way for sub_0801A240's fourth. A
 * sign-extending narrow at a call site is what a declared `s16` parameter
 * produces -- but an explicit `(s16)` cast against an `int` parameter is
 * byte-identical, so the WIDTH is proved and the declaration is not. Re-read
 * it off the callee prologues when one of the three is matched. */
void sub_0801A1D8(u16 *, int, s16, int);
void sub_0801A240(u16 *, int, s16, s16, int);
void sub_0801A2E4(u16 *, int, s16, int);
void sub_0801A368(int, int, int, int, u16 *, int);

/* ---- wave 13 (A8), second block ----
 * The sub_08065990 / sub_0806D944 screen-setup callees. Every parameter list
 * below is the entry-narrowing readout of the callee, not a guess from the
 * call site:
 *   sub_0801A444  four `lsls #0x10; asrs #0x10` -> four s16
 *   sub_0801F150  r0 is scaled by 136 as an index and never narrowed (int),
 *                 r1 is `str`ed whole (a pointer), r2 is `strh`ed (u16) and
 *                 r3 is `strb`ed (u8)
 *   sub_0801F234  r0 goes straight to sub_0801F3D4 with no narrowing -> int
 *   sub_0802D5A0 / sub_0802D5CC  nothing is narrowed at entry
 *   sub_08073304  seven arguments -- three arrive on the stack at [sp,#0x20],
 *                 [sp,#0x24] and [sp,#0x28] after a 32-byte push, and the
 *                 narrowing there is u16/u16/u16/u8 for arguments 3-6
 * sub_0801F49C is already DEFINED in src/decomp/c_0801F49C.c as
 * `u8 *sub_0801F49C(void)`; this only publishes it, and the pointer return is
 * what lets sub_08065990 spell `Decompress(sub_0801F49C(), ...)` with nothing
 * between the two `bl`s. */
void sub_08013B0C(void);
void sub_08013B1C(void);
void sub_08013CA8(void);
void sub_0801A444(s16, s16, s16, s16);
void sub_0801F114(void);
/* ARGUMENT 4 IS `int`, NOT `u8` (wave 29, W29-B, from the definition). Nothing
 * narrows r3 at entry and nothing narrows it before it is forwarded to
 * sub_0801F178 -- a declared `u8` puts `lsls #0x18; lsrs #0x18` in one place or
 * the other. The `strb` at +4 is the member truncating, not the parameter. All
 * seven promoted call sites pass a `movs`-sized literal and are unaffected. */
void sub_0801F150(int, void *, u16, int);
void sub_0801F234(int);
/* Five arguments, all `int`: the prologue copies r0-r3 with bare
 * `adds rN, rM, #0` / `mov r8, r2` and narrows none of them, and the fifth
 * arrives at [sp, #0x1c] after a 24-byte push. `pop {r0}; bx r0` -> void.
 * It is a PutSpriteExt front end -- arguments 2 and 3 are the x|flags and
 * y|flags words, and 1 and 5 are looked up in gUnknown_0848B780 /
 * gUnknown_0848BAE4 to pick the OBJ data. */
void sub_0801F34C(int, int, int, int, int);
u8 *sub_0801F49C(void);
void sub_0802D5A0(void *, int, int);
void sub_0802D5CC(int, int);
void sub_08065238(void);
void sub_0806574C(void);
void sub_0806D268(void);
void sub_0806D620(void);
void sub_0806D820(void);
void sub_0806D850(void);
void sub_08073304(const void *, void *, u16, u16, u16, u8, int);
void sub_080733B8(void);
/* The HBlank window-line generator that sub_08073B00 drives: five s32-shaped
 * arguments, the fifth on the stack and only ever 0 or 1. */
void sub_08073998(int, int, int, int, int);
/* Swaps the gUnknown_0202FDE0 / gUnknown_0202FDE4 double buffer. */
void sub_08073AE8(void);
void sub_08063928(int);

/* The two payload handlers sub_0804E8F0/sub_0804FE10 pick between. Three u16
 * parameters on both: each opens `lsl #16; lsr #16` on r0, r1 and r2, and both
 * end `pop {r0}; bx r0`, so void. */
void sub_0804EA54(u16, u16, u16);
void sub_0804EAEC(u16, u16, u16);

/* ---- wave 13 (A7) ----
 * sub_0808BB0C is fabsf: sub_0808B710 (matched, the ROM's sinf) hands it the
 * range-reduced float in r0 and compares the result against 1.1920929e-07
 * before running the sin polynomial, so it takes a float and returns one. */
float sub_0808BB0C(float);

/* ---- wave 13 (A8), fourth block ----
 * The nineteen tile-action handlers sub_080085E0 dispatches to. Every one takes
 * the (x, y) cell pair as a bare `adds rN, r0, #0` with no narrowing at either
 * end -- same reading as the sub_0800B244 group above -- so `int` throughout,
 * and sub_0800C454's third argument is unnarrowed too. The three declared
 * `int`-returning ones are the predicates: sub_0800B528's result is tested
 * `blt 0` (so it is signed and -1 means "none"), sub_0800C840's and
 * sub_0800BF78's and sub_08009F10's are only `cmp r0, #0`. */
void sub_080011F4(int, int, int);
void sub_08007CA0(int, int);
void sub_08008BB8(int, int);
void sub_08008F6C(int, int);
int sub_08009F10(int, int);
void sub_0800AF74(int, int);
int sub_0800B528(int, int);
void sub_0800BA9C(int, int);
void sub_0800BEE4(int, int);
int sub_0800BF78(int, int);
void sub_0800C454(int, int, int);
void sub_0800C608(int, int);
int sub_0800C840(int, int);
void sub_0800CF28(int, int);
void sub_0800EC20(int, int);
void sub_0800F4E0(int, int);
void sub_08010D28(int, int);
void sub_08010D80(int, int);

/* ---- wave 13 (A7), second block ----
 * Three plain `int`s: sub_08085410 (matched) hands it two `ldrb` bytes and its
 * own second parameter with no narrowing anywhere, and sub_080430B0 scales all
 * three as bare indices (`muls r3, r2, #0x5c`, `r1*0x44`, `r0*0x104`). The
 * result is SIGNED and small -- sub_08085410 switches on it over -30..80 with
 * `adds r0, #0x1e; cmp r0, #0x6e; bls`, the signed-range jump-table idiom. */
int sub_080430B0(int, int, int);

/* Called by sub_08069EAC with a literal 0 or 1 -- a direction/side flag. The
 * literal argument fixes nothing about the width, so `int` is the weakest
 * declaration that compiles the call site exactly. */
void sub_08069D3C(int);

/* The glyph blitter sub_0801172C dispatches to. All three parameters are u16:
 * sub_0801172C passes `y - 7` for three of its cases and that argument alone
 * carries `lsls #16; lsrs #16`, which is the truncation a u16 parameter forces
 * on an expression that is not provably 16-bit -- the other two arguments and
 * the tile constants are provably narrow and so carry none. */
void sub_08011704(u16, u16, u16);

/* The 0x0806A054 screen-setup group.
 *
 * sub_080674F4 takes a `u8`: its one call site passes `gUnknown_0202F204++`,
 * whose value already arrives zero-extended from `ldrb`, and the ROM still
 * emits `lsl #24; lsr #24` -- that redundant pair is the argument conversion
 * and an `int` parameter cannot produce it. Its result is stored with `str`.
 * sub_080677BC is matched (c_080677BC.c): it starts gUnknown_08580FE4 under
 * the caller's fourth argument as parent and files the first three at +0x58,
 * +0x34 and +0x38, all `str`. */
int sub_080674F4(int);
void sub_080670F8(const u8 *);
void sub_08069FD0(void);
ProcPtr sub_080677BC(s32, s32, s32, ProcPtr);

/* The two debug-text primitives sub_08057464 (matched) drives. Both narrow r0
 * and r1 with `lsls #16; lsrs #16` in their own prologue, which is PROMOTE_MODE
 * on declared-`u16` parameters; the caller passes small constants and bare
 * `ldrh` results, so nothing is emitted at the call site either way and the
 * `u16` reading comes entirely from the callee. They differ only in the third
 * argument: sub_080119A0 saves it bare and uses it as a string, sub_08011A20
 * saves it bare and it arrives from `ldrsh` on an s16 global -- unnarrowed, so
 * `int` and not `s16`, by the parameter rule in docs/agbcc-codegen.md. */
void sub_080119A0(u16, u16, const char *);
void sub_08011A20(u16, u16, int);

/* Two more of the 0x08068AC4 group. sub_0806775C starts a proc under the
 * caller's second argument (the gUnknown_08580FCC entry noted in
 * unknown-globals.h) and its first argument is a literal 0 at the one call
 * site. sub_080718F8's first argument is a byte cursor into the
 * gUnknown_08499584 buffer, its second a ROM blob and its third a literal 0.
 *
 * NOTE, so nobody tries to "fix" this: sub_080718F8 is not a function. It is a
 * linker THUMB->ARM interworking veneer for the ARM routine sub_0800043C -- see
 * data/asm-resident.json, which records both halves. The original source called
 * sub_0800043C and the linker synthesised the veneer; we cannot, because the
 * split already owns the veneer's four bytes as its own unit, so C has to name
 * the veneer and let the `bl` land there. This is a spelling forced by the
 * split, exactly like the `&gUnknown_XXXXXXXX` pool-word case in
 * docs/agbcc-codegen.md, and it is NOT a claim about the original. Four matched
 * drafts now rely on it -- sub_08068AC4 (promoted) plus sub_0806BB08,
 * sub_0806EB5C and sub_0806ED7C -- so if sub_0800043C is ever promoted, every
 * one of them has to be re-pointed at it and re-verified. The declared
 * types describe sub_0800043C's parameters, since the veneer has none of its
 * own. */
void sub_0806775C(int, ProcPtr);
void sub_080718F8(void *, u8 *, int);

/* ---- wave 13 (A1) ----
 * Declared WITHOUT a prototype, the same way sub_0801BB10 is above, and that
 * is deliberate: src/decomp/c_0801C240.c already defines it as
 * `void sub_0801C240(struct Unk_0801C240 *)` on a struct type that is local to
 * that file, so any prototype here naming a different pointer type makes that
 * already-matched file fail with `conflicting types`. An empty parameter list
 * is compatible with the existing definition and still lets sub_0801C2DC call
 * it. The real fix is to lift struct Unk_0801C240 into unknown-globals.h and
 * merge it with struct Unk0801C2DC (it is the same object -- 0801C240 clears
 * its +0x00, which is the same `unk00 != NULL` gate sub_0801C2DC opens with);
 * that is a promotion-time edit to another agent's file, not a wave edit. */
void sub_0801C240();

/* sub_08011BD4 returns s16: sub_08021DD8 compares its result with
 * `lsls r0, #16; cmp r0, #0x1000 << 16`, which is the sign-extending form of
 * `<= 0x1000` and is only generated for a 16-bit signed value. The two
 * sub_08021Dxx animation kickers take a small int selector (0..7) passed bare
 * in r0 with no narrowing, and both return nothing. */
s16 sub_08011BD4(void);
void sub_08021D64(int);
void sub_08021DA0(int);

/* The BIOS fast fill/copy. sub_080688E4 calls it with a stack zero, a VRAM
 * destination and 0x01000100 -- bit 24 set is FILL, low 21 bits the word
 * count. Declared here rather than in a gba/ header because nothing else in
 * the tree has needed it yet. */
void CpuFastSet(const void *, void *, u32);
/* The BIOS affine-matrix helper, first needed in wave 26 by sub_080678EC. Its
 * source block is exactly `struct BgAffineSrcData` (include/gba/types.h): the
 * ROM builds a 0x14-byte stack frame whose two words, four halfwords and
 * trailing halfword land on texX/texY, scrX/scrY/sx/sy and alpha in that order.
 * The destination is gUnknown_030024D0, which hardware.h already declares as
 * `volatile u32 [4]` -- 0x10 bytes, i.e. one BgAffineDstData -- so callers cast
 * it explicitly rather than the declaration being changed under its other
 * users. */
void BgAffineSet(struct BgAffineSrcData *, struct BgAffineDstData *, s32);
/* `pop {r0}; bx r0`, so void. Its argument is used as a full word
 * (`lsls r5, r0, #0x18` at a USE, with no PROMOTE_MODE pair in the prologue),
 * which per the copy-then-narrow rule makes the parameter `int` and the
 * narrowing an (s8) cast inside the body. sub_080674BC passes a constant 1. */
void sub_08013928(int);
/* Both parameters are used as full words -- r0 is scaled by 0x44 into
 * gUnknown_084A0090 with no mask, r1 gets `+0x80` and `& 0x3ff` before being
 * turned into a VRAM offset -- so `int` twice; `pop {r0}` makes it void.
 * sub_08067DF8 passes a u8 proc field and a u16 table element, both of which
 * widen for free. */
void sub_08043BF8(int, int);
/* ---- wave 28 (W28-B): the rest of the 0x08043Axx graphics-slot block ----
 * All of these scale their first argument by 0x44 into gUnknown_084A0090 with
 * no mask, exactly as sub_08043BF8 above does, so it is `int` in every one of
 * them; all end `pop {r0}` / `pop {r1}` with no caller reading r0, so all are
 * void. sub_08043AA0 and sub_08043AC0 take the `% 24` remainder of that index
 * -- and sub_08043AC0 takes it AGAIN on its own parameter, which is why its
 * body opens with two chained __modsi3 calls on one value.
 * sub_08017860, sub_08042FFC and sub_08043D84 are already PROMOTED
 * (src/decomp/c_08017860.c, c_08042E2C.c, c_08043D84.c) and were never
 * declared here; the signatures are copied verbatim from those definitions.
 * sub_080436DC's third argument is `strh`-stored into the u16
 * gUnknown_030005D0 and its one readable caller (sub_0804360C) loads a u16
 * global into it, so nothing narrows either way -- `int` is the weakest fit.
 * sub_08043D00 reads no argument register and its caller sub_08043D5C sets
 * none up. */
void sub_08043AA0(int, int);
void sub_08043AC0(int, int, int);
void sub_08043B14(int, int);
void sub_08043B44(int);
void sub_08043BC8(int, int);
void sub_080436DC(int, int, int);
void sub_0804365C(int, int);
void sub_08043D00(void);
/* sub_08017860 returns `int`, not the `u8` its promoted definition used to
 * name (wave 28, W28-B). Its body is `ldrb r0, [&gUnknown_0200C420 + 0x20 + i]
 * ; bx lr`, which is the same four instructions either way -- byte-neutral at
 * the definition, so the definition never had an oracle for it. The readout is
 * at sub_08043AA0, which forwards the result straight into sub_08043AC0's
 * third parameter with a bare `adds r2, r0, #0`: a u8 return re-narrows at
 * every call site, and that call site does not. c_08017860.c was retyped to
 * match and re-verified. */
int sub_08017860(int);
int sub_08042FFC(int);
u16 sub_08043D84(u8);
/* No calls, no arguments read, and its one caller (sub_08067070) discards
 * whatever is in r0 afterwards, so `void` is the weakest model that fits. */
void sub_080658AC(void);
/* The three gUnknown_030030B4-style BG-control field setters, already matched
 * in src/decomp/c_08012C1C.c / c_08012C30.c / c_08012C48.c. They take the
 * `struct Unk8012C30 *` those files define; the tag is forward-declared here so
 * callers in other units can name it without duplicating the layout, and they
 * cast their `union BgCntBuf *` at the call. */
struct Unk8012C30;
void sub_08012C1C(struct Unk8012C30 *, u32);
void sub_08012C30(struct Unk8012C30 *, u32);
void sub_08012C48(struct Unk8012C30 *, u32);
/* Starts the follow-up proc for sub_080688E4 under the caller's fourth
 * argument; the first three are `int` (0xC00, -0x28 and 0 at the one call
 * site, so the second is signed). */
void sub_08067898(u32, u32, u32, ProcPtr);
/* The gUnknown_08580FF4 proc's +0x60 setter (see the script's note in
 * unknown-globals.h). sub_08069B90 calls it with a bare `movs r0, #1` and
 * nothing narrows the argument. */
void sub_080678BC(u32);

/* Three more of the sub_0806B708 group. sub_08072C28's first argument is the
 * gUnknown_0849957C buffer and the other two are byte counts/offsets (0x400
 * and 0x280 at the one call site). sub_0806AF44 takes the caller's proc. */
void sub_08072C28(u16 *, u32, u16);
void sub_0806B120(void);
void sub_0806AF44(ProcPtr);

/* SWI 6's remainder wrapper: sub_0807D918 uses the result as a plain index. */
int DivRem(int, int);
/* Two more gUnknown_030058E0 display-list builders, both taking a byte pulled
 * out of that array. sub_08043E3C's second argument is a VRAM tile address
 * (0x06013000 / 0x06013480 / 0x06013900 at the three call sites). */
void sub_08043BA4(int, int, int);
void sub_08043E3C(int, void *, int);

/* sub_08068BE4 (matched) calls it `sub_080673B0(0x20, 1, proc)` and hands it
 * its own proc pointer, which is the third-argument-is-the-parent shape the
 * gUnknown_08580E94 note in unknown-globals.h already records for it. Neither
 * of the first two arguments is narrowed at the call site. */
void sub_080673B0(u32, u32, ProcPtr);

/* sub_08015410 forwards to sub_08015438 and RETURNS s8: it sign-extends
 * sub_08015438's result with `lsls #24; asrs #24` before returning, and its
 * caller sign-extends again before a `strh`, which only makes sense if the
 * declared return is a signed byte. Parameters 2 and 5 are `u8` -- both are
 * re-narrowed with `lsls #24; lsrs #24` inside the callee, which is PROMOTE_MODE
 * on a declared-narrow parameter. sub_0804C400 takes the same u16 unit index
 * everything else in that family does. */
s8 sub_08015410(void *, u8, void *, void *, u8);
/* OPEN, and it does not matter to any caller yet: sub_0804C400's prologue is
 * `adds r4,r0,#0; lsls r4,#0x10; lsrs r4,#0x10`, which is copy-THEN-narrow,
 * and the rule in docs/agbcc-codegen.md reads that as an `int` parameter with
 * a cast at a use rather than a declared-narrow one. The register pressure
 * does not explain the copy -- sub_08053670 also has to keep its narrowed
 * argument across two calls and gets `lsls r0,r0,#0x10; lsrs r5,r0,#0x10`
 * with no copy at all. Left as u16 because that is what its whole family
 * takes and because it is byte-neutral for the three wrappers that only
 * forward to it (sub_0804C488, sub_0804C498 in work/, whose own parameter is
 * narrowed by PROMOTE_MODE either way). Settle it when sub_0804C400 itself is
 * matched, not before. */
void sub_0804C400(u16);
/* Two more of the same family, both called by sub_0804E7A8 / sub_0804FCA4 with
 * (side, slot) out of gUnknown_03001470[gUnknown_03001FBC].unk30 / .unk34.
 *   sub_08056E9C is PROMOTED in src/decomp/c_08056E9C.c as (u16, u16) and had
 * no prototype, which is the "promoted and still undeclared" trap in
 * docs/agbcc-codegen.md -- the types here are copied from the definition, not
 * re-derived.
 *   sub_0804BDD8's third parameter is `s16`: its prologue zero-extends r2 AND
 * sign-extends the same value (`lsls #0x10; lsrs r0,#0x10 ... asrs r2,#0x10`),
 * which is PROMOTE_MODE plus a signed use, and both callers pass the s16
 * gUnknown_03001FBC. The return is `int` on the same caller-side evidence as
 * sub_080156C4 above: both callers narrow it with `lsls #0x10; lsrs #0x10`
 * into a u16 local. */
void sub_08056E9C(u16, u16);
int sub_0804BDD8(u16, u16, s16);

/* The 0x0806E000 screen's helpers, all named only by sub_0806EB5C. The five
 * that end `pop {rN}; bx rN` after a bare `bl Proc_Start` pass their own last
 * argument straight through as Proc_Start's parent, which is what types it
 * ProcPtr; sub_0806E5CC narrows its first argument with `lsls #16; lsrs #16`
 * and is therefore u16, the rest arrive unnarrowed and are `int`. */
void sub_0806F000(int, int);
void sub_0806EB28(ProcPtr);
void sub_0806E5CC(u16, ProcPtr);
void sub_0806E8C8(int, ProcPtr);
void sub_0806E510(ProcPtr);
void sub_0806E728(ProcPtr);
void sub_08073FF4(int, const void *, ProcPtr);

/* Named only by the two wave-13 A7 near-misses sub_0806BB08 and sub_080867BC.
 * sub_0808B6E8 is a memcpy: (dst, src, size) with a stack destination and an
 * 0x12 literal size. sub_08087248 and sub_08087298 take nothing and return a
 * value that is stored with `strh` into a u16 global and used in `int`
 * arithmetic first, so `int`. sub_08086BF8/sub_08086CE0 take the same three
 * arguments in the same order at both call sites. */
/* sub_0806B9CC immediately precedes sub_0806BA6C and shares its shape: four
 * byte parameters stored via bare `strb rN,[..]` with no prologue narrowing
 * at all, so int is the weakest type that fits (wave 22, src/decomp/c_0806B9CC.c). */
/* Takes no arguments -- its first instruction writes r0 -- and `pop {r0}`
 * makes it void. Its one caller, sub_0806C8DC, happens to have a zero in r0 at
 * the call, which is a coincidence of the preceding store and not an argument.
 * It clears a 20x22 halfword window of *gUnknown_08499578 and flushes. */
void sub_0806C8A0(void);
void sub_0806B9CC(int, int, int, int);
void sub_0806BA6C(int, int, int, int);
void *sub_0808B6E8(void *, const void *, int);
void sub_08086EB0(int);
void sub_08087104(void *);
int sub_08087248(void);
u16 sub_08087298(void);
void sub_08086BF8(u32, u32, int);
void sub_08086CE0(u32, u32, int);

/* ---- wave 13 (A1), second block ----
 * Three more of the (x, y) cell family the A8 block above documents, same
 * `adds rN, r0, #0` reading, same `int` throughout.
 *
 * sub_0800164C is the "is this cell road-like" predicate: it reads
 * gUnknown_08499590 + 0x1432 + rowOffset[y] + x and returns 1 for 7, 0xD or
 * 0x13 (the last through the branchless `eors #0x13; rsbs; orrs; lsrs #0x1f`
 * idiom) and 0 otherwise. Value-returning epilogue. Its three constants are
 * also what pins sub_0800C124's switch case list -- see the "two empty cases
 * collapse, three do not" rule in docs/agbcc-codegen.md.
 *
 * sub_08008C34 returns a value too (`pop {r4,r5}; pop {r1}`) and is only ever
 * used as a guard (`cmp r0, #0; bne`), so `int` with the signedness inherited
 * rather than proved. sub_08007F9C ends `pop {r0}`, so it is void. */
int sub_0800164C(int, int);
int sub_08008C34(int, int);
void sub_08007F9C(int, int);

/* The pair sub_08040CA4 opens with, both (id, tileBase, paletteNum). The first
 * argument reaches them as a bare `ldrb` off the caller's struct with no
 * re-narrowing, so it is `int` and not `u8`; both return nothing. */
void sub_0804103C(int, int, int);
void sub_08041128(int, int, int);

/* wave 13 (A5), the sub_0805D438 script step's callees. sub_080129E0 is the
 * LCG already matched in src/decomp/c_080129E0.c and returns u32 -- the caller
 * takes it modulo 100 through __umodsi3, which is the unsigned helper and so
 * corroborates the return type. sub_08071908 is compared against zero with a
 * bare `cmp r0,#0`, no `lsls #24`, so it is int-wide rather than bool8. */
u32 sub_080129E0(void);
void sub_0805A95C(void);
void sub_0805E9DC(void);
int sub_08071908(void *);

/* Three more of the screen-setup group, from sub_08080498.
 *
 * sub_08012B70 takes five arguments -- r0..r3 plus one word at [sp] -- and
 * sub_08073574 takes six, r0..r3 plus two words. Both counts are read off the
 * call site's `str rN, [sp, #k]` stores, which are the only evidence available;
 * the widths are `int` because every argument arrives as a bare register or a
 * shifted immediate with no narrowing. sub_0807898C is called for effect with
 * no argument register read and ends `pop {r0}; bx r0`. */
void sub_0807898C(void);
void sub_08012B70(u16 *, void *, int, int, int);
void sub_08073574(int, int, int, int, int, int);

/* The two text/graphics emitters sub_080852A8 chooses between. Six arguments
 * each -- r0..r3 plus two words at [sp] and [sp, #4]. They differ in the third
 * argument's type and that is real: sub_08014668 takes a u16 tile value read
 * with `ldrh`, sub_080149C0 takes a `u8 *` read with `ldr` out of
 * gUnknown_08610A38. */
/* Wave 21 (W21-A) corrects sub_08014668 on two axes, from the body rather than
 * from the call sites:
 *   Arguments 4..6 are `u16`, not `int`. They are narrowed `lsls #0x10;
 * lsrs #0x10` BEFORE the `gUnknown_03002514 = 0` store, i.e. in the prologue,
 * which is PROMOTE_MODE on a narrow parameter and not a conversion at the
 * sub_080147B4 call -- an `int` spelling emits the same three narrowings but
 * interleaved with the outgoing `str`s, eight instructions later. Byte-neutral
 * at the three existing call sites (c_08084580.c twice, c_080852A8.c once):
 * every argument passed is already a u16 `ldrh` or a constant.
 *   It RETURNS sub_080152EC's result. `pop {r1}; bx r1` where r0 is otherwise
 * free is the value-returning epilogue -- its byte-identical twin
 * sub_080146D4 does the same, and the two void functions next to them
 * (sub_08066BF4, sub_08066C70) pop into r0. Also byte-neutral at the callers,
 * which all discard it. */
struct Unk03001470 *sub_08014668(int, int, u16 *, u16, u16, u16);
void sub_080149C0(int, int, u16 *, u8 *, int, int);

/* Takes the raw, UNCLAMPED Interpolate result from sub_080737EC -- the clamp to
 * 0..0xF0 there feeds gUnknown_030024E4 and not this call, which is visible as
 * two separate registers live across the bitfield block. */
void sub_08073714(int);

/* The per-frame tail of sub_08076494 / sub_0807662C: called unconditionally,
 * last, with no argument register read, and both callers ignore any result. */
void sub_080763C0(void);

/* Its fourth parameter is an 8-byte aggregate BY VALUE: sub_08022BB8 passes
 * word 0 in r3 and word 1 in the first outgoing stack slot, with the trailing
 * `1` above it at [sp, #4]. `struct UnkVec` and `struct OamData` are the same
 * eight bytes; the caller fills the OAM view and hands over the vector view. */
void sub_0801C01C(u16, u16, void *, struct UnkVec, int);

/* Both take ONE parameter that their own bodies never read -- a dead leading
 * parameter, which is invisible in the body and only readable at the callers.
 * Both callers set r0 up: sub_08043DAC does `ldrb r0,[r0,#0x1d]` and
 * sub_08080EE4 / sub_08080EF8 do `ldr r0,=gUnknown_03005970; ldr r0,[r0]`.
 * Neither load could survive -O2 if the value were unused at the call, so the
 * parameter is real however dead it is inside.
 *
 * `int` and not a narrow type: sub_08080EE4 passes the whole word out of
 * gUnknown_03005970 with no `lsl #24; lsr #24` in front of the `bl`, which a
 * u8 parameter would have forced. Both are void (`pop {r0}; bx r0`). */
void sub_08043DF4(int);
void sub_08043E18(int);

/* Its two callers -- sub_08041E94 and sub_080424FC -- both pass exactly
 * `gUnknown_030040D8`, i.e. the dereferenced pointer global, so the parameter
 * is that struct pointer rather than the `int` a bare `adds r4, r0, #0` would
 * otherwise suggest.
 *
 * The `u8` return is read off the body's own `lsls #0x18; lsrs #0x18` in front
 * of `pop {r1}`, and is NOT firm: both call sites discard the result, so per
 * the forwarding rule in docs/agbcc-codegen.md nothing here proves the width --
 * the shift is equally the re-narrowing of sub_08074484's own u8 return. Revisit
 * when a caller keeps the value. */
u8 sub_080743E8(struct Unk030040D8 *);

/* A three-way range dispatch on the first argument: 0x60..0x9f goes to
 * sub_0803C9D4, 0x20..0x5f to sub_0803CA00, 0x00..0x1f to sub_0803CB40, and
 * anything else falls out doing nothing. `pop {r0}; bx r0`, so void.
 *
 * The second parameter is at least 16 bits: sub_08038690 passes its own
 * incoming r0 straight through with no narrowing, and sub_0803CBA0 itself
 * narrows it with `lsls #0x18; lsrs #0x18` at each of the two uses that forward
 * it -- a cast at a use, not PROMOTE_MODE, so the two inner callees take `u8`
 * and this one does not.
 * The first parameter is `int` on the same evidence from sub_08038690 (a bare
 * `movs r0, #0x60`), but it is the weaker half: sub_080190EC reaches it with
 * `movs r1,#8; ldrsh r0,[r0,r1]`, which an `s16` parameter would also produce,
 * and no call site yet separates the two. */
void sub_0803CBA0(int, int);

/* Four already-promoted definitions that had no prototype, so every new caller
 * hit `implicit declaration` under -Werror. These agree with
 * src/decomp/c_08019260.c, c_08019850.c, c_0804018C.c and c_08074AAC.c by
 * construction; see those files for the evidence behind each type. */
bool8 sub_08019260(void);
/* Wave 30, W30-E. Both widths are read off the callee, not guessed at the
 * call: it opens `lsls r0,#0x18; lsrs r2,r0,#0x18` (a u8 parameter, used as
 * the index into one of four ROM byte tables) and ends `ldrb r0, [r0]; bx lr`
 * (a u8 return). Its three callers are all still in asm/. */
u8 sub_0804A18C(u8);
bool8 sub_08019850(void);
void sub_0804018C(void *);
void sub_08074AAC(const u8 *, ProcPtr);

/* ---- wave 14 (B): callees of families F011, F024, F025 and F045 ---- */

/* The nine FIRST callees of family F011 (`bl f; ldr r0,=g; movs r1,#N; bl h`).
 * All nullary: r0 is written before it is read in every one of them --
 * sub_08038D7C, sub_08016ED8 and sub_08044BB0 open with a pool `ldr`,
 * sub_080745C0 with a pool `ldr` and a `movs`, and sub_08037F18 is a bare
 * `bx lr` with no body at all. Every one that pushes lr pops into r0, so void;
 * sub_080745C0 is a leaf ending in a bare `bx lr`, where the return type is
 * not recoverable and `void` is the byte-neutral choice (its only caller,
 * sub_08078124, discards). sub_0801A168, sub_080116E8 and sub_08023348 are
 * already declared above and are the same reading. */
void sub_08016ED8(void);
void sub_08037F18(void);
void sub_08038D7C(void);
void sub_08044BB0(void);
void sub_080745C0(void);

/* Registered through sub_0801F024((void *)sub_08039188, 2) by sub_08039264 --
 * the third member of the callback set the sub_0801F024 comment above
 * describes, and the same reading applies: it is a void(void) body that
 * ignores whatever sub_0801F024 hands it, so the `(void *)` cast at the call
 * site is the honest spelling and not a workaround. */
void sub_08039188(void);

/* Walks the byte-stream script in r0 until it sees a 1, calling
 * sub_0801B7C0(cursor, arg) on each opcode and advancing by
 * sub_0808B6B0(cursor) + 1. `pop {r4, r5}; pop {r0}`, so void. The first
 * parameter is genuinely `const u8 *` and not the opaque `const void *` its
 * F011 siblings use -- this one dereferences it (`ldrb r0, [r4]`). The second
 * is `int`: `adds r5, r1, #0` with no shift pair in the prologue, and its only
 * call site (sub_0801B750) passes a `movs`-sized 0, which is byte-identical
 * for every integer type. */
void sub_0801B8A8(const u8 *, int);

/* Family F024's callee. A four-instruction leaf: `str r1,[r0,#4]` then zeroes
 * +0x08 (word) and +0x10 (halfword), then `bx lr`. Leaf with a bare `bx lr`, so
 * the return type is not recoverable -- all six call sites discard, and r0 is
 * still the incoming pointer at exit, so `void` is byte-neutral.
 *
 * The first parameter is `struct Unk03001470 *`, NOT the `void *` a wave-14
 * agent inferred as "the weakest model that fits". The weakest-model rule is
 * the right default for a type nobody else has named, but this one is already
 * named: src/decomp/c_08063A30.c is promoted and matching with that struct,
 * writing ->unk04, ->unk08 and ->unk10, and struct Unk03001470 is defined in
 * unknown-globals.h with exactly those fields. A declaration that disagrees
 * with a promoted definition is a build break, not a weaker claim -- it is
 * what broke the first SPLIT=1 build of wave 14, and per-function trymatch
 * cannot see it because it compiles one unit. The F024 wrappers keep their
 * `void *` parameters and convert implicitly at the call, so nothing is lost
 * by agreeing with the definition. */
void sub_08063A30(struct Unk03001470 *, const void *);

/* Family F025's third callee. Its parameter is an INT and not a pointer:
 * `adds r5, r0, #0` then `adds r6, r5, (&gUnknown_02027F74 + 4)` uses it as an
 * offset, and it stores the same value at +0x54 of the proc it finds with
 * Proc_Find(gUnknown_08616D94) -- which is exactly the field sub_0808789C
 * reads back out. `pop {r0}`, so void. */
void sub_08087B74(int);

/* Family F045's three second callees, all nullary and all void (`pop {r0}`):
 * sub_0802D4A0 is `bl sub_0801A664; bl sub_08034F7C` and the other two are
 * `ldr r0,=<0849A5xx>; bl sub_080193B0`. Because none of them reads r0 before
 * writing it, the `bl sub_0801A168; bl <this>` pair in every F045 member is
 * two statements and a nest is not expressible -- see the wrapper section of
 * docs/agbcc-codegen.md. */
void sub_0802C144(void);
void sub_0802C1B0(void);
void sub_0802D4A0(void);

/* ------------------------------------------------------------------------
 * Wave 15, agent A -- the callees of families F035, F055, F056, F058, F062
 * and F066. Six cold families, twenty members, all 12-20 bytes; the work was
 * entirely here, in the prototypes, and the twenty bodies were one line each.
 * ------------------------------------------------------------------------ */

/* Three of these are PROMOTED AND MATCHED already and were simply never
 * declared -- the wave-14 "promoted but no prototype" trap, which reads like a
 * missing function rather than a missing line. Copied from the definitions,
 * not re-derived:
 *   src/decomp/c_08013AD4.c   void sub_08013AD4(u8 a1)      -- `g |= 1 << a1`
 *   src/decomp/c_08011218.c   void sub_08011218(void)       -- Proc_EndEach
 *   src/decomp/c_08034308.c   void sub_08034308(ProcPtr parent)
 * and sub_0806CC00 is defined in src/title-screen.c, which is upstream's own
 * matching source and must not be edited; `s32` is copied from there. */
void sub_08013AD4(u8);
void sub_08011218(void);
void sub_08034308(ProcPtr);
void sub_0806CC00(s32);

/* Nullary and void, both by the `pop {r0}` epilogue rule and by every call
 * site. sub_0802465C has five callers and sub_0803BCA0 two; not one of them
 * writes r0 before the `bl` or reads it after, so neither takes an argument
 * and neither result is used. This is what makes the `bl`-runs in F035 and
 * F056 sequences of statements rather than nests -- a nest is not expressible
 * when the second callee has no parameter. */
void sub_0802465C(void);
void sub_0803BCA0(void);

/* `s16`, and this is the discriminator the F066 family turns on.
 *
 * sub_0803B48C's own prologue is `lsls r0,#0x10; lsrs r1,r0,#0x10` -- a
 * PROMOTE_MODE zero-extension, which per docs/agbcc-codegen.md is identical
 * for `s16` and `u16` and therefore proves only "narrow". The sign comes from
 * the CALLERS, and all five agree on signed:
 *   0x08035F0E  adds r0,r0,r4; adds r0,r0,r5; lsls #0x10; asrs #0x10; bl
 *   0x08035F5x  movs r1,#0x1a; ldrsh r0,[r2,r1]; bl        (twice)
 *   0x0803Cxxx  movs r1,#0x1e; ldrsh r0,[r0,r1]; bl        (twice)
 *   sub_0803B4DC itself: lsls #0x10; asrs #0x10; bl
 * The first is decisive: a sum of three ints sign-narrowed at the call. With
 * an `int` parameter that site needs an explicit `(s16)` cast and so does
 * sub_0803B4DC's body; with `s16` every one of the five is cast-free.
 *
 * This REFINES the sub_0803B4DC comment higher up this file, which reads its
 * `lsl #16; asr #16` as "a conversion at the USE site inside the body". True,
 * but the conversion is IMPLICIT -- forced by this parameter -- so there is no
 * cast in sub_0803B4DC's source. Nothing in src/decomp/ calls sub_0803B48C, so
 * this declaration costs nothing today. */
void sub_0803B48C(s16);

/* `int`, from the other direction: sub_0801D84C's prologue is a bare
 * `adds r4,r0,#0` and the value goes straight into `muls r0,r7,r0` (r7 = 0x4c)
 * with no shift pair anywhere, so it is at least 32 bits wide; and its caller
 * at 0x0801D840 passes a bare `adds r0,r3,#0` with no conversion.
 *
 * Consequence for sub_08015568, and it is worth stating because it is NOT
 * decidable: the `lsls #0x10; asrs #0x10` in sub_08015568 cannot be an
 * implicit conversion the way sub_0803B4DC's is, so it is either an explicit
 * `(s16)` cast on an `int` parameter or an `s16` parameter with no cast.
 * Probed side by side and the two are BYTE-IDENTICAL (as are `int`-param-plus-
 * cast against an `s16` callee, and `s16` param against an `s16` callee); only
 * a `u16` parameter differs, giving `lsr` where the ROM has `asr`. The `int`
 * spelling is declared below as the weaker contract -- a future caller passing
 * an int then needs no conversion -- but the evidence does not separate them
 * and sub_08015568's single caller (`movs r1,#0x26; ldrsh r0,[r4,r1]`, an s16
 * object) is equally consistent with both. Byte-neutral, so no oracle. */
void sub_0801D84C(int);
void sub_08015568(int);
void sub_08072BBC(int);

/* The 0x08044 per-army funds block (wave 25). Every one of these takes the
 * army slot index that subscripts gUnknown_08499598, passed and compared as a
 * bare `int` at every call site in the block -- no prologue masking anywhere,
 * which per the PROMOTE_MODE rule is positive evidence for a wide parameter.
 *
 * sub_08044094 and sub_08044354 are copied verbatim from the already-promoted
 * definitions in src/decomp/c_08044094.c and c_08044354.c, which had no
 * prototype; the definitions win, so these must agree with them and not be
 * re-derived.
 *
 * sub_0804415C returns a NARROW value: sub_0804423C, sub_08044280 and
 * sub_080442AC each follow the `bl` with a bare `lsls #0x18; cmp #0`, which is
 * a truth test on eight bits and which an `int` return would not emit. Its
 * signedness is not settled -- no caller keeps the value.
 *
 * sub_080441D4 and sub_08044208 return `int` and are compared SIGNED against
 * sub_08044094's result (`cmp r4,r0; bge` in all three predicates), which is
 * what forces that result into an `int` local at each of those call sites --
 * `u32 < int` would have given `bcc`.
 *
 * sub_08044080's and sub_08039634's return values are discarded by their only
 * callers here, both of which are themselves void (`pop {r0}; bx r0`), so
 * `void` is unproved for both -- it is the spelling the source most likely had,
 * and it is byte-neutral at these two sites either way. */
u32 sub_08044094(int);
int sub_0804419C(int);
int sub_080441D4(int);
int sub_08044208(int);
u8 sub_0804423C(int);
void sub_08044354(int);
u8 sub_0804415C(int);
/* `u32` second parameter, not `int`: src/decomp/c_08044080.c has defined it
 * that way since it was promoted, and a promoted definition wins over a
 * weakest-model guess. Caught by tools/proto_check.py before the build --
 * trymatch compiles ONE unit, so this passes every per-function check and
 * fails `make SPLIT=1 compare` with `conflicting types` (wave 25). */
void sub_08044080(int, u32);
void sub_080440A8(int, int);
void sub_0804438C(int, int);
void sub_08039634(int, int);
void sub_08044560(void);
/* sub_08039ACC's first three parameters are `u16` and its fourth is wide, read
 * straight off its own prologue: r0, r1 and r2 each get `lsls #0x10; lsrs
 * #0x10` into a callee-saved register, while r3 goes to `adds r6,r3,#0` with no
 * masking at all and is then tested `cmp r6,#0`. Its single caller
 * sub_08044B08 narrows all three of ITS arguments by 24 instead, which is that
 * function's own `u8` parameters under PROMOTE_MODE and not a conversion for
 * this callee -- a u8 value needs no instruction to reach a u16 parameter. */
void sub_08039ACC(u16, u16, u16, int);
/* Copied from the promoted definition in src/decomp/c_080443C4.c, which had no
 * prototype; sub_080447EC and sub_0804483C both tail-forward their own argument
 * to it untouched, so neither constrains the type further. */
void sub_080443C4(ProcPtr);
void sub_080447EC(ProcPtr);
void sub_0804483C(ProcPtr);
void sub_08044B08(u8, u8, u8);
/* Returns bool8, not `int` (wave 28, W28-B). The definition is byte-neutral
 * either way -- both arms are `movs r0,#0` / `movs r0,#1` -- so it never had
 * an oracle there. All THREE call sites supply one: sub_08043DF4,
 * sub_08043E18 and sub_08080F0C each truth-test the result with a BARE
 * `lsls r0, r0, #0x18`, which is what agbcc emits for a byte-wide return and
 * an `int` return does not produce at all. c_08044BA0.c was retyped and
 * re-verified. */
bool8 sub_08044BA0(int);
int sub_0804440C(struct Unk030040D8 *);
int sub_0804443C(struct Unk030040D8 *);
int sub_08044460(struct Unk030040D8 *);
int sub_08044488(struct Unk030040D8 *);
int sub_080444B4(struct Unk030040D8 *);

/* Family F058's callee, and the family is three calls to it with 0, 1 and 2.
 * The parameter is `int`, not the `u8` its body suggests: the prologue is
 * `adds r4,r0,#0` THEN `lsls r0,r4,#0x18; lsrs r0,r0,#0x18` -- copy-then-narrow,
 * which per docs/agbcc-codegen.md is a cast at a use (it feeds
 * sub_0803CCB8(a, gUnknown_0200B204)) and not a narrow parameter; the saved r4
 * is switched on unnarrowed as 0/1/2 immediately afterwards.
 *
 * It RETURNS a value and that is decisive rather than inferred: all three F058
 * members end `pop {r1}; bx r1`, the value-returning epilogue, so they are
 * non-void; and a narrow return type here would put `lsl; lsr` after the `bl`
 * in each of them, because agbcc re-narrows on the CALLEE's declaration. There
 * is none, so `int`. (The value itself is r3, which is 0 on every path.) */
int sub_08005474(int);

/* Family F055's two same-callee members call one of these twice, with 0 then
 * 1. Both are `u16` parameters: each opens `lsls r0,#0x10; lsrs r4,r0,#0x10`
 * and the saved r4 is then used WITHOUT a second shift pair -- as an index
 * (`lsls r0,r4,#2`), a compare against an `ldrh`, and `strh r4,[r0]`. Per the
 * PROMOTE_MODE rule the entry pair alone cannot separate `s16` from `u16`; the
 * absence of any `asr` at the uses is what picks unsigned.
 * sub_0804FF44's third caller corroborates rather than contradicts: 0x0804C0FC
 * passes `adds r0,r7,#0` with no narrowing, but r7 is itself
 * `lsls r0,#0x10; lsrs r7,r0,#0x10` from that function's own prologue, so gcc
 * already knows the value fits and drops the conversion.
 * Byte-neutral at every F055 call site regardless -- all six pass a literal. */
void sub_0804B3E0(u16);
void sub_0804FF44(u16);

/* Family F062's second pair. sub_0808606C and sub_08086688 both open
 * `adds r4,r0,#0` and dereference it at +0x30/+0x4c/+0x5c and +0x48..+0x6a, so
 * each takes the object in r0; `ProcPtr` (= `void *`) is the weakest model and
 * nothing has named the struct yet. Both `pop {r0}`, so both void.
 * sub_08087C14's parameter is an INT and not a pointer, on exactly the
 * evidence that fixed its sibling sub_08087B74 above: it is added to
 * &gUnknown_02027F78 as an offset, and the caller at 0x080879xx reads it back
 * out of +0x54 of a proc -- the field sub_08087B74 stores it into. */
void sub_0808606C(ProcPtr);
void sub_08086688(ProcPtr);
void sub_08087C14(int);

/* ---- wave 15 (B): callees of families F046, F049, F057, F060, F061, F063 ----
 *
 * Four of these six are already PROMOTED and had no prototype, which under
 * -Werror reads as a missing function rather than a missing line; the
 * signatures are copied verbatim from the definitions rather than re-derived:
 *   src/decomp/c_080432E0.c  int   sub_080432E0(int)
 *   src/decomp/c_0800B4F0.c  int   sub_0800B4F0(int, int)
 *   src/decomp/c_0802C62C.c  bool8 sub_0802C62C(void)
 *   src/decomp/c_0802C660.c  bool8 sub_0802C660(void)
 * The two bool8s are corroborated by their only call sites, the four members
 * of family F046: sub_0802C62C's result carries `lsls #0x18; lsrs #0x18`
 * before `cmp #1` (value kept, so eight bits wide) and sub_0802C660's a bare
 * `lsls #0x18` before `cmp #0` (truth test). An `int` return would emit
 * neither. */
int sub_080432E0(int);
int sub_0800B4F0(int, int);
bool8 sub_0802C62C(void);
bool8 sub_0802C660(void);

/* The 0x0802C0E8 block's own callees and forwarders (wave 24, W24-A).
 *
 * sub_0802C0E8 takes a parameter it never reads -- its body opens by loading
 * gUnknown_03003FC0 straight over r0 -- so the width is settled entirely at its
 * one call site, sub_0802C118: that hands it the u16 global gUnknown_030033EC
 * with a bare `ldrb`. A `u8` parameter is what turns a u16 load into a byte
 * load; an `int` one would have emitted `ldrh`. Returns nothing (`pop {r0};
 * bx r0`).
 *
 * sub_0802C154 matches the promoted definition in src/decomp/c_0802C154.c;
 * declared here because sub_0802C16C and sub_0802C184 are its first callers.
 *
 * sub_08016D30's widths are read off its own prologue, which is unambiguous:
 * `lsls r0,#0x10; lsrs r4,#0x10` then `lsls r1,#0x18; lsrs r7,#0x18`, i.e.
 * (u16, u8). Its sole caller sub_0802C1D0 corroborates the u16 -- sub_08016D04
 * returns s8 and the conversion to u16 is the fused `lsls #0x18; asrs #8;
 * lsrs #0x10` triple, which neither an `int` nor an `s8` parameter produces.
 *
 * sub_08078E14 returns `int`: sub_0802C604 range-checks the result with signed
 * `bgt`/`blt` and no `lsls`/`lsrs` re-narrowing in front of them, and agbcc
 * re-narrows a narrow-returning callee at every call site.
 *
 * The three void/void entries are called with no argument register set up and
 * their results discarded; the arity is a floor, not a proof. */
void sub_0802C0E8(u8);
void sub_0802C154(int);
void sub_08016D30(u16, u8);
int sub_08078E14(void);
void sub_0803B828(void);
void sub_080366A4(void);
void sub_08028CD8(void);

/* More of the same block (wave 24, W24-A extension).
 *
 * sub_08016DB8's u16 is read off its own prologue (`lsls r0,#0x10;
 * lsrs r0,#0x10`), and its caller sub_0802CFDC corroborates it with the same
 * fused `lsls #0x18; asrs #8; lsrs #0x10` s8-to-u16 conversion sub_0802C1D0
 * uses on sub_08016D30.
 *
 * sub_080442AC and sub_08044280 take `int` and return `int`, both on bare
 * evidence: each opens `adds r5, r0, #0` with no masking of the incoming
 * register (the wave-21 wide-parameter rule), and their shared caller pair
 * sub_0802C820 / sub_0802C848 feeds the result straight into an `ands` with no
 * `lsls #0x18; lsrs #0x18` in front of it -- which agbcc emits at every call
 * site of a narrow-returning callee, so the 0/1 bodies do NOT make these bool8.
 *
 * sub_080344F0 takes `int`, the weakest type that fits, and this is one place
 * the wide-parameter rule does NOT apply: the argument's only use in the callee
 * is `strb r0, [r2, #6]`, so a u8 parameter's PROMOTE_MODE extension would be
 * dead and deleted. u8 and int are indistinguishable here. Contrast
 * sub_0802CD54, where the u8 parameter feeds a WORD `str` and the shift pair
 * duly appears.
 *
 * The void/void entries are called with no argument register set up and their
 * results discarded; the arity is a floor, not a proof. */
void sub_08016DB8(u16);
void sub_080344F0(int);
int sub_080442AC(int);
int sub_08044280(int);
void sub_08034F10(void);
void sub_080485AC(void);
void sub_08046764(void);
void sub_0802C280(void);

/* The 0x0802CB-0x0802CD predicate cluster's callees (wave 24, W24-A).
 *
 * sub_080422A8, sub_080421D0 and sub_0804223C all take their coordinate pair as
 * s16, read straight off their own prologues: each opens `lsls rN,#0x10;
 * asrs rN,#0x10` on the coordinate registers (sub_080422A8's first is
 * `asrs #0xf`, the same sign extension fused with the `* 2` its index needs).
 * The two three-argument ones additionally open `adds r7, r0, #0` with no
 * masking, so the leading pointer is wide, and both immediately do
 * `ldrb r4,[r7]` -- struct Unk030040D8's unk00.
 *
 * All three return bool8: their call sites narrow the result with
 * `lsls #0x18; lsrs #0x18` before `cmp #1`, the value-kept form, which agbcc
 * only emits for a narrow-returning callee.
 *
 * sub_0802C8F8 and sub_0802C958 return bool8 on the weaker truth-test form
 * (`lsls #0x18; cmp #0`) at their four call sites in this same block, and are
 * called with no argument register set up. */
bool8 sub_080422A8(s16, s16);
bool8 sub_080421D0(struct Unk030040D8 *, s16, s16);
bool8 sub_0804223C(struct Unk030040D8 *, s16, s16);
bool8 sub_0802C8F8(void);
bool8 sub_0802C958(void);
/* sub_0802CBA0 is matched in wave 24 and four of its neighbours call it
 * (sub_0802CC90, sub_0802CCCC, sub_0802CBC8, sub_0802CC04), all with the
 * `lsls #0x18; cmp #0` truth test that its bool8 return produces. */
bool8 sub_0802CBA0(void);

/* Family F061's three callees are one shape -- (x, y) cell predicates on the
 * gUnknown_08499590 screen, the same key sub_080015E4 and sub_0800B4F0 use --
 * and sub_0800977C is the only one that was still undeclared. Both parameters
 * arrive as a bare `adds rN, r0, #0` / `adds rN, r1, #0` with no narrowing, so
 * `int` on both, and it ends `pop {r1}; bx r1`. The return is `int` and not
 * bool8: all four F061 call sites feed the result straight into `lsls r0, #3`
 * / `#2` / `#1` or a bare `orrs`, with no `lsls #0x18; lsrs #0x18` in front of
 * it -- and agbcc re-narrows a narrow-returning callee at every call site. */
int sub_0800977C(int, int);

/* The CpuFastSet half of the pair sub_08011C68 heads (see that comment).
 * Identical reading: r0 and r1 are passed through to CpuFastSet untouched, so
 * `const void *` and `void *`; r2 is a byte count the body narrows itself
 * (`lsls r2,#0x10; lsrs r2,#0x12`, i.e. (u16)n / 4), so it is NOT a narrow
 * parameter; `pop {r0}`, so void. Where sub_08011C68 picks CpuSet or
 * CpuFastSet on `n & 0x1f`, this one is unconditional. */
void sub_08011C90(const void *, void *, u16);

/* ---- wave 15 (C): callees of the four gUnknown_08499590 screen readers ----
 *
 * sub_080433F8 is already PROMOTED (src/decomp/c_080433F8.c) and had no
 * prototype; the signature is copied verbatim from the definition.
 *
 * sub_08043070 returns u16, and that is a READOUT rather than a guess: all
 * four of sub_08024ABC's call sites narrow the result with `lsls #0x10;
 * lsrs #0x10` before storing it, and the two locals it feeds are compared
 * with `bhi` -- an UNSIGNED compare, so the locals themselves are `u32` and
 * cannot be the source of the narrowing. agbcc re-narrows a narrow-returning
 * callee at every call site, which is exactly what is there. Its five
 * arguments arrive as two `ldrb`s off gUnknown_08499598[army], two more
 * `ldrb`s (or the literal 0x19), and one stack word; nothing narrows on the
 * caller side, so `int` throughout.
 *
 * sub_08042D50's result is compared `cmp r5, r0; bgt` -- signed -- so `int`,
 * and neither argument is narrowed at any of its two call sites. */
int sub_080433F8(int, int, int);
/* WAVE 28 (W28-B) REFUTES THE u16 ABOVE: sub_08043070 returns `int`. The
 * argument above reads the four call sites and never read the CALLEE, and the
 * callee is decisive -- a u16-returning agbcc function narrows its own result
 * in its epilogue, and 0x08043070 ends `pop {r4,r5,r6}; pop {r1}; bx r1` with
 * no `lsl #0x10; lsr #0x10` anywhere. Declared u16 the definition gains that
 * pair and misses by 4 bytes. The call-site narrowing is real but comes from
 * an explicit (u16) cast in sub_08024ABC, which is forced independently: its
 * v1/v3 are compared `bhi`, so they are u32 and cannot themselves narrow.
 * c_08024ABC.c now spells the casts and was re-verified. */
int sub_08043070(int, int, int, int, int);
int sub_08042D50(int, int);

/* Also already PROMOTED (src/decomp/c_08026F9C.c, src/decomp/c_080225CC.c) and
 * still undeclared; signatures copied verbatim from the definitions.
 *
 * CORRECTED in wave 18 (W18-C): sub_08026FD0's first parameter is `s16`, not
 * `u16`. The definition is byte-neutral either way -- `u16 a` with `(s16)a` in
 * the body and `s16 a` with a bare `a` are the same bytes, which is why this
 * stayed wrong -- but the CALL SITES are not. Three of the eleven load that
 * argument sign-extended: sub_08061B4C and sub_08062AE4 both do
 * `movs r1,#0; ldrsh r0,[r0,r1]` on gUnknown_03003F2C (declared `u16`!), and
 * sub_080257C0 does the same on gUnknown_084995FE. A `u16` parameter folds the
 * truncation into the load and emits a 2-byte `ldrh`; only a narrow SIGNED
 * parameter rewrites it to the 4-byte register-offset `ldrsh`. No caller was
 * promoted when this was corrected, so the edit cost one trymatch on
 * c_08026F9C.c. */
bool8 sub_08026FD0(s16, u8);
void sub_080225CC(u16, u16);

/* sub_08022618 tests the result with a bare `lsls r0, #0x18; cmp r0, #0`, so
 * bool8; its argument is `(u16)id` where id is an s16 local, and the pair
 * `lsls #0x10; lsrs #0x10` in front of the call is that conversion, not a
 * re-narrowing -- a plain `int` parameter would leave the sign-extension
 * (`lsls; asrs`) that the same value's OTHER use, as an array index, does
 * carry. So the parameter is 16 bits wide and unsigned. */
bool8 sub_0802571C(u16);

/* Three more already-promoted, still-undeclared callees of sub_08042998,
 * copied verbatim from src/decomp/c_08025B28.c and src/decomp/c_080424BC.c;
 * sub_08042C9C is the one that is genuinely new. Its result is multiplied by
 * an `int` with no narrowing in front, so `int`; its two arguments are
 * gUnknown_030033EC (u16, passed with a bare `adds r0, r4, #0`) and a `ldrb`,
 * neither narrowed at the call. */
void sub_08025B58(u16, u32);
void sub_08025B80(struct Unk08499594 *, u8);
void sub_080424E4(void);
/* Both parameters CORRECTED to `int` (wave 26, W26-C). The paragraph above read
 * them off the CALL SITE, where neither is narrowed -- but that is byte-neutral,
 * because a u16 global reaching an `int` parameter is already zero-extended by
 * its own `ldrh` and needs no instruction either way. The callee's own prologue
 * decides it, and sub_08042C9C's is a bare `adds r4, r0, #0; adds r5, r1, #0`
 * with both values then living across two `bl`s. Declared `(u16, u8)` the body
 * gains four instructions -- PROMOTE_MODE's copy-then-narrow on each -- and does
 * not match; declared `(int, int)` it is byte-exact. The bare-prologue rule in
 * docs/agbcc-codegen.md, applied to the definition rather than the caller. */
int sub_08042C9C(int, int);

/* Promoted but never declared -- the wave-14 "promoted but no prototype" trap
 * again. src/decomp/c_080616F0.c defines it `void sub_080616F0(void)` and that
 * definition wins; this only publishes it (wave 23, A -- needed by
 * sub_0807898C). */
void sub_080616F0(void);

/* ...and sub_08042998 itself, which those three serve and which was never
 * declared either (wave 23, A -- needed by sub_0802D0F4). Nullary: its
 * prologue writes r0-r3 before reading any of them (`ldr r4, =gUnknown_08499594`
 * onwards). Void: it ends `pop {r0}; bx r0`, so r0 carries the return address
 * and cannot carry a value, and sub_0802D0F4's `bl` discards it. */
void sub_08042998(void);

/* ---- family F059's two undeclared callees (wave 15, C) ----
 *
 * sub_0803CCB8's parameter is `int`, not `u8`: its body opens
 * `lsls r0,#0x18; lsrs r0,#0x18` with no `adds rN, r0, #0` copy in front, which
 * is a cast at a use rather than a narrow parameter, and F059's three members
 * pass it the bare constants 0/1/2. Its SECOND argument is an address that it
 * forwards untouched to sub_0803CC84 as the destination of a NUL-terminated
 * byte copy out of gUnknown_020280C0[i].unk02, so `u8 *`. It RETURNS `bool8`:
 * the body is `movs r0,#1` / `movs r0,#0`, and every F059 call site carries
 * `lsls r0,#0x18; lsrs r0,#0x18` before `cmp r0,#1` -- value kept, eight bits
 * wide, which agbcc only emits for a narrow-returning callee.
 *
 * sub_0803CDBC's third argument is likewise reached by a shift pair split
 * around an `+ 0x500000` in its own body, so `int` on all three. Its return is
 * NOT settled here: it ends `pop {r1}; bx r1` and returns literal 0/1, but all
 * three F059 callers discard the result, so `int` and `bool8` are
 * indistinguishable from this side. Declared `int` as the weakest fit -- retype
 * it from a caller that uses the value. */
bool8 sub_0803CCB8(int, u8 *);
int sub_0803CDBC(int, int, int);

/* ---- wave 16 (A): callees of families F067-F072, F075, F077 ----
 *
 * Every `void f(void)` below is read the same way and the readout is cheap:
 * the function writes its first argument register before reading it (usually
 * `ldr rN,=gSym` as instruction 2), so it takes nothing, and it ends
 * `pop {r0}; bx r0`, which docs/agbcc-codegen.md fixes as void. None of them
 * is called with a live r0 anywhere in the ROM.
 *
 * The six that already have a definition in src/decomp/ are declared here for
 * the first time -- they were only ever named in comments. Each declaration
 * was copied from the promoted definition, not re-derived:
 * sub_0801E0C8 (c_0801E0C8.c), sub_0801EFD8 (c_0801EFD8.c), sub_08015550 and
 * sub_0801555C (c_08015544.c), sub_0802A538 (c_0802A508.c), sub_0802A7B0
 * (c_0802A7B0.c), sub_0802C57C and sub_0802C594 (c_0802C57C.c). */
void sub_0801E0C8(int, int);
void sub_0801EFD8(void);
void sub_08015550(void);
void sub_0801555C(void);
void sub_0802A538(void);
void sub_0802A7B0(void);
void sub_0802C57C(void);
void sub_0802C594(void);

/* F069 members, matched in wave 16 and called from F070/F071: sub_0801F050
 * takes sub_0801E0F0 as its else-arm and sub_0801F0C8 takes sub_0801EFA8 as
 * its whole body. Both are `push {lr} ... pop {r0}; bx r0`. */
void sub_0801E0F0(void);
void sub_0801EFA8(void);

void sub_0801BBC4(void);
void sub_0801BC08(void);
void sub_0801BCA8(void);
void sub_0801EFF4(void);
void sub_080219AC(void);
void sub_080245D4(void);
void sub_08026D68(void);
void sub_080424FC(void);
void sub_08061F34(void);
void sub_08062038(void);
void sub_0807F238(void);

/* Both parameters are eight bits wide *somewhere*: the prologue is
 * `lsls r0,#0x18; lsrs r0,#0x18` / `lsls r1,#0x18; lsrs r6,r1,#0x18` with no
 * `adds rN, r0, #0` copy in front of either, which per the F059 note above is
 * a cast at a use just as readily as a narrow parameter -- and the two are
 * byte-identical here because F068's three call sites all pass literals
 * (`movs r0,#K`). `int` is the weaker fit and is what is declared; a caller
 * passing a variable would settle it, and there is none. `pop {r0}` = void. */
/* CORRECTED in wave 24 (W24-A) from `(int, int)`. Both parameters are u8 and
 * the callee's own prologue says so outright: `lsls r0,#0x18; lsrs r0,#0x18`
 * then `lsls r1,#0x18; lsrs r6,#0x18`, PROMOTE_MODE's zero-extension, which an
 * `int` parameter does not pay. The old declaration survived because the only
 * promoted caller (src/decomp/c_080199A4.c) passes literal constants, which are
 * byte-identical either way -- the exact "a wrong prototype that every existing
 * caller happens to agree with" case. sub_0802CE70 is the differently-shaped
 * caller that exposes it: it passes the u16 gUnknown_030033EC and the ROM emits
 * `ldrb`, the byte load only a u8 parameter produces out of a halfword global.
 * c_080199A4.c re-verified after the change. */
void sub_08019940(u8, u8);

/* Takes no argument and RETURNS one (`pop {r1}; bx r1`). Arity is not guessed
 * from F075's call sites -- all three save r0 into r4 before the call, so r0 is
 * live there for the *later* Proc_Start* argument and a pass-through would look
 * identical. The readout is on the callee side: sub_080413E8's first act is
 * `bl sub_0804138C`, and sub_0804138C is four instructions that only store 0
 * to gUnknown_030040A8, reading no argument register either. So nothing in the
 * chain consumes r0. Every caller in the ROM discards the result, so `int` is
 * the weakest fit for the return rather than a measurement. */
int sub_080413E8(void);

/* The structural twin of sub_0801537C above, and NOT interchangeable with it:
 * sub_0801537C scans gUnknown_03001470[] for the slot whose `.unk00` equals the
 * argument, while this one compares the argument against the slot's own ADDRESS
 * (`lsls;adds;lsls #5; adds r0,r0,r2; cmp r0,r1`) -- so its parameter is a
 * pointer to the slot, and `struct Unk03001470 *` is what the tree already
 * calls that (sub_080152EC returns it). Both then call the same teardown and
 * return the index as `lsls #0x18; asrs #0x18`, or -1. Declared `int` for the
 * same reason sub_0801537C is: no caller in the ROM narrows the result, so the
 * width is undecidable and `int` is the only spelling that is valid C for a
 * function whose value is a plain forwarded index. */
int sub_080153B8(struct Unk03001470 *);

/* ---- wave 16 (B) ----
 * DEFINED (matched) in src/decomp/c_0803BB44.c, which is where the argument
 * for the u8 return lives; these declarations only exist so the F081 wrappers
 * in the sibling translation unit see it. The two derivations are independent
 * and agree: that file read the width off sub_0803BB14's `lsls #0x18;
 * lsrs #0x18`, and wave 16 read it off sub_0803BAFC's and sub_0803BB2C's. */
u8 sub_0803BB44(void);
u8 sub_0803BB5C(void);
u8 sub_0803BB74(void);

/* sub_080324C4 is the 452-byte screen setup behind sub_08032688; the prologue
 * is `mov r8,r0; adds r6,r1,#0; lsls r2,#0x18; lsrs r7,r2,#0x18`, so arguments
 * one and two arrive unnarrowed and three is `u8`. Argument two is compared
 * against -1 and is therefore signed, and the `pop {r0}; bx r0` epilogue
 * clobbers r0, which makes it void.
 *
 * sub_08029AF8 is the same shape one level down: `adds r5,r0,#0` and then
 * `ldrb r1,[r5]` types argument one as a pointer (`void *` is the weakest
 * spelling that its two wrappers can pass), `lsls r1,#0x10; lsrs r7,r1,#0x10`
 * types argument two `u16` and `lsls r2,#0x18; lsrs r2,r2,#0x18` types three
 * `u8`. It DOES return a value -- the epilogue is `mov r0,r8; ...; pop {r1};
 * bx r1` and r8 is an accumulator started at 0 -- but both callers discard it,
 * so `int` is a weakest fit rather than a measurement.
 *
 * sub_08053670 narrows its only argument `lsls #0x10; lsrs r5,r0,#0x10` and
 * ends `pop {r0}; bx r0`, so it is `void(u16)` -- the same unit index
 * sub_0804C400 takes. */
void sub_080324C4(int, int, u8);
int sub_08029AF8(void *, u16, u8);
void sub_08053670(u16);

/* The three callees of sub_08043418.
 *
 * sub_08042424 is the c_08001158.c map-cell idiom again, on the +0x1432
 * terrain plane rather than the +0x12 one: `lsls r1,#0x10; asrs r1,#0xf` is
 * an s16 column scaled by 2 for rowOffset[] and `lsls r0,#0x10; asrs r0,#0x10`
 * an s16 row, so both parameters are s16 and sub_08043418 casts to them at the
 * call. The return is u8 -- sub_08043418 truth-tests the result with a BARE
 * `lsls #0x18`, which is what agbcc emits for a u8-returning callee whose
 * value is only tested.
 *
 * sub_08043574 is nine instructions with no frame: it adds 1, 2 or 3 to its
 * third argument according to `x > 0xcf` and `y > 0x7f` and returns it. All
 * three comparisons are signed (`ble`), so all three parameters are `int`, and
 * `adds r0,r2,#0; bx lr` returns the third.
 *
 * sub_0801C7DC takes SEVEN arguments -- it pushes five registers and one word,
 * then reads [sp,#0x18], [sp,#0x1c] and [sp,#0x20]. Argument one is the table
 * (`ldrh [r0]`, `ldrh [r0,#2]`), two is a halfword index into it, three is a
 * count it feeds to DivRem, and four/five/six/seven are forwarded to
 * PutSpriteExt as (r1, r2, stack, r0) respectively -- i.e. x, y, an OAM word
 * and a layer. It returns a value that all three callers discard. */
u8 sub_08042424(s16, s16);
int sub_08043574(int, int, int);
int sub_0801C7DC(const u16 *, int, int, int, int, int, int);

/* ---- wave 17 (B) ----
 * The position half of the ~40 sprite setters between 0x0804B180 and
 * 0x08053614: it takes a side (gUnknown_0300453C), a proc id
 * (gUnknown_03001FBC) and an (x, y) in world coordinates, subtracts the scroll
 * origin pair out of gUnknown_084C3F70/gUnknown_084C3F78 and forwards to
 * sub_080155C0. All four parameters are narrowed `lsls #0x10; lsrs #0x10` at
 * entry, which is only PROMOTE_MODE and does not settle signedness; the
 * signedness comes from the USES -- arguments two, three and four are each
 * re-extended `lsls #0x10; asrs #0x10` before they are used, so those three
 * are signed, while argument one is only ever an index (`lsls #2`, `lsls #4`)
 * and is unsigned. Callers agree: sub_08051DE0 and its two siblings pass
 * gUnknown_0300453C bare but sign-extend the two u16 position sums, which is
 * the `u16 -> s16` conversion and is four instructions of real code.
 * `pop {r0}; bx r0` makes it void. */
void sub_08050528(u16, s16, s16, s16);

/* wave 18 (W18-C): sub_08052CA4's extra callee. Two u16 parameters -- the
 * prologue is `lsls #0x10; lsrs #0x10` on both, PROMOTE_MODE, and it stores
 * them straight back into gUnknown_0300453C / gUnknown_0300451C, which are
 * both u16. The THIRD parameter is DEAD: r2 is never read anywhere in the
 * body, and all three call sites (sub_08052650, sub_08052AF4, sub_08052CA4)
 * emit `movs r2, #0` immediately before the `bl`, which is deliberate argument
 * setup and not a leftover -- so the arity is three even though the body
 * cannot see it. Void: `pop {r4, r5, r6}; pop {r0}`. */
void sub_08052E04(u16, u16, int);

/* The two emitters family F092 drives, and the routine it calls when the
 * counter runs out. All three take their argument (if any) in r0 and all three
 * end `pop {r0}; bx r0`, so all three are void.
 *
 * sub_080645AC and sub_08064E5C both open `adds rN, r0, #0` and then read
 * +0x28 / +0x2a / +0x1c through it -- the struct Unk08580934_Obj offsets --
 * so the parameter is that type rather than a bare `void *`. sub_080645AC also
 * calls through +0x4c (`ldr r1,[r4,#0x4c]; bl _call_via_r1`), which is past
 * the modelled extent; the field is deliberately NOT added, because a
 * one-instruction indirect call is not enough to type it.
 *
 * sub_08030178 reads no argument register before writing it -- it opens
 * `ldr r5,=gUnknown_08090CAC; ldr r6,[r5]` -- so it is nullary. */
void sub_080645AC(struct Unk08580934_Obj *);
void sub_08064E5C(struct Unk08580934_Obj *);
/* Wave 29 (C). The draw call sub_08064CA8 and sub_08064CFC both tail into:
 * one sub_0801F34C with an id taken from gUnknown_08580934->unk11[obj->unk1c].
 * `pop {r4}; pop {r0}` -> void. */
void sub_08064BF4(struct Unk08580934_Obj *);
void sub_08030178(void);

/* The "this slot has arrived" handler sub_08050958 calls when a moving unit
 * crosses its bound. All three parameters are narrowed `lsls #0x10; lsrs #0x10`
 * at entry, and the signedness comes from the uses: one and two are only ever
 * array indices (`muls` by 0xb4, `lsls #3`) into gUnknown_02029A10, so u16,
 * while three is re-extended `lsls #0x10; asrs #0x10` and tested against -1
 * before going to sub_080153F0 -- the proc-id pattern, hence s16. The caller
 * agrees: it passes two u16 locals bare and gUnknown_03001FBC via `ldrsh` with
 * no conversion on any of the three. `pop {r0}; bx r0` makes it void. */
void sub_08050AEC(u16, u16, s16);

/* The rest of sub_08051F4C's callees. All six end `pop {r0}; bx r0`.
 *
 * sub_080504A8 narrows both arguments `lsls #0x10; lsrs #0x10` with no copy in
 * front, which is a declared-narrow pair; sub_08051D74 is the same shape.
 *
 * sub_08016824 and sub_08016944 are `adds rN, r0, #0` and THEN the narrowing,
 * which docs/agbcc-codegen.md reads as an `int` parameter with a cast at a
 * use rather than a declared-narrow one. Byte-neutral at sub_08051F4C's call
 * sites either way (the argument arrives via `ldrsh`, so neither `int` nor
 * `s16` needs a conversion), so this follows the rule rather than measuring.
 *
 * sub_080157A4 and sub_080157F4 are a pair -- the same eight instructions
 * writing gUnknown_0200E438[...].unk3c and .unk3e. Argument one narrows
 * `lsls #0x10; asrs #0x10` with no copy, so s16. Argument two is a bare `strh`
 * setter and therefore cannot be distinguished from int/u32/u16 BY THE
 * CALLEE -- the CALLER settles it: sub_08051BEC and sub_08051F4C sign-extend a
 * u16 table value before passing it, which is the `u16 -> s16` conversion and
 * is two instructions of real code that no other declaration produces. Both
 * are already PROMOTED (src/decomp/c_080157A4.c, c_080157F4.c) and both were
 * declared `u16 b` there; those two definitions were retyped to agree and
 * re-verified, which is the "the prototype is the suspect" case the brief
 * describes. */
void sub_080504A8(u16, u16);
void sub_08051D74(u16, u16);
/* First parameter s16 (`lsls #0x10; asrs #0x10` at entry, the proc-id shape).
 *
 * THE SECOND IS A CONTRADICTION AND `void *` IS THE CALLER-SIDE ANSWER
 * (wave 20, W20-C). sub_080156E8 narrows r1 `lsls #0x10; lsrs #0x10` at entry
 * and its tail-callee sub_080156FC (matched) uses the same value as
 * `(u16)x * 4` added to the pointer at gUnknown_0200E438[..].unk48 -- i.e. a
 * small TABLE INDEX, not an address. But every caller passes the word straight
 * out of gUnknown_02029BA8 with `ldr` and NO narrowing in front of the `bl`,
 * which a declared-`u16` parameter would have forced. Per the brief's rule the
 * prototype is settled from the CALLERS, so it is wide here; the entry
 * narrowing belongs to sub_080156E8's own declaration in its own unit, which
 * is the "two prototypes disagreed across files" case docs/agbcc-codegen.md
 * describes. Consequence worth recording: the note on struct Unk02029BA8 in
 * include/unknown-globals.h calls those members addresses "because they go to
 * sub_080156E8" -- that inference is WRONG, they are indices; the `void *`
 * declaration survives only because it is byte-identical at every call site. */
/* Types COPIED FROM THE PROMOTED DEFINITION src/decomp/c_080153F0.c, not
 * re-derived -- a promoted definition wins over a fresh declaration. It was
 * never declared here because nothing had called it across a file boundary
 * until sub_08051D74 (wave 20, W20-C). The `bool8` return is what makes a
 * caller's `if (sub_080153F0(x))` a bare `lsls #0x18; cmp #0` with no
 * `lsrs`. */
bool8 sub_080153F0(s16);
void sub_080156E8(s16, void *);
void sub_08016824(int);
void sub_08016944(int);

/* ---- wave 29, W29-B: address-locality block 0x0803D --------------------- */
/* A predicate over the four teams: it loops sub_080266DC(i) for i in 1..4 and
 * every caller tests the result `lsls #0x18; cmp #0`, which is the `bool8`
 * shape. Takes nothing -- r0 is written before it is read. */
bool8 sub_0803861C(void);
/* Already DEFINED in src/decomp/c_0803B79C.c; published here so sub_0803D978
 * can call it. */
void sub_0803B7B4(void);
/* The 0x02028360 sweep sub_0803DE68 finishes with, and the lookup sub_0803DF54
 * opens with. sub_0803DE94 takes two arguments (r0 and r1 are both copied
 * before anything else) and returns a pointer into the gUnknown_02028360 array;
 * `int` for both because sub_0803DF54 forwards its own two straight through
 * with no conversion in front of the `bl`. */
void sub_0803DE14(void);
struct Unk02028360 *sub_0803DE94(int, int);
void sub_0803D3F0(void);
/* Decodes one gUnknown_02028360 entry's position into a {u16, u16} pair,
 * returning whether the entry's 4-bit kind at unk02 bits 6..9 is one it
 * understands. `bool8`: sub_0803DF54 tests it `lsls #0x18; cmp #0`. */
bool8 sub_0803DFE0(struct Unk02028360 *, struct Unk02028360Pos *);
struct Unk02028360 *sub_0803DF54(int, int);
void sub_0803D724(u8);

/* ---- wave 29, W29-B: address-locality block 0x08016 --------------------- */
/* sub_08016A14's definition is src/decomp/c_08016A14.c; it was never declared
 * here because nothing had called it across a file boundary until sub_08016C70
 * and sub_08016E14. */
void sub_08016A14(void);
/* Returns the ADDRESS of one of gUnknown_0200C420's three byte flags -- see
 * the note on unk09 in include/unknown-globals.h. The parameter is SIGNED
 * (`lsls #0x18; asrs #0x18` in place at entry); the switch has no default, so
 * on any other value the incoming r0 falls out of the function unchanged,
 * which is what the shared `bx lr` with r0 untouched says. */
u8 *sub_08016C9C(s8);
/* Its two callers. sub_08016CD8 re-narrows the byte it loads to `s8`
 * (`ldrb; lsls #0x18; asrs #0x18` -- a `ldrsb` is what a `s8 *` return would
 * have given instead), sub_08016CEC stores a `u8` through the pointer. */
s8 sub_08016CD8(s8);
void sub_08016CEC(s8, u8);
/* `u8` first parameter (`lsls #0x18; lsrs #0x18` in place at entry) and the
 * result is discarded at its one caller sub_08016C70. It returns a value
 * (`movs r0,#1` on the a==0 path, sub_0801A7D8's result otherwise). */
int sub_0801ABF8(u8);
/* Argument 1 is `u8` (narrowed in place at entry), argument 2 a buffer it hands
 * to sub_0801B598, argument 3 a SIGNED byte count (`subs r7,r7,r2` with a `ble`
 * compare against 0xFAD). Returns int. */
int sub_0801A7D8(u8, void *, int);
/* sub_08016B2C's mirror -- the same two block copies in the other direction,
 * returning the same 0x5CC. Its one caller sub_08016E3C discards the result. */
int sub_08016BC0(void *);
void sub_08016C70(u8);
void sub_08016E14(void);

/* ---- wave 29, W29-B: address-locality blocks 0x0803A and 0x08084 -------- */
/* The two gUnknown_03004100 consumers sub_0803AA78 chains. Argument 1 of both
 * is the `u8` gUnknown_0849D89C->unk00 (`ldrb` at the call); sub_0803A190 does
 * not narrow it at entry so it is `int` there, sub_0803A2BC narrows it
 * `lsls #0x18` in place so it is `u8`. Argument 2 is the same
 * struct Unk08499594 sub_08025BE0 initialises. */
void sub_0803A190(int, struct Unk08499594 *);
void sub_0803A2BC(u8, struct Unk08499594 *);
/* A predicate over the gUnknown_0849EDB0 list; takes nothing (r0 is dead at
 * entry) and its one caller sub_08084920 tests the result `lsls #0x18;
 * cmp #0`. */
bool8 sub_0803C814(void);
/* WAVE 29: declared `ProcPtr` from the caller side, which conflicted with the
 * already-promoted definition in src/decomp/c_080852A8.c. The definition wins:
 * `ProcPtr` and `struct Unk080852A8 *` are both pointers and byte-neutral at
 * every call site, while the definition's body actually dereferences +0x66 as
 * an s16 -- and sub_08084BD4's own independently-derived struct agrees that
 * +0x66 is s16, so two derivations corroborate the field. Incomplete on
 * purpose; the definition completes it privately. */
struct Unk080852A8;
void sub_080852A8(struct Unk080852A8 *);
void sub_080157A4(s16, s16);
void sub_080157F4(s16, s16);
/* sub_080154C4 and sub_08015504 are ONE SOURCE AT TWO BIT POSITIONS: each
 * fetches the slot's stashed OBJ attributes with sub_0801566C into a stack
 * local, sets a single bit of byte 1, and hands the eight bytes back to
 * sub_08015608. They differ in exactly two instructions -- `lsls #4` with mask
 * ~0x10 against `lsls #5` with mask ~0x20 -- which under `struct OamData` are
 * `mosaic` (bit 12) and `bpp` (bit 13). NOT `vFlip`, which this comment used to
 * claim: vFlip is bit 29 and lives in byte 3, exactly where the struct's own
 * note in unknown-globals.h puts the measured hFlip/vFlip pair. The `mov #N;
 * neg` form of the mask is the bitfield-store tell -- a hand-written
 * `p[1] = (p[1] & ~0x10) | ((b & 1) << 4)` through a `u8 *` folds the mask to
 * `mov r0,#0xef` and comes out two bytes short.
 *
 * BOTH PARAMETERS ARE DECLARED-NARROW, AND THE `int, int` THIS LINE USED TO
 * CARRY WAS WRONG (wave 25, W25-C). The reasoning behind it -- copy-then-narrow
 * (`adds r5,r0,#0; lsls #0x10; asrs #0x10`) means an `int` parameter with a cast
 * at the use -- does not hold when the parameter's pseudo LIVES ACROSS A CALL.
 * agbcc then emits assign_parms' incoming-argument copy and the PROMOTE_MODE
 * extension as two separate insns instead of fusing them, so a declared
 * `s16`/`u8` parameter produces the copy-then-narrow shape by itself. Measured
 * with compile_probe on this exact pair: `(s16, u8)` with `o.mosaic = b;` is
 * byte-exact for both functions; `(int, int)` with a `(u8)` cast sinks the
 * narrowing PAST the call; `(int, u8)` keeps the narrowing but drops the copy
 * and is two bytes short. The doc rule is sound only for a parameter that dies
 * inside its own statement. */
void sub_080154C4(s16, u8);
void sub_08015504(s16, u8);
/* Promoted in src/decomp/c_080156FC.c and never declared -- the "promoted but
 * no prototype" trap again. Types copied from the definition, not re-derived.
 * Its only caller is the forwarder sub_080156E8 above. */
void sub_080156FC(s16, u16);
/* Both parameters narrow in place with no copy (`lsls #0x10; lsrs #0x10` into
 * r5 and r6 at entry), the same readout as sub_080504A8 above, so `u16, u16`
 * (wave 20, W20-C). Called as the tail of sub_08052718 and sub_08052BBC. */
void sub_08052818(u16, u16);
/* The first two parameters narrow at entry (`lsls #0x10; lsrs #0x10`), the
 * THIRD DOES NOT -- its only use is `lsls r2,#0x19; lsrs r2,#0x10`, i.e.
 * `(u16)(x * 0x200)`. That asymmetry is the readout: agbcc did NOT fold the
 * entry narrowing of r0 into r0's own first use (`lsls r4,r0,#4`), so a
 * missing pair on r2 means r2 is not a narrow parameter (wave 20, W20-C).
 * All three call sites -- sub_08050134, sub_08050364 and the pass-through
 * wrapper sub_0805040C -- are byte-identical with `u16` here, so this is the
 * weakest type that fits rather than a proof. */
void sub_08050424(u16, u16, int);
/* Third parameter is `int`: it arrives as `adds r4, r2, #0` and is narrowed
 * `lsls #0x10; asrs #0x10` only at the use, which is docs/agbcc-codegen.md's
 * copy-then-narrow readout. The first two narrow in place, so they are u16.
 * Void -- it tail-calls sub_080155C0 and no caller reads r0. Nine call sites;
 * sub_0804C828 / sub_0804CD84 pass gUnknown_03001FBC as the third argument
 * with NO `mov r2` at the call, because the allocator had already loaded it
 * there (wave 20, W20-C). */
void sub_0804DC5C(u16, u16, int);

/* sub_0803B3C8 has been PROMOTED (src/decomp/c_0803B3C8.c) since wave 9 and was
 * never declared here, because nothing had called it across a file boundary
 * yet. sub_0806C52C is the first, and the failure reads as a missing function
 * rather than a missing line -- see the wave-14 note in
 * docs/agbcc-codegen.md. Types copied from the definition, not re-derived. */
void sub_0803B3C8(void);

/* Returns 1 when gUnknown_03003FC0's byte 1 is 1 and sub_0803CBD8(0x60) is
 * non-zero, else 0. `int`, and this one is settled by population rather than by
 * the body: 20 call sites across asm/ and not one narrows the result -- 18 are
 * a bare `cmp r0, #0` (or a copy then a compare) and TWO use it directly as a
 * scaled index (`lsls r0, r0, #2` before an `ldr`), which is the value being
 * KEPT at full width and is the decisive half of that census. A `u8`/`bool8`
 * return would have put `lsls r0, #0x18` after every one of the 20 `bl`s. */
int sub_0803866C(void);

/* ---- wave 20 (W20-B) ----
 * A Proc_Start front end: it forwards (r0, r1) unchanged and passes r2 through
 * as sub_08071B28's fourth argument, which sub_08071B28 hands to Proc_Start as
 * the PARENT (`adds r1, r3, #0` ... `bl Proc_Start`) -- hence ProcPtr rather
 * than a bare pointer. Nothing is narrowed at entry in either function, so the
 * first two are `int`. `pop {r4,r5}; pop {r0}` -> void. */
void sub_08071B0C(int, int, ProcPtr);

/* ---- wave 23 (W23-B) ----
 * The same front end onto the same callee with a different script, and typed
 * by exact analogy: `sub_08071B28(&gUnknown_08613F54, a1, a2, a3)` with a3
 * landing in r3, which sub_08071B28 forwards to Proc_Start as the parent.
 * Bare prologue (`adds r4,r0,#0; adds r5,r1,#0; adds r3,r2,#0`) -> the first
 * two are wide. `pop {r4,r5}; pop {r0}` -> void. */
void sub_08071AF0(int, int, ProcPtr);

/* DEFINED in src/decomp/c_08084858.c (matched since wave 19); this publishes
 * it and RETYPES the return from `int` to `u8`. The body cannot tell the two
 * apart -- `ldrb r0,[r0]; bx lr` either way -- but two callers can, and both
 * were still asm when the definition was promoted: sub_08084864 and
 * sub_0808488C each follow the `bl` with a bare `lsls r0, r0, #0x18` before
 * the `cmp`, which is the narrow-return re-narrowing agbcc emits at every call
 * site, in its truth-test form. An `int` return emits no shift at all.
 * gUnknown_03000650 is `u8 []`, so `u8` is also the weakest type that fits.
 *   MEASURED CAVEAT, so nobody re-derives it: `int` plus an explicit `(u8)`
 * cast at each call site is BYTE-IDENTICAL here (the cast's `lsr` is dead in a
 * comparison against 0 and combine drops it), so the call sites do not
 * discriminate the two models -- they only rule out an uncast `int`. `u8` is
 * chosen because it needs no cast anywhere. sub_08080FE0 and sub_08084700, the
 * other two callers, are still asm and were not consulted. */
u8 sub_08084858(int);

/* Five arguments, typed from the callee's own entry narrowing and not from a
 * call site. r0 and r1 are masked with 0xFFFFFE00 / 0xFFFFFF00 and truncated to
 * u16 -- a 9-bit x and an 8-bit y, the same OAM coordinate pair sub_0801F34C
 * takes -- and r2/r3 pass through to `ip`/`r8` untouched, so all four are word
 * wide. The FIFTH arrives at [sp, #0x1c] and is narrowed on arrival
 * (`lsls r2, r2, #0x18`) before a bare `cmp r2, #0`, which is a sub-word
 * parameter used as a truth test. Both call sites in sub_08084F44 pass the
 * literal 1, so they do not discriminate `u8` from `int` and this is settled on
 * the callee side alone. */
void sub_08043C28(int, int, int, int, u8);

/* A Decompress front end: `lsls r0, r0, #3` indexes an 8-byte-stride table at
 * gUnknown_08616AC0 and the word it loads is Decompress's source. The scale is
 * the whole type argument -- an index used as `x * 8`, nothing narrowed at
 * entry, so `int`. `pop {r0}; bx r0` with r0 holding Decompress's return, which
 * no caller reads: sub_08082660 discards it, so `void`. */
void sub_080845A8(int);

/* Returns a PALETTE pointer, not a value: both arms end in an address --
 * `&gUnknown_0823DC38[x * 16]` when sub_08084858 says 0, and the fixed
 * gUnknown_0812596C otherwise -- and sub_08082660's only use hands the result
 * straight to ApplyPaletteExt's `u16 *` first parameter with no arithmetic.
 * The `lsls r0, r4, #5` is a BYTE offset, i.e. 32 bytes = 16 u16 = one 16-colour
 * palette, which is what fixes the element type. The argument is unnarrowed at
 * entry and is forwarded to sub_08084858(int), so `int`. */
u16 *sub_08084864(int);

/* The four helpers sub_0800CFDC drives, all of them (column, row) queries or
 * writes on the gUnknown_08499590 map descriptor. Every one opens with bare
 * `adds rN, r0, #0` / `adds rM, r1, #0` and narrows neither, so both parameters
 * are `int`; sub_0800CFDC passes `x - 1`, `x + 1`, `y + 1` and `y - 1` into them,
 * which an s16 pair would have re-narrowed at each of the 32 call sites.
 *   sub_0800E8CC and sub_0800E9F4 return through `adds r0, r6, #0` and their
 * results are used at full width -- sub_0800CFDC ANDs two of them together and
 * switches on the result over the range 6..31, and compares the other against 1
 * and 2 with no `lsls` in between -- so both are `int`. The other two end
 * `pop {r0}; bx r0`, i.e. void. */
int sub_0800E8CC(int, int);
int sub_0800E9F4(int, int);
void sub_0800EAF4(int, int);
void sub_0800EB5C(int, int);

/* ---- wave 21 (W21-A): the gUnknown_0200C020 pair ----
 * sub_08014074 is already matched in src/decomp/c_08014074.c and was simply
 * never declared; its parameter type is that file's, now shared through
 * unknown-globals.h.
 *
 * sub_080147B4 fills the same object, and its narrow parameters are what make
 * sub_08014668/sub_080146D4 match: EVERY narrowing in those two functions is a
 * conversion at this call, not a parameter-width tell of their own (the rule
 * the sub_0802D35C comment above states). Their six parameters all stay `int`
 * / `u16 *` as already declared.
 *   Parameters 2 and 3 are `s16` and NOT the u16 sub_080147B4's own prologue
 * shows -- PROMOTE_MODE zero-extends every narrow parameter at entry
 * regardless of signedness, so the prologue cannot separate them, and the
 * callers sign-extend (`lsls #0x10; asrs #0x10`) where 5..7 zero-extend
 * (`lsrs`). Parameter 4 is stored as a word at +0x28 and never narrowed, and
 * is `u16 *` only so that sub_08014668's third argument forwards without a
 * cast. Parameters 5 and 7 are `u16` on the body's own evidence (5 is
 * zero-extended and scaled `lsrs #0xe` into gUnknown_08610A38[]; 7 is
 * zero-extended and stored to two halfwords); 6 is only ever `strh`'d, so its
 * width is a floor and u16 is the weakest spelling that costs the callers
 * nothing. */
/* The two blob starters the sub_0802D4xx / sub_0802D5xx duplicate pairs use.
 * Both take the blob in r0 and neither dereferences it, hence `const void *`.
 * The narrow arguments are read off each callee's own prologue, which is the
 * only evidence: sub_08019F2C zero-extends r1, r2, r3 and the one stack word
 * at [sp, #0xc] (five parameters, the fifth arriving as a word) and forwards
 * all five to sub_08019F90; sub_0801A104 zero-extends r1, r2, r3 only (four
 * parameters). u16 rather than s16 is a floor -- PROMOTE_MODE cannot separate
 * them and no call site narrows in a way that would (wave 21, W21-A). */
/* Wave 26 (W26-A) corrects the RETURN type of sub_08019F2C from void to int.
 * Both it and its twin sub_08019F50 end `pop {r1}; bx r1`, the returns-a-value
 * epilogue, and a probe settles that the epilogue register IS the discriminator
 * here: the identical body written `void f(...) { g(...); }` pops r0 and written
 * `int f(...) { return g(...); }` pops r1. The value is sub_08019F90's, so that
 * one returns a value too. `int` on all three because every call site in the ROM
 * discards the result, which emits no narrowing and so cannot constrain the
 * width; the change is byte-neutral for callers for the same reason. */
int sub_08019F2C(const void *, u16, u16, u16, u16);
int sub_08019F50(const void *, u16, u16, u16, u16);
int sub_08019F90(const void *, u16, u16, u16, u16);
void sub_0801A104(const void *, u16, u16, u16);
void sub_08014074(struct Unk08014074 *);
void sub_080147B4(struct Unk08014074 *, s16, s16, u16 *, u16, u16, u16);

/* ---- wave 24 (W24-C), the 0x08078 block ---- */

/* Five already-promoted `void (void)` leaves that had no header declaration --
 * every one of them has a definition in src/decomp/ (c_08074744.c, c_08074F1C.c,
 * c_08075304.c, c_080755E0.c, c_0801C1F8.c) and the prototypes below just record
 * what those definitions already say. sub_08078018 calls the first four in a
 * row; sub_080780A0 calls the last. */
void sub_08074744(void);
void sub_08074F1C(void);
void sub_08075304(void);
void sub_080755E0(void);
void sub_0801C1F8(void);

/* Promoted as `u8 sub_0803BD6C(void)` in src/decomp/c_0803BD54.c, and
 * sub_080780A0 corroborates it from the caller side: the result is re-narrowed
 * `lsls #0x18; lsrs #0x18` before `cmp r0, #1`. */
u8 sub_0803BD6C(void);

/* Promoted as `void sub_08014BC0(ProcPtr)` in src/decomp/c_08014BB4.c. */
void sub_08014BC0(ProcPtr);

/* Starts the gUnknown_08615ACC proc under `parent` and stashes its four other
 * arguments at +0x2c, +0x30, +0x58 and +0x54 of it. Its prologue is bare for
 * r0/r1/r2/r3 -- no masking of any incoming register -- so the first three are
 * WIDE (wave 21's rule: PROMOTE_MODE would have cost a shift pair otherwise),
 * and the fifth argument arrives as a word at [sp, #0x14]. r3 is only ever
 * stored, never dereferenced, hence `const void *`. */
void sub_080785CC(s32, s32, s32, const void *, ProcPtr);

/* The fourth parameter is `lsls #0x18`-tested at entry and nothing else, so it
 * is a narrow flag; r1 and r2 are untouched at entry and are `strh`'d later,
 * which makes their width a floor and `s32` the weakest spelling. r0 is
 * null-checked and handed to Proc_StartBlocking as a parent. Returns 0 or 1. */
s32 sub_08074C84(ProcPtr, s32, s32, u8);

/* r0 walks a `const s8 *` at word 0 of the struct it points at and compares a
 * count against the u8s at +4 and +5; r1 is the caller's own proc, which it
 * writes +0x58 of on one path. The return is re-narrowed `lsls #0x18` by
 * sub_0807831C, its only caller, so it is a u8 predicate. */
u8 sub_080782C0(struct Unk80782C0 *, ProcPtr);

/* All three parameters are read straight off this function's own prologue,
 * which zero-extends r0 by 16 and r1/r2 by 24. u16/u8/u8 rather than the signed
 * spellings is a floor -- PROMOTE_MODE cannot separate them -- but the widths
 * are hard, and sub_08078498 pays for them with three shift pairs at the call. */
void sub_08019818(u16, u8, u8);

/* Matched in src/decomp/c_08076770.c and src/decomp/c_08078770.c; these just
 * record what those definitions already say, for sub_08078568 and for the
 * sub_080787B8 / sub_08078800 pair. */
void sub_08076770(s32, s32, s32, ProcPtr);
void sub_08078770(void);

/* ---- wave 24 (W24-C), the 0x08078 block, second pass ---- */

/* RETURN TYPE SETTLED FROM THE CALLER, and it is not what the body suggests.
 * sub_08078E20's own body is `movs r0,#1` / `movs r0,#0`, which says nothing;
 * sub_08078E94, its only caller, re-narrows the result with a BARE
 * `lsls r0, #0x18` before `cmp r0, #0`. A bare lsls is a truth test on a NARROW
 * value, so the declared return is u8. Declaring it `s32` compiles the callee
 * byte-identically -- 0 and 1 need no narrowing -- and is invisible until a
 * caller like this one appears, which is the failure mode the prototype rules
 * in the wave brief describe. */
u8 sub_08078E20(void);

/* sub_08075E68's prologue reads r0 only, and r1 survives untouched into
 * `bl Proc_StartBlocking` -- a pass-through parent, invisible in the body.
 * Both of sub_08078270's arguments are accounted for that way. */
void sub_08075E68(s32, ProcPtr);

/* Return width from sub_08078E48's call site: the result is re-narrowed
 * `lsls #0x10; lsrs #0x10` and handed straight to sub_0801A5B0(u16). */
u16 sub_0807A908(void);

/* First parameter WIDE (bare prologue, `adds r5, r0, #0`, then compared
 * against 0 and decremented); second zero-extended by 24 at entry, so u8. */
void sub_0807A99C(s32, u8);

/* Both promoted already, neither previously declared: src/decomp/c_08078AF0.c
 * and the sub_08078E20 draft. */
void sub_08078AF0(void);

/* ---- wave 26 (W26-A), the 0x08019000 block ---- */

/* Three already-promoted definitions that had no declaration, copied verbatim
 * from src/decomp/c_08019C24.c, c_08022ADC.c and c_0801A604.c. */
void sub_08019C24(void);
void sub_08022ADC(void);
void sub_0801A604(void);

/* Argument-free and result-discarded at every site in this block; each one's
 * own prologue writes r0 from a literal pool before reading any argument
 * register, and each ends `pop {r0}` rather than `pop {r1}`, so `void (void)`
 * is read off the callee and not guessed from the call.
 *   sub_08014878  three `sub_0801537C(<script>)` calls in a row.
 *   sub_08019380  the sweep that clears gUnknown_0200C508[0..7] backwards.
 * sub_0803670C is the one INFERRED member: no caller in this block sets an
 * argument register for it, which fixes the arity at zero, but its own body was
 * not read. */
void sub_08014878(void);
void sub_08019380(void);
void sub_0803670C(void);

/* All six parameters WIDE, read off sub_08014A5C's own prologue: r1, r2 and r3
 * go straight into r8/sb/r4 and the fifth arrives as a whole word at [sp,#0x20]
 * -- not one lsl/lsr pair among them, so nothing here is narrow. The third is
 * `void *` because sub_080195C8's caller hands it the same +0x18 word that
 * sub_08019578 dereferences. Result discarded, hence void. */
void sub_08014A5C(int, int, void *, int, int, int);

/* The three walkers over the 0x48-byte object sub_08019B50 models (see its
 * declaration above): all three read exactly r0 and take nothing else.
 * sub_08019B80's return is `u8` from its ONE result-keeping caller,
 * sub_08019D0C, which truth-tests it with a bare `lsls #0x18` -- that is a
 * floor on the narrowing, not proof of a boolean, so `u8` rather than `bool8`.
 * sub_08019578 walks a different object (the +0x18/+0x1e/+0x30 one that
 * sub_080195C8 owns) and is `void *` for the same "not modelled yet" reason. */
void sub_08019A60(void *);
u8 sub_08019B80(void *);
void sub_08019578(void *);
void sub_080196F4(void *);

/* Proc callbacks in the 0x08019D00 group, each installed by sub_08019F90 as a
 * function-pointer word (`ldr r0, =sub_08019D78`). sub_08019D48 is declared
 * here because sub_08019D78 and sub_08019DA8 forward their own untouched r0 to
 * it. */
void sub_08019D48(ProcPtr);

/* Reached only through sub_080192EC, which computes &gUnknown_0200C528[i] and
 * passes it -- so the parameter is the slot itself, not an index. */
void sub_080192C4(struct Unk0200C528 *);

/* Both parameters are `s16` and that is MEASURED, against the promoted
 * `void sub_08022AD0(u16, u16)` in src/decomp/c_08022AD0.c that wave 26 has now
 * corrected. sub_08019DCC hands sub_08022AD0 an `ldrsh` member with no
 * conversion at all and a computed expression narrowed `lsls #0x10; asrs
 * #0x10`; the u16 spelling probes as `ldrh` plus a zero-extending `lsrs`, which
 * is not what the ROM does. sub_0802323C's second parameter shows the identical
 * sign-extending shape in sub_08019DEC. The definition's own body is two plain
 * `strh`s and is byte-identical either way -- c_08022AD0.c was re-verified with
 * trymatch after the change -- so the caller is the only evidence there is.
 * sub_0802323C's third parameter is a bare `movs r2, #3`, hence wide. */
void sub_08022AD0(s16, s16);
void sub_0802323C(s16, s16, int);

/* Wave 26, W26-C: callees of the 0x08017658-0x08017E08 gUnknown_0200C528
 * script-command block.
 *
 * The nullary voids first -- each is reached with no argument register set up,
 * each ends `pop {r0}`, and every caller discards r0. sub_08026798 zeroes
 * gUnknown_030032C0 then calls sub_08020984; sub_080185A0 copies
 * gUnknown_08499588 to 0x06006800. */
void sub_08026798(void);
void sub_080185A0(void);
/* Already promoted in src/decomp/c_080179D0.c and declared from that
 * definition; sub_08017994 needs it visible from another translation unit. */
void sub_080179D0(u16 *);
/* `s16` off its own prologue -- `lsls #0x10; asrs #0x10` before it indexes
 * gUnknown_0200C528 -- and void (`pop {r0}`). */
void sub_080192EC(s16);
/* The twin of sub_08029088 above: the same `lsls #0x10; asrs #0x10` pair on r0
 * and r1, then `movs r2, #1` and a tail call into sub_080290B0. */
void sub_0802909C(s16, s16);
/* Three `s16` parameters, all three sign-extended in the prologue. It returns
 * sub_08025C5C's object or NULL; nothing models that pointee yet, so `void *`.
 * Both callers discard the result, so the return type has no oracle today. */
void *sub_08025C98(s16, s16, s16);
/* NULLARY, even though its one call site happens to leave a pointer live in r0
 * across the `bl`: the body's first instruction pair is `ldr r0,
 * =gUnknown_08499EE4; bl sub_08015BD0`, so it overwrites r0 before any read
 * and there is no parameter. It returns 1/0 through the split-`b` form and
 * sub_08017ABC re-narrows with `lsls #0x18; lsrs #0x18`, hence u8. */
bool8 sub_080281A0(void);
/* Scans gUnknown_085C77A0[].unk2c for its argument and returns the matching
 * index, or the 0xbf bound. The scan counter is kept `lsls #0x10; lsrs #0x10`
 * right up to `adds r0, r1, #0`, so the return is `u16`; the parameter is the
 * `u32` that unk2c already is (bare `adds r2, r0, #0`, no narrowing). */
u16 sub_080206B0(u32);
/* Its FIRST parameter is dead -- the body clobbers r0 with the
 * gUnknown_08499EE4 pool word before reading it -- and is readable only at
 * sub_08017B08, which loads it `ldrb` from gUnknown_03003FC0.unk02. The second
 * is stored whole with `str` into the resulting slot's +0x18. */
void sub_080281D8(u8, u32);

/* The gUnknown_0200C528 script-command handlers take the slot index and return
 * the "advance to the next command" flag. The RETURN TYPE IS MEASURED here,
 * and it is not the `bool8` the promoted files in this block guessed:
 *
 *   sub_08017D30 is `if (g != 1) return sub_08017A58(a); else { advance;
 *   return TRUE; }`, and the ROM narrows sub_08017A58's result with
 *   `lsls #0x10; asrs #0x10`. A `bool8` callee probes as `lsls #0x18;
 *   lsrs #0x18` there (measured with compile_probe, wave 26), and no `bool8`
 *   spelling of sub_08017D30 produces a 16-bit pair at all. sub_08017CF0 shows
 *   the identical shape over sub_08017A80.
 *
 * src/decomp/c_08017A58.c was therefore retyped `bool8` -> `s16` this wave. Its
 * own body is `return FALSE`, byte-identical either way, and it was re-verified
 * with trymatch after the change.
 *
 * The same argument makes the WHOLE family `s16 (s16)`: a wrapper that returns
 * its wrapped handler's value with no conversion must share that handler's
 * type, and these all sit in one dispatch table. c_08017B64.c, c_08017BD4.c
 * (three functions), c_08017D70.c and the `bool8` members of this block are
 * very likely mistyped the same way -- but every one of them returns a
 * CONSTANT, so none of them has an oracle and nothing forces the edit. They are
 * left alone deliberately. Settle the family in one pass, not piecemeal. */
s16 sub_08017A58(s16);
s16 sub_08017A80(s16);
/* The two callbacks this block installs into gUnknown_0200C528[i].unk08, each
 * of which clears that same slot when its own predicate fires. That
 * install/remove pair is what fixes the parameter as `struct Unk0200C528 *`:
 * the `str` is at +8 of the 0x18-byte SLOT, not of the 0x10-byte node. */
void sub_08017ABC(struct Unk0200C528 *);
void sub_08017C4C(struct Unk0200C528 *);

/* Wave 28, W28-A: five more of the same kind at 0x08018000, all installed into
 * a slot's `.unk08` and all clearing it again on their own predicate.
 * sub_08018A28 is the decisive one for the SLOT-not-node reading a second time:
 * it reads +0x11 with `ldrb` and +0x12 with `ldrsh`, and sub_08018A64 -- which
 * installs it -- writes those two members of `&gUnknown_0200C528[a]` from the
 * node's unk08/unk0a in the instructions just before the `str` at +8.
 * sub_080180A8 and sub_08018DF8 are reached only as installed callbacks too
 * (from sub_080180CC and from the +0x14 slot pointer respectively). */
void sub_080180A8(struct Unk0200C528 *);
void sub_080180CC(struct Unk0200C528 *);
void sub_080185BC(struct Unk0200C528 *);
void sub_08018A28(struct Unk0200C528 *);
void sub_08018AA8(struct Unk0200C528 *);
void sub_08018DF8(struct Unk0200C528 *);

/* Wave 26, W26-C extension: callees of the 0x08042 block.
 *
 * sub_08043120 / sub_08043190 / sub_08043200 are sub_080430B0's siblings,
 * declared above as `int (int, int, int)`. Every one of them is reached from
 * the same call shape -- `ldrb` of gUnknown_08499598[a].unk1d and .unk1e into
 * r0/r1 with the caller's second argument already parked in r2 -- so they take
 * the same three wide arguments and their results are added to or offset by a
 * constant, hence `int`. */
int sub_08043120(int, int, int);
int sub_08043190(int, int, int);
int sub_08043200(int, int, int);
/* The one-argument partners called first in sub_08042D1C / sub_08042D50, whose
 * results are added to the above. `int` on both counts: the argument is
 * forwarded from a bare `adds r0, rN, #0` with no narrowing, and the result
 * feeds an `adds`. */
int sub_080433B8(int);
int sub_080433C8(int);
/* sub_080425E0 and sub_080425FC narrow their own parameter `lsls #0x18;
 * lsrs #0x18` and hand it straight over, so the first parameter is `u8`; the
 * second is a bare `movs r1, #1` / `#0`. sub_08041820's three are all wide --
 * its two callers copy r0 and r1 with bare `adds` and add a `movs r2`. Both
 * results are discarded and both callers end `pop {r0}`. */
void sub_08041978(u8, int);
void sub_08041820(int, int, int);
/* sub_080424BC is promoted in src/decomp/c_080424BC.c and declared from that
 * definition. sub_080425B8 is the shared prologue its four 28-byte wrappers all
 * open with -- nullary, `pop {r0}`, and no caller reads r0. */
void sub_080424BC(void);
void sub_080425B8(void);
/* sub_080432A8 is another of the sub_080430B0 siblings but takes only TWO
 * arguments -- sub_08042D84 sets up r0 and r1 from the record and nothing else.
 * sub_080433E8 is the one-argument partner whose result is added to it, exactly
 * as sub_080433B8 / sub_080433C8 pair with theirs. sub_08043050's result is
 * masked `& 0x80` by sub_08042C68, so it is at least 8 bits wide; the promoted
 * definition in src/decomp/c_08042E2C.c names `u32`, and u32 vs int is
 * word-width both ways -- byte-neutral at every call site -- so the definition
 * wins. Its argument is forwarded from a bare register. */
int sub_080432A8(int, int);
int sub_080433E8(int);
u32 sub_08043050(int);
/* sub_08043270 / sub_080433D8 are the sub_08043200 / sub_080433C8 pair one more
 * time, reached by sub_08042C9C with the identical call shape. */
int sub_08043270(int, int, int);
int sub_080433D8(int);
/* sub_0804C400 passes it the slot index and gUnknown_08552148[index], both with
 * a bare `adds`, and discards nothing -- `pop {r0}`, void. */
void sub_0804C340(int, int);

/* ---- wave 26 (W26-A), the 0x08004000 extension block ---- */

/* Three already-promoted `void (void)` leaves that had no declaration --
 * src/decomp/c_08003704.c, c_080037AC.c and c_08003040.c. sub_08003704 and
 * sub_080037AC are byte-for-byte the same function. */
void sub_08003704(void);
void sub_080037AC(void);
void sub_08003040(void);

/* `void (void)`: two pool-fed calls and `pop {r0}`, no argument register read. */
void sub_08002E3C(void);

/* WIDE and SIGNED, and read off the callee: the prologue is a bare
 * `adds r5, r0, #0` followed by `cmp r5, #0; bge`, which is a signed test on a
 * whole word. It agrees with src/decomp/c_08004A60.c's note that
 * sub_08004A30's own parameter is `int` because sub_08004A90 passes -1, and
 * sub_08004A30 forwards it here untouched. */
void sub_08003C48(int);

/* Parameters 2, 3 and 4 are zero-extended `lsls #0x10; lsrs #0x10` at entry, so
 * u16; the first is a pointer nothing narrows. Both call sites in the 0x08004
 * block (sub_08004B7C, sub_08004C34) discard the result. */
void sub_0801A148(const void *, u16, u16, u16);

/* Four wide parameters. sub_08004D74 forwards its own r0 and r1 untouched and
 * adds a `u8 *` third and a literal fourth; sub_08004D90 passes all four. The
 * callee's prologue narrows none of them (`adds r7, r2, #0`, `cmp r0, #0`). */
void sub_08004DD4(int, int, u8 *, int);

/* Two wide parameters -- `adds r5, r0, #0; mov r8, r1` with no narrowing. The
 * second is a VRAM destination sub_08004D90 computes as
 * `&gUnknown_08499578[...]`. */
void sub_0801F2AC(int, u16 *);

/* The two targets in this block that other members of it call and that were not
 * already declared above (sub_0800485C is at line 1065, sub_08004A30 at 54).
 * sub_08004E44 returns a value (`pop {r1}; bx r1`) and every caller discards
 * it, so `int` is the weakest fit. */
void sub_08004C10(void);
void sub_08004C5C(void);
int sub_08004E44(void);

/* ------------------------------------------------------------------ *
 * Wave 27, W27-B: the 0x0803C block                                   *
 * ------------------------------------------------------------------ */

/* The two upper ranges of sub_0803CBA0's three-way bit-id dispatch, the same
 * family as the promoted sub_0803C8F0. The second parameter arrives
 * `lsls #0x18; lsrs #0x18` at both call sites, so `u8`; the first is the
 * biased id (`id - 0x60`, `id - 0x20`) with no narrowing on it at all, so
 * `u32` to agree with sub_0803C8F0 and sub_0803CA70. */
void sub_0803C9D4(u32, u8);
void sub_0803CA00(u32, u8);

/* The bottom range of that same dispatch, matched in wave 27. Neither
 * parameter is narrowed -- sub_0803CBA0 forwards both registers untouched,
 * which is what separates it from the two above. The bit index is used BOTH as
 * `id >> 3` (arithmetic `asrs`, so signed) and as the shift count of
 * `1 << id`, un-masked, exactly as in the promoted reader sub_0803CB74. */
void sub_0803CB40(int, int);

/* Matched in wave 27. `u8` return: sub_0803CC64 re-narrows the result
 * `lsls #0x18; lsrs #0x18` before comparing it against the 0xff empty-slot
 * sentinel, and agbcc only emits that for a narrow-returning callee. The
 * parameter is `u16` from the `lsls #0x10; lsrs #0x10` the caller applies to
 * its own parameter before the `bl`. */
u8 sub_0802490C(u16);

/* The promoted string copier in src/decomp/c_0803CC84.c, declared here so
 * sub_0803CCB8 can call it. */
void sub_0803CC84(u8 *, const u8 *);

/* sub_0803CF04's two callees. sub_0801AC58's first parameter is `u8` -- the
 * caller computes `a + 5` and then narrows `lsls #0x18; lsrs #0x18` before the
 * `bl`, which is the callee's width showing through. sub_0803D2F8's first is
 * sub_0803CF04's own second parameter forwarded with nothing done to it. Both
 * second parameters are &gUnknown_02000000. */
/* RETURNS int, not void (wave 29, W29-B): both exits set r0 (`movs r0,#1` at
 * _0801ACAE, `movs r0,#0` at _0801AD48) and its new caller sub_08016E3C
 * branches on the result (`cmp r0,#0; bne`). sub_0803CF04 discards it, which is
 * why the void spelling survived. */
int sub_0801AC58(u8, u8 *);
void sub_0803D2F8(int, u8 *);
void sub_0803D238(u8 *);

/* Matched in wave 27. The first parameter is `u8` (`lsls #0x18; lsrs #0x18`
 * in the prologue, in place on r0); the second is never touched -- it is
 * forwarded straight to sub_0803D2F8 -- and sub_0803CF3C is a pass-through
 * wrapper for the pair, so its arity is read off THIS prologue, which does
 * read r1. */
void sub_0803CF04(u8, int);

/* ------------------------------------------------------------------ *
 * Wave 27, W27-B: callees of the 0x08037 block that had no prototype  *
 * ------------------------------------------------------------------ */

/* Nullary and result-discarding, all read off their own call sites in
 * sub_08037124 / sub_08037750 / sub_08037E64: the call is a bare `bl` with no
 * argument register set up before it and nothing reads r0 after it, and each
 * caller's own epilogue is the void `pop {r0}; bx r0`. */
void sub_080169E8(void);
void sub_08036B34(void);
void sub_0803D6B8(void);
void sub_08037DC8(void);

/* sub_080375A4 is `sub_08037448(gUnknown_08090EF0[a])` -- the argument arrives
 * already zero-extended by the `ldrb` of the table read, so nothing in the
 * caller fixes the width and `int` is the weakest fit. The result is
 * discarded (sub_080375A4 ends `pop {r0}; bx r0`). */
void sub_08037448(int);

/* Matched in wave 27. `u8` and not `int`: the `lsls #0x18; lsrs #0x18` is in
 * the prologue operating on r0 IN PLACE, which is PROMOTE_MODE narrowing a
 * sub-word parameter, not a cast at a use (that would copy first). Its one
 * caller sub_08037E64 passes gUnknown_03003FC0.unk01, itself a `u8`. */
void sub_080375A4(u8);

/* The three arms of sub_080375D4's `switch (p->unk1e++ & 0x3f)`, each called as
 * `f(p->unk18)`. struct Unk03001470's unk18 is already `int`, so these agree
 * with it; the results are discarded. */
void sub_0801B6EC(void *);
void sub_0801B6FC(void *);
void sub_08037A78(int);

/* The two halves of sub_08037638. sub_08037610 stashes its argument at
 * +0x18 of a fresh gUnknown_03001470 slot (see that struct's unk18 note), and
 * sub_08037638 hands it `a + ((c & 0x3ff) << 5)`. sub_0803768C then takes
 * sub_08037638's four arguments unchanged and untouched -- no narrowing on
 * either side, so all four are word-wide. */
void sub_08037610(int);
void sub_0803768C(int, int, int, int);

/* Same shape as ApplyPaletteExt, and sub_08037790 is its only readable call
 * site: a palette source, a byte offset and a byte count. The offset is
 * `gUnknown_0300057C * 0x20 + 0x1c` narrowed `lsls #0x10; lsrs #0x10` at the
 * call, which is where the `u16` comes from -- an `int` parameter would leave
 * the shift pair out. The count is the literal 2. */
void sub_0801368C(u16 *, u16, u16);

/* sub_08037FB4 is `sub_08049F08(1, parent)`. gUnknown_0849F4B4's note already
 * records that sub_08049F08 Proc_StartBlocking's a script and forwards its own
 * parent, which is what fixes the second parameter; the first is the literal 1
 * selecting among scripts. The result is discarded. */
void sub_08049F08(int, ProcPtr);

/* --- the 0x08044 block (wave 27, W27-C) ---------------------------------- */

/* Returns a byte: sub_080448E4 re-narrows the result with `lsls #0x18;
 * lsrs #0x18` before storing it, which agbcc only emits for a narrow-returning
 * callee. Declared without a prototype -- the two arguments it is passed there
 * are gUnknown_030033EC (u16) and the literal 1, and neither settles a
 * declared parameter type. */
u8 sub_0805C290();

/* CORRECTION (wave 30, W30-C): this was `void sub_0806AA80(s16, s16)`, inferred
 * from sub_08044968 passing two already-narrow gUnknown_08499594 bytes with no
 * narrowing in between -- which is byte-neutral at that call site and therefore
 * settles nothing. The BODY is decisive the other way: sub_0806AA80 opens with a
 * bare `adds r4, r0, #0` / `adds r5, r1, #0` and goes straight to `lsls r4, r4,
 * #4`, with NO `lsls #0x10; lsrs #0x10` prologue pair. agbcc's PROMOTE_MODE
 * emits that pair for EVERY sub-word parameter regardless of signedness, so its
 * absence proves both parameters are `int`. Re-verified: sub_08044968 is still
 * byte-identical with the wider declaration (the caller's operands are already
 * narrow, so the conversion costs nothing). Whether sub_08029088 -- the twin
 * this note used to lean on -- is really (s16, s16) is now unsupported by this
 * evidence and was NOT rechecked. */
void sub_0806AA80(int, int);

/* ---- wave 30 (W30-C): the 0x0806A block ---------------------------------- */

/* Already DEFINED in src/decomp/c_08063980.c as `void sub_08063980(int vcount)`
 * and matched, but nothing declared it. Every one of its nine callers passes a
 * bare `movs` immediate (0, 0x50, ...), so `int` is what the definition says and
 * no caller contradicts it. */
void sub_08063980(int);

/* The palette-ramp step sub_0806A680 runs each frame. Its prologue overwrites
 * r0 with the gPal pool word before reading it, so it takes nothing; `pop {r0};
 * bx r0`, so void. */
void sub_0806A5B8(void);

/* sub_0806AA80's only callee. r0 is the proc Proc_Start just returned (the body
 * writes words at +0x30..+0x4c and halfwords at +0x58..+0x60 of it), and r1/r2
 * are used unnarrowed as `lsls #0xc` shift operands, so both are `int`. */
void sub_0806A6F0(ProcPtr, int, int);

/* A BG0 scroll ping-pong: each of these installs the OTHER through
 * sub_080638D0, so their addresses cross unit boundaries and both need to be
 * visible here. `sub_080638D0(int)` is what the header already carries, so the
 * install is spelled `sub_080638D0((int)sub_0806A180)`. Neither reads an
 * argument register and both end `pop {r0}; bx r0`, so `void(void)`.
 * sub_0806A1A8 installs sub_0806A158 the same way. */
void sub_0806A158(void);
void sub_0806A180(void);
/* Registered through `sub_0801F024((void *)sub_0806A534, 0x7F)` by
 * sub_0806A578, i.e. the void(void) callback shape sub_0801F024's other
 * clients carry. */
void sub_0806A534(void);

/* ---- wave 30 (W30-C): the 0x08063 block ---------------------------------- */

/* Already DEFINED and matched in src/decomp; both had their parameter struct
 * hoisted into unknown-globals.h in this wave so that sub_08063430 and
 * sub_08063BBC -- which call them with their OWN proc pointer -- can name the
 * same type instead of each declaring a private copy. Both definitions were
 * re-verified byte-exact after the move. */
void sub_08062FB8(struct Unk08062FB8 *);
void sub_08063BE0(struct Unk8063BE0 *);

/* Neither parameter is narrow: sub_08011D7C's prologue is a bare
 * `adds r4, r0, #0` / `adds r5, r1, #0` with no PROMOTE_MODE shift pair. r0 is
 * stored as a whole word into a 12-byte record and r1 with `strh` at +8, so the
 * store width does not settle r1 and `int` is the weakest model. The return IS
 * narrow -- both exit paths sign-extend (`lsls #0x10; asrs #0x10`, and -1 on the
 * full arm) -- hence `s16`. sub_0806366C discards it. sub_08011D7C is still
 * unmatched, so this declaration is a contract, not a promoted signature. */
s16 sub_08011D7C(void *, int);

/* ---- wave 30 (W30-C): the 0x08066 block ---------------------------------- */

/* An (x, y) pair. Both prologues are a bare `adds r4, r0, #0` / `adds r5, r1,
 * #0` with no PROMOTE_MODE shift pair, so both parameters are `int`; both end
 * `pop {r0}; bx r0`, so void. They are twins -- same guard on
 * gUnknown_03004008, same `& 0x1FF` / `& 0xFF` wrap, differing only in the id
 * they pass sub_0801F34C (0x43 vs 0x44) and sub_08064500's extra palette
 * write. */
void sub_08064474(int, int);
void sub_08064500(int, int);

/* The two halves of sub_0806630C's dispatch and the two of sub_08066B40's.
 * sub_08065F88's prologue overwrites r0 with a pool word before reading it, so
 * that one is `void(void)` on its own evidence.
 *
 * The other five are declared WITHOUT a prototype on purpose, the way
 * sub_0805C290 above is: their call sites set up no argument, which does not
 * prove there is none -- in each case r0 happens to hold the dispatch value at
 * the `bl` -- and none of their bodies has been read. An empty parameter list
 * keeps the argument-less calls legal without asserting an arity that a later
 * wave would have to unpick. Do not "tidy" these into `(void)` without reading
 * the callee. */
void sub_08065F88(void);
void sub_08066220();
void sub_08066874();
void sub_08066A20();
void sub_08066D74();
void sub_08066EBC();
void sub_08066F20();

/* The dispatch chain itself, all three `void(void)`: each reads its selector
 * out of *gUnknown_08580934 and none touches an argument register before
 * writing it. Declared here because they call each other across units --
 * sub_08066B6C picks between sub_0806630C and sub_08066B40, and sub_08066FE0
 * calls sub_08066B6C. */
void sub_0806630C(void);
void sub_08066B40(void);
void sub_08066B6C(void);

/* ---- wave 30 (W30-C): the 0x08076 block ---------------------------------- */

/* NOT ordinary compiler output and NOT a `_call_via_rN` trampoline: 0x08071900
 * is four bytes of `bx pc; nop`, a THUMB-to-ARM interworking veneer in front of
 * the ARM routine that follows it, and data/asm-resident.json already carries
 * it. Eleven callers, all passing four register arguments. r0 and r1 are
 * addresses (sub_0807606C passes `gUnknown_08551A00 + 0x140` and an offset into
 * gUnknown_08499578), r2 and r3 small counts. The result is discarded
 * everywhere it is called from so far. */
void sub_08071900(void *, void *, int, int);

/* Returns 1, 0 or -1 with `bx lr` and reads no argument register. The return is
 * `int`, not a narrow type: sub_0807610C consumes it with a bare
 * `adds r1, r0, #0` and no re-narrowing, and agbcc re-narrows a
 * narrow-returning callee's result at every call site. */
int sub_08075EC4(void);

/* Takes the proc sub_0807610C is running -- it reads and writes the word at
 * +0x3c of it as a change-detect cache. `void *` is a placeholder for that
 * struct, which belongs to whichever unit defines the proc; the parameter is
 * definitely a pointer and definitely one argument. */
void sub_08075F44(void *);

/* Three `void(void)` helpers of the 0x08076 screen setup. All three ignore r0
 * -- sub_08076888 overwrites it with a pool word in its first two
 * instructions, and sub_08076858 / sub_0807681C never read it -- which matters
 * because sub_08076ADC calls sub_08076888 while its own proc pointer is still
 * sitting in r0. sub_08076B20 likewise. */
void sub_08076888(void);
void sub_08076858(void);
void sub_0807681C(void);
void sub_08076B20(void);

/* Starts gUnknown_086143B8 under `parent`. The first two parameters' WIDTH is
 * NOT settled: the body does `lsls #0x10; adds; lsrs #0x10`, which is one
 * truncation of `x - 0x10` and is equally what a u16 parameter plus that cast
 * collapses to. `int` is the weakest model and is byte-neutral at
 * sub_08076C8C, which passes literal zeros. The third is a plain word (`adds
 * r6, r2, #0`, compared against 2 and stored with `str`), the fourth goes
 * straight to Proc_Start as the parent. Settle the first two when sub_08077CAC,
 * the other caller, is matched. */
void sub_0807548C(int, int, int, ProcPtr);

/* Already DEFINED and matched in src/decomp with exactly these signatures, but
 * nothing declared them -- until this wave every caller was still in asm/, so
 * the omission was invisible. sub_08076ADC, sub_08076BF0, sub_08076C1C and
 * sub_08076C8C are the first promoted callers. */
void sub_0807639C(ProcPtr);
void sub_08074ED0(void *, ProcPtr);
void sub_08078480(void *, ProcPtr);
void sub_08078540(void *, ProcPtr);

/* Two starters run back to back on the caller's own proc as parent.
 * sub_08076ADC calls it across a unit boundary. */
void sub_08076C8C(ProcPtr);

/* ---- wave 30 (W30-C): the 0x0806B extension block ------------------------ */

/* sub_080137AC's neighbour and evident twin -- sub_0806B09C calls
 * `sub_080137AC(-1)` and sub_0806B0E0 calls `sub_08013830(1)`, the two of them
 * bracketing the same proc's fade. The argument is a bare `movs r0, #1`, which
 * settles nothing about the width, so `int` is the weakest model;
 * sub_080137AC next to it carries `s32` on no stronger evidence. */
void sub_08013830(int);

/* ---- wave 30 (W30-C): the 0x08065 extension block ------------------------ */

/* The cursor-step half of sub_08065EB4's dispatch. All three parameter widths
 * are read off the prologue: `adds r6, r0, #0` (a bare copy, so `int`),
 * `lsls r1, #0x10; lsrs r1, #0x10` (`u16` -- it is a key bitmask, tested
 * against 0x40 and 0x80), and `lsls r2, #0x18; lsrs r2, #0x18` (`u8`, used only
 * as a truth test to gate a sound effect). */
void sub_08065DAC(int, u16, u8);

/* The other half. Declared WITHOUT a prototype for the sub_0805C290 reason:
 * sub_08065EB4 reaches it on the arm where r0 happens to hold the `& 1` result,
 * so the call site cannot show whether that is an argument, and the body was
 * not read. */
void sub_08065D20();

/* Wave 30, W30-E: NOW DECLARED, copied verbatim from the definition in
 * src/decomp/c_08064BC8.c, and sub_0806502C is matched with an explicit
 * `(struct Unk08580934_Obj *)` on sub_080152EC's result. A pointer cast emits
 * no instruction, so the cast is a statement about the type model and costs
 * the match nothing; leaving the function unmatched bought nothing either.
 * The type conflict W30-C recorded below is REAL and still open -- the cast is
 * the marker for it, not a resolution of it. */
void sub_08064BC8(struct Unk08580934_Obj *, int, int, int);

/* W30-C's original note, kept because the evidence in it is what a future
 * unification pass needs.
 * sub_0806502C is `sub_08064BC8(sub_080152EC(gUnknown_08580A38, 3),
 * obj->unk28 + 8, obj->unk1c, obj->unk1c * 2)` -- but sub_080152EC returns
 * `struct Unk03001470 *` while src/decomp/c_08064BC8.c defines its first
 * parameter as `struct Unk08580934_Obj *`, so the call cannot be written
 * without a cast under -Werror.
 *
 * That is evidence, not an obstacle: it is the SECOND independent sign this
 * wave that the two structs describe one object. sub_08066580 stores another
 * sub_080152EC slot into gUnknown_08580934->unk74[], whose only reader touches
 * +0x08 -- a `u32` at the same offset in both models -- and the fields
 * sub_0806502C reads here line up too (unk1c at +0x1c in both, unk28 at +0x28
 * in both, with Unk08580934_Obj's unk2a sitting in the high half of
 * Unk03001470's u32 unk28). Unifying them is a multi-file retype that touches
 * five already-promoted writers of that u32 and wants a union for the
 * word/halfword duality; it was deliberately NOT started mid-wave.
 * sub_0806502C is left unmatched rather than papered over with a cast. */

/* --- the 0x0803B block (wave 27, W27-C) ---------------------------------- */

/* Already DEFINED in src/decomp with these exact signatures; they simply had
 * no declaration because nothing outside their own file called them until
 * this block. Copied from the definitions, not invented:
 *   src/decomp/c_08016E74.c, c_08017688.c, c_08034334.c, c_08038690.c,
 *   c_0803B83C.c, c_0803B8C4.c, c_080846F4.c. */
void sub_08016E74(void);
void sub_08017688(u16);
void sub_08034334(void);
void sub_08034338(void);
void sub_08038690(int);
void sub_0803B83C(void);
void sub_0803B8C4(void);
u8 sub_080846F4(void);

/* sub_0803BA1C takes nothing and returns nothing anybody reads: sub_0803BA4C
 * calls it first with no argument register set up and discards r0. */
void sub_0803BA1C(void);

/* Three function addresses, in r0/r1/r2, all pool words -- sub_0803B874 is
 * nothing but the call. Declared WITHOUT a prototype: the three are
 * sub_08034334, sub_08034338 and sub_0803B83C, all `void (void)`, but that is
 * what this ONE call site passes and not evidence about the parameter types. */
void sub_08012FB8();

/* --- the sub_08036B34 / AgbMain unit (wave 27, W27-C) --------------------- */

/* sub_08036B48 IS A FUNCTION and the index does not know it. The index gives
 * sub_08036B34 a size of 24, but its body plus its one pool word only reach
 * 0x08036B48; the remaining four bytes are `b .` and two of alignment padding.
 * AgbMain reaches them with `bl _08036B48` -- a CALL, not a branch -- so this
 * is a separate two-byte `for (;;) ;` function that got folded into its
 * neighbour's extent because it has no symbol. It is defined in the unit's own
 * source, immediately after sub_08036B34, which is what puts it at that
 * address.
 *
 * It is `static` there and so is NOT declared here. That is not a style
 * choice: the ROM's `bl` into it carries NO relocation, which only happens
 * when the assembler can resolve the target itself, which only happens for a
 * LOCAL symbol. Declared globally the branch keeps its relocation and AgbMain
 * misses by exactly those two bytes. Verified with
 * `tools/trymatch.py AgbMain --unit`. */

/* Plain `void (void)` leaves of the boot/reset unit; each is called with no
 * argument set up and its result discarded. */
void sub_0801F018(void);
void sub_08036A50(void);
void sub_08036AB8(void);
void sub_08036B28(void);
void sub_08036B34(void);
void sub_08036C08(void);
void sub_08036C4C(void);
void sub_08036E18(void);
void sub_08036E54(void);
void sub_0801BABC(void);
void sub_080128C4(void);
void sub_0801B6BC(void);
void sub_0803486C(void);
void sub_08034848(void);
void sub_0801BCE0(void);
void sub_08015544(void);
void sub_08011C18(void);
void sub_08011A84(void);
void sub_080191B0(void);
void sub_08015184(void);
void sub_08010F94(void);
void sub_08013434(void);
void sub_0801F4A4(void);
void sub_0801295C(void);
void sub_0803B688(void);

/* sub_08080F90 takes one argument; AgbMain's chain passes the literal 0. */
void sub_08080F90(int);

/* Returns a value AgbMain compares against -1, so at least `int` wide and
 * SIGNED at the comparison. Declared WITHOUT a prototype because the two
 * arguments AgbMain passes (a buffer address and 0x8000) do not settle their
 * declared types and a wrong prototype would be a claim, not a contract. */
int sub_08014DA8();

/* Declared without prototypes for the same reason -- the argument shapes are
 * read off AgbMain's call sites only:
 *   sub_0801A79C  five arguments, the fifth on the stack (two function
 *                 addresses, a buffer, the literal 2, a second buffer).
 *   sub_080129D4  one wide argument (the literal 0x0A6B99CD).
 *   sub_0801BB00  (index, handler) -- see gUnknown_030040D0's note above.
 *   sub_08016B2C / sub_08016A54  taken only as addresses, never called here. */
void sub_0801A79C();
void sub_080129D4();
void sub_0801BB00();
/* sub_08016B2C IS called after all -- sub_08016E14 (wave 29, W29-B) calls it
 * and feeds the result to sub_0801A7D8 as a byte count, so it is `int` and not
 * `void`; its one argument is the save-block base it copies into
 * (`adds r7, r6, #0x48` and word `ldm`/`stm` runs off it), and it returns the
 * constant 0x5CC. sub_08036B34 only takes its ADDRESS, and sub_0801A79C is
 * declared without a prototype, so the retype costs that call site nothing. */
int sub_08016B2C(void *);
void sub_08016A54();
void sub_080366F4(void);

/* The BIOS-style reset entry at 0x0808AAD4, already named in the assembly.
 * sub_08036CB4 passes 0xFE, which is a RegisterRamReset-shaped flag word, so
 * it takes an argument; the width is not settled beyond "fits in r0". */
void SoftReset(int);

/* ---- wave 27 (W27-A) ---- */

/* The BIOS block-copy SWI. Undeclared until this wave even though the
 * sub_08011C58 note far above was already written against it -- nothing that
 * CALLS it had been promoted. Signature copied from CpuFastSet, which the same
 * BIOS group declares, rather than re-derived. */
void CpuSet(const void *, void *, u32);

/* sub_08071AF0 / sub_08071B0C's shared worker, read off its own body:
 *     sub_08071B28(pal, index, b, parent)
 * Proc_Starts gUnknown_08613E54 under `parent`, takes the 0x30-byte
 * gUnknown_0202F2DC record at `index`, CpuSets 0x10 halfwords of
 * &gPal[index * 16] INTO that record -- a backup, not a load -- then stores
 * &gPal[index * 16] at the record's +0x24 and `pal`, its own FIRST argument, at
 * +0x20.
 *
 * THIS REFUTES the wave-20 note on sub_08071B0C above, which read that first
 * argument as the proc script. The script is gUnknown_08613E54 and it is
 * hard-coded in sub_08071B28's own literal pool; the first argument is ROM
 * PALETTE DATA. The confirming reader is wave 27's sub_08071C84 /
 * sub_08071CA4, which CpuSet the very same two symbols the other way -- out of
 * ROM and into &gPal[a * 16] -- which no proc script would survive. The two
 * front-ends' `(int, int, ProcPtr)` signatures are untouched by this and stay
 * as they are: neither of them ever sees the palette, they only load its
 * address into r0 on the way past.
 *
 * Returns the record (`adds r0, r4, #0` at the end). Both front-ends discard it
 * with `pop {r0}`, so nothing here pins the pointee and `void *` is the
 * weakest type that fits. */
void *sub_08071B28(const void *pal, int index, int b, ProcPtr parent);

/* The setter gUnknown_03002FA0's note in unknown-globals.h already names:
 * sub_0801BB00(slot, handler). The second parameter is an opaque `void *` on
 * the same evidence as sub_08011AAC's -- sub_08012A54 hands it that function's
 * own untyped pass-through parameter and does nothing else with it, so no data
 * type could describe it. */
void sub_0801BB00(int, void *);

/* All `void (void)`, all called as bare statements with no argument register
 * read. sub_08010FA0, sub_08012A24, sub_080122EC and sub_08013324 are the
 * display-shadow resets promoted in src/decomp; sub_0803DDF4 is still asm and
 * its prologue reads no parameter. */
void sub_08010FA0(void);
void sub_08012A24(void);
/* Types copied from the definition in src/decomp/c_0801224C.c, not re-derived.
 * sub_0801220C is its first cross-file caller and passes two literals, which is
 * byte-identical at any width and so adds no evidence either way. */
void sub_0801224C(u16, u16);
void sub_080122EC(void);
void sub_08013324(void);
void sub_0803DDF4(void);

/* The two window/blend openers promoted in src/decomp/c_08071CF4.c and
 * c_08071DB4.c. Each takes the proc it seeds, and wave 27's sub_08071E80 /
 * sub_08071EB8 are the first cross-file callers either has ever had -- they
 * forward their own r0 untouched. The tags are FORWARD-DECLARED and left
 * incomplete on purpose: the two definitions complete them privately in their
 * own translation units, and a pass-through caller never needs the layout. */
struct Unk08071CF4;
struct Unk08071DB4;
void sub_08071CF4(struct Unk08071CF4 *);
void sub_08071DB4(struct Unk08071DB4 *);

/* ---- wave 28 (W28-A): the 0x08018000 gUnknown_0200C528 script block ---- */

/* Types COPIED FROM the promoted definitions in src/decomp, not re-derived --
 * these five had no declaration because no promoted unit had yet called them
 * across a file boundary, and this block is the first to do so. */
void sub_08012A54(void *);   /* c_08012A54.c */
void sub_0802DCA4(void);     /* c_0802DCA4.c */
bool8 sub_0802C550(void);    /* c_0802C550.c */
void sub_0803B3E0(void);     /* c_0803B3C8.c */
/* RETYPED from the promoted `s32` to `bool8` -- see the note on the definition
 * in src/decomp/c_08078198.c. Its three callers all live in this block and all
 * three truth-test the result with a bare `lsls #0x18`. */
bool8 sub_08078198(void);    /* c_08078198.c */
void sub_08043418(int, int, int); /* c_08043418.c */

/* CORRECTION, wave 28 (W28-A): src/decomp/c_08018BAC.c declared this `bool8`.
 * The body cannot tell -- it is `movs r0, #1` at every width -- and its three
 * callers say otherwise. sub_08018BCC, sub_08018F34 and sub_08018F74 each end
 * `bl sub_08018BAC; lsls r0, #0x10; asrs r0, #0x10`. A `bool8` (QImode) result
 * converted to anything is `lsls #0x18; lsrs #0x18`, and a `s16` result in an
 * `int` context needs no conversion at all; only an INT result converted to the
 * caller's own `s16` return type produces the pair the ROM has. The definition
 * was retyped to `int` and re-verified with trymatch (still byte-identical). */
int sub_08018BAC(s16);

/* The 0x08018000 block's own helpers, none of which had a prototype.
 *
 * sub_08018018 takes `u8`: both callers (sub_080180A8, sub_080180CC) hand it
 * the s16 slot member unk0e through `lsls #0x18; lsrs #0x18`, which is the
 * narrowing a u8 parameter forces and an `int` parameter would not.
 * sub_0801815C likewise -- sub_080180CC reaches gUnknown_03002F08.unk02, a u16,
 * with `ldrb`, which is only a u8-context read.
 *
 * sub_08018254 takes `s16`: sub_08018464 holds its own s16 parameter in r4 and
 * re-derives `lsls #0x10; asrs #0x10` immediately before the `bl`.
 *
 * sub_08014824 returns at least `int`: sub_080185BC truth-tests the result with
 * a BARE `cmp r0, #0` and no narrowing, which rules out every sub-word return.
 *
 * sub_0801A548 mirrors sub_0801A57C above -- same caller shape, same u16 global
 * (gUnknown_030033EC) passed with a plain `ldrh`. All four returns are unused
 * at every known call site, so `void` is a floor, not a measurement. */
void sub_08018018(u8);
void sub_0801815C(u8);
void sub_08018254(s16);
int sub_08014824(void);
void sub_0801A548(u16);

/* ---- wave 28 (W28-A extension): the 0x08035000 block ---- */

/* Copied from the promoted definitions in src/decomp, not re-derived. */
ProcPtr sub_080355CC(u16, u16, u16, u16); /* c_080355CC.c */
int sub_08042DE0(int);                    /* c_08042DE0.c */
/* The tag is FORWARD-DECLARED and left incomplete on purpose, the sub_08071CF4
 * precedent: src/decomp/c_08035828.c completes it privately, and sub_08035810 --
 * its first cross-file caller -- only forwards a `Proc_Find` result. */
struct Unk35828Proc;
void sub_08035828(struct Unk35828Proc *);

/* The block's own helpers.
 *
 * sub_08035124 takes `u8`: sub_080351F0 reaches gUnknown_03003FC0.unk2e with a
 * plain `ldrb` and the callee's prologue is `lsls #0x18; lsrs #0x18` operating
 * on r0 IN PLACE before any global is touched, which is PROMOTE_MODE and not a
 * cast at a use.
 *
 * sub_0803F5E4's parameters arrive as a bare `adds r0, r4, #0` and a
 * `movs r1, #0x48` with no narrowing between them, so `int` is the weakest
 * reading of both -- and the first is handed the already-narrowed `u16`
 * parameter of sub_08035020, which converts silently either way.
 *
 * sub_08035760's second parameter is what settles its arity at two:
 * sub_080357E0 loads it from [sp, #8], its own FIFTH argument, immediately
 * before the `bl`. sub_08035740 forwards its own r0 there the same way.
 *
 * sub_08071488's third parameter is `s16`: both sub_08035E24 call sites end
 * `rsbs r2, r2, #0; lsls r2, #0x10; asrs r2, #0x10`, and sub_08035E6C passes a
 * bare 0, which settles nothing. The three void returns are floors -- every
 * call site discards the result. */
void sub_080350E4(void);
void sub_08035124(u8);
void sub_080352B4(void);
void sub_080353E8(void);
void sub_0803F5E4(int, int);
void sub_08035760(ProcPtr, void *);
void sub_08035DF4(void *);
void sub_08035E90(ProcPtr);
void sub_08071488(void *, u16, s16);

/* ---- wave 28 (W28-A extension): the 0x08036000 block ---- */

/* Copied from the promoted definitions in src/decomp; the 0x08036000 block is
 * the first cross-file caller each of them has had.
 * sub_08036CB4 lives in the AgbMain unit (c_08036B34.c) but is an ordinary
 * global, so the relocation is real -- it is NOT the `static` sub_08036B48
 * hazard that unit carries. */
bool8 sub_0802759C(void);    /* c_0802759C.c */
void sub_08036CB4(void);     /* c_08036B34.c */
void sub_0804A010(void);     /* c_0804A010.c */
/* The heap free's forwarder. Its own definition's comment already records the
 * evidence for `void *`: sub_080363D0 does `ldr r0, [r4, #0x48]` immediately
 * before the `bl`, and that is now a real cross-file call rather than a note. */
void sub_080364D4(void *);   /* c_080364D4.c */

/* Still assembly. Nullary: sub_0803647C `bl`s it with no argument set up and
 * with its own parameter already parked in r4, and discards the result. */
void sub_08036024(void);

/* ---- callees of the 0x0801B000 block (wave 28) ------------------------ */

/* sub_0808AE54 takes FOUR arguments, and that is MEASURED, not guessed.
 * sub_0801B66C forwards only two of them and yet still spends
 * `push {r4, lr}; adds r4, r1, #0` parking its second parameter in a
 * callee-saved register before narrowing its first into r1. The same body
 * probed against 2-, 3- and 4-argument declarations reproduces that prologue
 * ONLY at four: with two or three arguments r2 (and r3) are free, the narrowed
 * value lands there, and nothing is saved.
 *
 * This is the direct-call analogue of the `_call_via_rN` arity tell -- a
 * pass-through argument costs no instruction, but it does occupy a register,
 * and when it occupies the last free scratch the pressure is visible in the
 * prologue. It only reads out when the wrapper has something else that must
 * live across a call or a clobber, so it is not a general method; here the
 * u16 narrowing of the first parameter supplies exactly that.
 *
 * The return is unused at the only known call site, so `void` is a floor. */
void sub_0808AE54(u16, int, int, int);

/* sub_0808AC44 takes TWO arguments, by the same register-pressure readout that
 * measures sub_0808AE54 above -- and this one was caught by a failed match
 * rather than predicted, which is what makes it worth writing down.
 *
 * sub_0801B598 sets up r0 only, so the argument count looks like one. But the
 * ROM narrows its u8 parameter into r2, skipping r1, and a one-argument
 * declaration puts it in r1 and misses by exactly those 2 bytes. r1 is reserved
 * because a second, forwarded parameter is riding it. Three arguments would
 * have pushed the narrowed value to r3, so two is exact, not a floor.
 *
 * The widths at both ends are independent facts: `lsls #0x18; lsrs #0x18` at
 * entry is the u8 first parameter, and the `lsls #0x10; lsrs #0x10` after the
 * call is agbcc re-narrowing a u16-returning callee. The u8 agrees with the
 * note on gUnknown_03000F70 in unknown-globals.h, which has sub_0808AC44
 * rejecting an id above 3. Nothing types the second parameter, so `int`. */
/* WAVE 29 (C) types the second parameter. It is not `int`: sub_0808AC44's own
 * body does `ldr r0, =sub_0808AC20; str r0, [r2]`, i.e. it publishes the timer
 * IRQ handler THROUGH the pointer, so the parameter is where the caller wants
 * the installed callback written back. sub_0808AC20 is `void (void)`.
 * The arity readout above is untouched.
 *
 * CORRECTED at wave-29 integration: the note here originally said "the only
 * caller, sub_0801B598, is not promoted, so nothing has to change with it".
 * sub_0801B598 IS promoted (src/decomp/c_0801B598.c, its own single-function
 * unit) and this retype broke `make SPLIT=1 compare` on it -- per-function
 * try_match compiles one unit and cannot see a caller in another file, so the
 * split build is the only thing that catches this. Its four remaining callers
 * are still in asm/code.s, which is what the "not promoted" reading confused
 * it with. sub_0801B598 is a pure forwarder with no C caller and no
 * declaration here, so the pointer type was propagated through it rather than
 * cast at the call site; forwarding a pointer parameter unchanged is
 * byte-neutral and it re-verified. */
u16 sub_0808AC44(u8, void (**)(void));

/* sub_0808AF00 returns at least `int`. sub_0801B648 returns its result
 * directly with NO re-narrowing, and that is decisive here rather than merely
 * suggestive: the function's other arm returns an `int` parameter, so the
 * return type is int, and a u16-returning callee would have been re-narrowed
 * before being widened back. Arity is a floor for the usual reason. */
int sub_0808AF00(u16);

/* sub_0801B9C8 -- four arguments. The third is u16 at the CALLEE: sub_0801B998
 * adds two halfword fields of its proc and narrows the sum with
 * `lsls #0x10; lsrs #0x10` before the call, which is a cast at the argument and
 * not either field's width. The fourth is only known to be u16 because it is
 * sub_0801B998's own u16 parameter passed through -- that is the WRAPPER's
 * width, not a measurement of this callee. The result is added to a u8 field
 * and to a word field with no narrowing in between, so the return is at least
 * `int`. */
int sub_0801B9C8(int, u32, u16, u16);

/* sub_0801BA4C returns a SIGNED halfword: sub_0801BAA8 re-narrows the result
 * with `lsls #0x10; asrs #0x10`, and the ARITHMETIC shift is the sign.
 *
 * WAVE 29 (C) REFUTES THE PARAMETER. It was `void *` here and `u8 *` in
 * src/decomp/c_0801BAA8.c, on the reading that sub_0801BAA8's `adds r0, #0x5a`
 * walks 0x5a bytes into a struct. It does not: sub_0801BA4C's body is a
 * DEGREE-BASED SINE lookup on the value it is handed --
 *   while (x < 0)     x += 0xb4 * 2;   (360)
 *   while (x > 0x167) x += -0x168;     (-360)
 *   if (x > 0xb3) x -= 0xb4;           fold the lower half-turn
 *   if (x > 0x5a)  x = 0xb4 - x;       mirror about 90
 *   gUnknown_0808F048[x], negated when the original was >= 180
 * -- every step a SIGNED compare and an add on the value itself. No pointer
 * undergoes modular reduction against 360. So sub_0801BAA8(x) is
 * sub_0801BA4C(x + 90), i.e. cosine, and 0x5a is a quarter turn, not a member
 * offset.
 *
 * Corroborated from a caller, which is the only place it could be seen:
 * sub_08064034 and sub_0806407C build rotation matrices and pass THE SAME
 * sign-extended s16 angle to both functions, storing the two results as the
 * cos/sin entries of a 20.12 matrix. A pointer cannot be that argument.
 *
 * `int` and not `s16`: the prologue is a bare `adds r2, r0, #0` with no
 * narrowing anywhere, and the reduction loops need the full value.
 * src/decomp/c_0801BAA8.c was retyped in the same edit and re-verified
 * byte-exact -- `p + 0x5a` and `a + 0x5a` are the same `adds r0, #0x5a`. */
s16 sub_0801BA4C(int);
s16 sub_0801BAA8(int);

/* sub_080718E8(src, count) -- all three flush paths in the 0x0801B000 block
 * (sub_0801BBC4, sub_0801BC08, sub_0801BCA8) call it with a pending-copy
 * descriptor's unk00 pointer and its unk0a halfword count taken straight from a
 * `ldrh`, either right after the CpuFastSet that copies that same range or, in
 * sub_0801BCA8, instead of it. */
void sub_080718E8(void *, u16);

/* Three the tree already uses but never declared. sub_0801BB88 and
 * sub_0801BE78 are copied from their PROMOTED definitions in
 * src/decomp/c_0801BB88.c and src/decomp/c_0801BE78.c, which win over any
 * weaker model; sub_0801DF94 is still assembly and its `void (void)` is a floor
 * read off sub_0801BCE0, which sets up no argument register. sub_0801B768
 * likewise comes from src/decomp/c_0801B768.c. */
void sub_0801B768(int);
void sub_0801BB88(int);
void sub_0801BE78(void);
void sub_0801DF94(void);

/* ---- callees of the 0x0806E000 block (wave 28) ------------------------ */

/* sub_08073F90 hands out a u16 PAIR through two out-parameters. sub_0806E6F4
 * gives it two adjacent halfword slots of its own frame (`mov r0, sp` and
 * `sp + 2`, with `sub sp, #4` reserving exactly the two) and then reads both
 * back with `ldrh`. The signature was already recorded in the note on
 * gUnknown_03000044/46 in unknown-globals.h; this is the declaration. */
void sub_08073F90(u16 *, u16 *);

/* Two more of sub_0806E11C's teardown calls. `void (void)` is a floor for both
 * -- it sets up no argument register and ignores both results -- but they sit
 * in a run with sub_0806D620, already declared the same way. */
void sub_0806D34C(void);
void sub_0806D840(void);

/* ---- callees of the 0x0801E000 block (wave 28) ------------------------ */

/* sub_0801E18C takes the record INDEX, and that is measured rather than
 * assumed. Its three callers sub_0801E22C, sub_0801E248 and sub_0801E264 all
 * compute `&gUnknown_0200F720[i]` and then call it, and in all three the ROM
 * leaves the index in r0 and puts the computed address in the next register
 * DOWN from the argument block -- r2/r3 in the two-argument caller, r3/r4 in
 * the three-argument one, r4/r5 in the four-argument one. Declared `(void)`,
 * agbcc reuses r0 for the address in every one of them and all three miss.
 * The register that survives is the argument. */
void sub_0801E18C(int);

/* sub_0801E334 returns `int`, NOT the `u16` its promoted definition in
 * src/decomp/c_0801E334.c carried until wave 28 -- the definition has been
 * retyped to agree and re-verified byte-identical (the body is `return *p;`,
 * one `ldrh`, which zero-extends and so needs no extra instruction either
 * way).
 *
 * The evidence is at the CALLER, which is where a return type is settled:
 * sub_0801E950 forwards the result straight into sub_0801E0C8's `int`
 * parameter with NO re-narrowing, and agbcc re-narrows a narrow-returning
 * callee at every call site. Declared `u16`, sub_0801E950 gains an
 * `lsls #0x10; lsrs #0x10` pair it does not have. */
int sub_0801E334(u16 *);

/* SIX parameters, not seven, and the fifth is 64 BITS WIDE. That is the whole
 * story of this little family and it was worth four functions.
 *
 * Read as seven `int`s, all four wrappers miss by exactly one register: three
 * come out 4 bytes SHORT and sub_0801ED80 8 bytes short. The tells, which only
 * make sense together:
 *
 *   * sub_0801E930 materialises the two zero words into TWO callee-saved
 *     registers (`movs r4,#0; movs r5,#0`) and then builds -1 as
 *     `movs #1; rsbs` rather than the one-instruction `subs r4,#1` an
 *     already-live zero would have allowed. Seven `int`s let CSE collapse the
 *     two zeros into one register, which is the missing 4 bytes. A DImode
 *     constant occupies a REGISTER PAIR and cannot be collapsed.
 *   * sub_0801ED80 spends `sub sp, #4` BEFORE its push and then round-trips r3
 *     through `str r3,[sp,#0x20]; ldr r1,[sp,#0x20]`. That is not a spill and
 *     not varargs (agbcc's varargs prologue is `push {r2,r3}`, measured): it is
 *     a 64-bit parameter STRADDLING the register/stack boundary, so gcc
 *     reserves a home slot to make its two words contiguous. agbcc even labels
 *     the reload `@ created by thumb_load_double_from_address`.
 *   * sub_0801ED80 then reads THREE stack slots (0x20/0x24/0x28) where six
 *     `int`s give only two.
 *
 * A 12-byte struct by value was tried first and is refuted: it compiles to
 * `ldmia`/`stmia` block copies that appear nowhere in the ROM.
 *
 * The first parameter of sub_0801ECE8 is s16 -- both wrappers narrow with
 * `lsls #0x10; asrs #0x10` at the call and the ARITHMETIC shift is the sign.
 * Nothing types the rest, so `int` is what costs no instruction. Whether the
 * 64-bit parameter is really one quantity or two words the callers happen to
 * pass adjacently is NOT settled here -- what is measured is its width and its
 * alignment behaviour at a call. */
int sub_0801E338(int, int, int, int, long long, int);

/* ---- wave 29, W29-B: address-locality block 0x0801D --------------------- */
/* The two workers the 0x0801D7xx wrappers forward to. ARITY IS READ OFF THEIR
 * OWN PROLOGUES, not off the wrappers: sub_0801D6E8 reads `[sp,#0x14]` after
 * pushing five registers, so five parameters; sub_0801D78C reads `[sp,#0x18]`
 * and `[sp,#0x1c]` after pushing five and subtracting 4, so six. Both return a
 * value (sub_0801D6E8's early exit is `adds r0,r3,#0` on a -1). Every argument
 * is forwarded unchanged at all five call sites, so `int` throughout is what
 * costs no instruction -- it is the weakest fit, not a proof of the widths. */
int sub_0801D6E8(int, int, int, int, int);
int sub_0801D78C(int, int, int, int, int, int);
/* sub_0801D348's other branch. Its body wants narrower types than this
 * (`lsls #0x10; asrs #0x10` on argument 1, `strh` on 2 and 3, `ldrh` on the
 * stack argument 5) but the declaration is kept wide DELIBERATELY: its one
 * caller forwards all five straight through with no conversion, which a
 * declared-narrow parameter would not have allowed. Re-derive it when
 * sub_0801E4B0 itself is matched. */
int sub_0801E4B0(int, int, int, int, int);
/* Wrappers matched in wave 29. sub_0801D7D4 keeps its own r3 and appends
 * (0, 0x1d); sub_0801D804 is the same call with argument 4 forced to 0, the
 * same relationship sub_08015578's pair has. sub_0801D7EC forces argument 4 to
 * 0 and pushes its own last two along. */
int sub_0801D7D4(int, int, int, int);
int sub_0801D7EC(int, int, int, int, int);
/* Argument 7 is a 64-bit quantity: it is loaded as two adjacent words at
 * [sp,#0x24]/[sp,#0x28] with agbcc's own "created by
 * thumb_load_double_from_address" pairing and lands in sub_0801E338's declared
 * `long long` slot. Argument 8 is `u16` at entry (`lsls #0x10; lsrs #0x10`) and
 * is cast to `(s16)` at the one use. Argument 1 is only ever tested `& 1`. */
void sub_0801D348(int, int, int, int, int, int, long long, u16);
void sub_0801D81C(int);
/* The three fixed-point readers. All divide by 256 -- the `cmp #0; bge;
 * adds #0xff` before the `asrs #8` is a SIGNED DIVIDE rounding toward zero, not
 * a shift, and the members are the s32 unk0c/unk10/unk14/unk18. sub_0801D9AC
 * reads position plus offset, sub_0801D9E4 the offset alone and sub_0801DA14
 * the position alone. */
void sub_0801D9AC(int, s16 *, s16 *);
void sub_0801DA14(int, s16 *, s16 *);
int sub_0801ECE8(s16, int, int, int, long long, int);

/* FIVE parameters: three in registers, then the same 64-bit quantity starting
 * in r3 and continuing on the stack, then an s16. sub_0801EDF8 narrows its own
 * fourth parameter with `lsls #0x10; asrs #0x10` into the slot past it. */
int sub_0801ED80(int, int, int, long long, s16);

/* ---- wave 29 (C) ---- */
/* FOUR parameters and void (`pop {r0}`). r0/r1 are parked in r8/sb untouched
 * and stored to +0x2c/+0x30 of the proc it starts; r2 goes to the `int`
 * gUnknown_030044D4 AND to +0x54 as a word, so it is a full word; r3 is the
 * parent handed to Proc_StartBlocking. sub_0803FECC passes 0 for the third and
 * sub_0803FEDC/sub_0803FF04 pass -1 and -2, which is why it is signed. */
void sub_0803FF48(int, int, int, ProcPtr);
/* src/decomp/c_0803F3E4.c already defines this as
 * `void sub_0803F3E4(int a, int b, ProcPtr parent)`; the declaration is added
 * here because sub_0803F3C8 calls it from another unit. Both its word stores
 * are `str`, and `adds r1, r2, #0` at the call in the definition fixes the
 * parent as the third parameter. */
void sub_0803F3E4(int, int, ProcPtr);

/* The two arms of sub_08041958.
 *
 * sub_0804074C is declared WITHOUT a prototype, the same way sub_0801C240 is
 * above: its first parameter is a pointer to an object whose +0x02 halfword and
 * +0x04 byte it reads, and whoever promotes sub_0804074C will want to name that
 * struct locally. Its second parameter is the parent for Proc_StartBlocking.
 *
 * sub_08040790 takes THREE. The third is not visible at sub_08041958's call --
 * r2 already holds the proc there, so no instruction sets it up -- but
 * sub_08040790's own prologue does `adds r1, r2, #0` before
 * `bl Proc_StartBlocking`, which is a parent arriving in r2. The first two are
 * stored as words at +0x2c/+0x30 of the new proc and are also used as a cell
 * column and a cell row into the gUnknown_08499590 grid, so `int` for both. */
void sub_0804074C();
void sub_08040790(int, int, ProcPtr);

/* Wave 29 (C), the 0x0808A block.
 *
 * sub_0808A5C4 reads no argument register before writing it (it opens with a
 * `bl`) and ends `pop {r0}`, so nullary and void.
 *
 * sub_08014740 takes SIX and returns the sub_080152EC slot it allocates (r8 is
 * that result and is what r0 carries out). FIVE of the six are `u16`: its
 * prologue narrows r0, r1, r3 and both stack arguments with `lsls #0x10;
 * lsrs #0x10`, which is PROMOTE_MODE and which an `int` parameter never
 * produces. The third is untouched and is forwarded as a pointer --
 * sub_0808A6A0 passes the dereferenced `u16 *` gUnknown_08499578. */
void sub_0808A5C4(void);
struct Unk03001470 *sub_08014740(u16, u16, u16 *, u16, u16, u16);
/* Promoted as `void sub_0808AC20(void)` in src/decomp/c_0808AC20.c; declared
 * here because sub_0808AC44 publishes its address through a parameter. */
void sub_0808AC20(void);

/* The BIOS LZ77 decompressor, VRAM variant. Nothing declared it before wave 29
 * even though `asm/` calls it in several places; the shape is the standard BIOS
 * one and sub_0804BB28 passes a ROM blob pointer and a destination. */
void LZ77UnCompVram(const void *, void *);
/* Declared WITHOUT a prototype, like sub_0801C240: its first parameter is
 * walked as a `u16 *` (64 halfwords, each halved per 5-bit channel) into a
 * scratch buffer before a CpuFastSet, and whoever promotes it will want to name
 * that pointer type. Its second parameter is the CpuFastSet destination. */
void sub_0804BD58();

/* Wave 29, W29-A -- the 0x0802D000 address-locality block's callees. Each was
 * already DEFINED or is still asm; none had a declaration, so these publish
 * what their own prologues say.
 *
 * sub_08029948's parameter is `int`, not `u16`: the prologue is
 * `adds r4,r0,#0` FOLLOWED by `lsls #0x10; lsrs #0x10`, i.e. copy-then-narrow,
 * which is the cast-at-a-use shape and not PROMOTE_MODE on a declared-narrow
 * parameter. The narrowed value is `strh`ed into gUnknown_03001470[i].unk22.
 * Its two callers (sub_0802D168, sub_0802D1A0) pass literals, so they cannot
 * discriminate.
 *
 * sub_080637AC is a slot lookup over gUnknown_03001470: it walks the array
 * DOWN from index 0x1d (base + 0xae0, `subs r1,#0x60` per step) and returns
 * the first element whose unk00 equals the argument, else 0 -- so the return is
 * a `struct Unk03001470 *` and the argument is the script address callers hand
 * it (gUnknown_0848A42C at sub_0802D33C). `const void *` is the weakest model:
 * nothing dereferences the argument, only compares it.
 *
 * sub_080236E8 / sub_08042650 / sub_08042864 / sub_08060684 / sub_080606A0 all
 * open by loading a pool word or making another `bl` and never read r0, so
 * `void (void)`; all five end `pop {r0}; bx r0`.
 *
 * sub_0802D5B8 is `Decompress(sub_08037250(), a1)` -- the destination buffer,
 * hence `void *` to match Decompress's second parameter.
 *
 * sub_0802D7B4's parameter is `int`: its one readable caller sub_0802D99C
 * SIGN-extends the value into r0 (`lsls #0x10; asrs #0x10`) immediately before
 * the `bl`, which a declared-narrow parameter would not ask for -- a u16
 * parameter makes the caller emit the zero-extending `lsrs` instead. The
 * `lsls #0x10; lsrs #0x10` in sub_0802D7B4's own prologue is a `u16` local it
 * spills to [sp,#0x1c], not PROMOTE_MODE. */
void sub_08029948(int);
struct Unk03001470 *sub_080637AC(const void *);
void sub_080236E8(void);
void sub_08042650(void);
void sub_08042864(void);
void sub_08060684(void);
void sub_080606A0(void);
void sub_0802428C(void);
void sub_08035810(void);
u8 *sub_08037250(void);
void sub_0802D5B8(void *);
void sub_0802D76C(void);
void sub_0802D7B4(int);

/* Wave 29, W29-A -- the 0x08025000 address-locality block's callees.
 *
 * TWO OF THESE FIX AN ARITY THAT IS INVISIBLE AT THE CALL, and both are read
 * off the callee's prologue exactly as docs/agbcc-codegen.md says to:
 *
 *   sub_08024F20 takes THREE arguments. r2 is never written before
 *   `ldrh r0,[r2]` / `ldrh r0,[r2,#2]`, whose results are `strb`ed into
 *   gUnknown_08499594[i].unk02 / .unk03 -- the {u16;u16} pair, i.e.
 *   struct Unk802C57C. Its ONE caller, sub_080251BC, never touches r2, so
 *   sub_080251BC has a third parameter too and forwards it for free. r0 and r1
 *   are `s16`: sub_080251BC narrows both with `lsls #0x10; asrs #0x10` in front
 *   of the `bl` and tests its own r1 raw (`cmp r1,#0`, no PROMOTE_MODE), so the
 *   sign-extension is the CONVERSION at the call and not a cast in the caller.
 *
 *   sub_08035740 -- already defined as `void sub_08035740(void *)` in
 *   src/decomp/c_08035740.c but never declared -- reads r0 before writing it,
 *   and sub_08025BB4 opens with a bare `bl sub_08035740`. So sub_08025BB4 has a
 *   `void *` parameter it forwards. `void sub_08025BB4(void)` is refutable, not
 *   just unproved: it would have to pass a literal, and any literal costs a
 *   `movs r0,#N` the ROM does not have.
 *
 * sub_080251D8 likewise reads r0 (`adds r1,r0,#0` then `lsls #0x10; asrs #0x10`
 * at a use -- copy-then-narrow, so `int`), which is why sub_080251BC's else-arm
 * `bl` needs no argument setup at all.
 *
 * sub_08025AEC and sub_080254AC both scan gUnknown_08499594 for a free slot and
 * return the element address or 0, so both return `struct Unk08499594 *`; both
 * end `pop {r1}` / `bx lr` with r0 live. sub_08025BE0 initialises one of those
 * records field by field at +0..+0xb, which is the whole 0x0c-byte struct.
 *
 * sub_080211DC is `(u8, s8)` off its own prologue: BOTH arguments are narrowed
 * in place with `lsls #0x18; lsrs #0x18` (PROMOTE_MODE, which zero-extends
 * whatever the signedness), and the second one alone is re-read at its use as
 * `lsls #0x18; asrs #0x18` before going out on the stack -- the second shift
 * pair is where the sign lives. sub_08025340 passing -1 corroborates it. */
void sub_08024F20(s16, s16, struct Unk802C57C *);
void sub_080251D8(int);
void sub_080211DC(u8, s8);
struct Unk08499594 *sub_080254AC(void);
struct Unk08499594 *sub_08025AEC(void);
void sub_08025BE0(struct Unk08499594 *, u8);
void sub_08025D20(int);
void sub_08035740(void *);
/* Wave 29, W29-A. `s16` and not `u16`, and the discriminator is entirely on the
 * CALLER side: sub_08025C5C's own prologue is `lsls #0x10; lsrs #0x10` on all
 * three, which PROMOTE_MODE emits for u16 and s16 alike (probed both). What
 * separates them is sub_08025C98 / sub_08025CC8, which SIGN-extend all three
 * arguments before the `bl`; declaring the parameters `u16` makes those two
 * callers emit `lsrs` there instead and neither one matches. Returns the
 * gUnknown_08499594 slot sub_08025AEC handed out, or NULL. */
struct Unk08499594 *sub_08025C5C(s16, s16, s16);

/* Wave 29, W29-A. Both are already DEFINED (src/decomp/c_0803CD14.c,
 * src/decomp/c_0803CCEC.c) and were never declared; these publish the
 * definitions unchanged. sub_0802490C and sub_08024944 are the callers, and
 * they corroborate the `u8` parameter -- each narrows `id + 0x4c` with
 * `lsls #0x18; lsrs #0x18` in front of the `bl`. The `lsls #0x18; lsrs #0x18`
 * AFTER sub_0802490C's call is not a re-narrowing of sub_0803CD14's `int`
 * result; it is sub_0802490C's own `u8` return conversion. */
int sub_0803CD14(u8);
u8 *sub_0803CCEC(u8);

/* Wave 29, W29-A -- the 0x08026000 / 0x0802A000 blocks' callees.
 *
 * sub_0803FECC takes THREE arguments, and the third is the invisible one again:
 * its whole body is `adds r3,r2,#0; movs r2,#0; bl sub_0803FF48`, so it forwards
 * r2 into sub_0803FF48's declared `ProcPtr` fourth parameter and passes 0 for
 * the third. sub_0802A588 opens `adds r2, r0, #0` -- it is parking its own proc
 * pointer in r2 for exactly that argument, which is otherwise unexplained.
 *
 * sub_08026584 is a bare `bx lr`, four bytes. Nothing about its signature is
 * recoverable from the callee; `(u8, int)` is what sub_080265B0 and
 * sub_080265D0 set up, and it is a floor.
 *
 * sub_08025D60 walks a 12-byte record list recursively and takes a signed index
 * -- `asrs r4,r4,#6` on the argument is arithmetic. void (`pop {r0}`).
 * sub_08020984 reads no argument register and ends `pop {r0}`. */
void sub_08026584(u8, int);
void sub_08020984(void);
void sub_0803FECC(int, int, ProcPtr);
void sub_08025D60(int);

/* Wave 29, W29-A -- sub_08052EE4 / sub_08052F20's callees. All four read no
 * argument register before writing it and all four end `pop {r0}` (sub_08012420
 * is already matched in src/decomp/c_08012420.c and simply had no declaration).
 * The void returns are floors: sub_08052F20 discards every result. */
void sub_08012420(void);
void sub_080546F0(void);
void sub_08054B14(void);
void sub_08057270(void);


/* ---- Wave 30, W30-A: the 0x08031/0x08032/0x08039 address-locality block ---- */

/* Already promoted as `void sub_080337D8(u32, u32, ProcPtr)`
 * (src/decomp/c_080337D8.c) but never declared here; sub_08031BF0 is the first
 * caller outside its own unit. */
void sub_080337D8(u32, u32, ProcPtr);
/* The five-argument sibling of sub_080337D8: sub_08031C1C passes the same
 * gUnknown_02000000 buffer, a 0xA5C size, two zeros and its own proc on the
 * stack. The proc is last, matching sub_080337D8's third-and-last position. */
void sub_0803376C(u32, u32, int, int, ProcPtr);
void sub_08030F60(int);
/* sub_08031E7C passes (0x11, -1). The -1 is `movs r1,#1; rsbs r1,r1,#0`, the
 * constant, NOT a bitfield mask -- it goes straight out as the argument with
 * no `ands` anywhere. */
void sub_0801394C(int, int);
void sub_0802F588(struct Unk0202575C *, int);
void sub_0803227C(void);
/* Coordinates: sub_08032420 feeds it `gUnknown_0849B060->unk04 * 40` and
 * `->unk06 * 40`, each emitted as `lsls #2; adds; lsls #0x13; asrs #0x10` --
 * the x5 strength reduction with the x8 folded into the s16 narrowing, which
 * is what a declared s16 parameter costs and an int parameter does not. */
void sub_08032340(ProcPtr, s16, s16);
void sub_08032950(void);
void sub_08032A00(void);
/* Mutually recursive HBlank/VCount handlers: each installs the other with
 * sub_080638D0. Declared so either can name the other's address. */
void sub_08032B84(void);
void sub_08032BA4(void);
/* THREE parameters, and the third is proved rather than guessed: sub_080397BC
 * copies its incoming proc pointer into r2 BEFORE loading either argument out
 * of it (`adds r2,r0,#0; ldr r0,[r2,#0x54]; ldr r1,[r2,#0x58]`). With only two
 * parameters agbcc keeps the base in r0 and moves the first argument in last
 * (`ldr r2,[r0,#0x54]; ldr r1,[r0,#0x58]; adds r0,r2,#0`) -- same 16 bytes,
 * five of them different. The copy lands in r2 because r2 IS the third
 * argument register. Wave 30, W30-A. */
/* Already promoted as `void sub_08044144(int)` (src/decomp/c_08044144.c) but
 * never declared here; sub_08039F58 is the first caller outside its own unit. */
void sub_08044144(int);
void sub_08044B28(int, int, ProcPtr);
/* Same third-parameter proof from sub_08039650, where it additionally forces
 * the r2/r3 split between the proc pointer and the gUnknown_08499598 base. */
void sub_08080E74(int, int, ProcPtr);
/* sub_08039820's predicate. `lsls r0,r0,#0x18` on the result before the `cmp`
 * is a narrow return being re-narrowed, so it is u8/bool8 and not int. */
u8 sub_08039850(ProcPtr);
/* Returns a literal 0 that sub_08039820 discards; the narrow return type is
 * inferred from sub_08039850, the alternative it is selected against. */
u8 sub_080398D0(ProcPtr);
/* The u16 entry narrowing `lsls #0x10; lsrs #0x10` in sub_080397F4's own
 * prologue IS the parameter declaration -- its only argument, an `ldrh` out of
 * gUnknown_085D3DD0[..].unk20[], needs no conversion. */
void sub_080397F4(u16);
/* All three parameters int, read off the promoted definition in
 * src/decomp/c_08039BB4.c (bare `adds rN,rM,#0` saves, no PROMOTE_MODE
 * narrowing). Never declared here before wave 30. */
void sub_08039BB4(int, int, int);

/* ---- Wave 30, W30-B ---- */

/* sub_0801489C IS A FOUR-BYTE `bx lr` AND NOTHING ELSE (0x0801489C, one
 * instruction plus alignment). There is no prologue, so the usual
 * read-the-callee's-narrowing route to its widths does not exist -- every field
 * of this declaration comes from its four call sites, and two of them
 * (sub_080148A0, sub_080148E0) are wave 30's:
 *   - FIVE parameters. Both callers `sub sp, #4` and `str rN, [sp]` a zero
 *     before the `bl`; nothing else in either function needs stack space.
 *   - Parameter 2 is `u16`: the value both callers compute is
 *     `unk000[i] * 2 + unk408[i]`, a 17-bit sum, and both narrow it with
 *     `lsls #0x10; lsrs #0x10` immediately before the call.
 *   - The RETURN is `u16` on the same tell -- both callers re-narrow the result
 *     with `lsls #0x10; lsrs #0x10` before returning it, which is what agbcc
 *     puts at the call of a narrow-returning callee.
 *   - Parameters 1, 3, 4 and 5 are NOT constrained. r0 is forwarded untouched
 *     from the caller's own first argument, r2/r3 are either 0 or values
 *     already zero-extended by the caller's PROMOTE_MODE, and the stack word is
 *     always 0 -- every one of those is byte-identical under `int`, `u8` or
 *     `u16`, so `int` is the weakest model rather than a reading. */
u16 sub_0801489C(int, u16, int, int, int);
/* Measures a string: it walks a NUL-terminated byte sequence, special-cases the
 * range 9..10, and accumulates gUnknown_084C36E4[c] per character. Its only
 * caller sub_08014D20 converts the result to tiles as `(w + 6) / 8` with the
 * signed `bge; adds #7; asrs #3` bias sequence, so the return is a SIGNED word
 * -- an unsigned one would be a bare `lsrs #3`. */
int sub_08014D38(const char *);
int sub_08014D20(const char *);
/* The two halfword-valued queries sub_08027844 / sub_08027A08 run on
 * gUnknown_03001FBC. Both return s16: each caller re-narrows the result with
 * `lsls #0x10; asrs #0x10` and then compares it SIGNED (`cmp #0x10; bgt`,
 * `cmp #4; bgt`). The parameter is s16 for the same reason sub_080157A4 /
 * sub_080157F4's first is -- gUnknown_03001FBC is a declared `s16` global and
 * arrives via `ldrsh`.
 *
 * CORRECTED at wave-30 integration: the return is `u16`, NOT `s16`, and the
 * caller-side reading above is a textbook cast-at-a-use error. Both bodies are
 * a single `return tbl[i].field;` compiled to `ldrh r0, [r0, #60]` flowing
 * straight into `bx lr` -- an UNSIGNED halfword load with no re-narrowing. `s16`
 * forces `ldrsh`, which needs the offset in a register (`movs r1, #60; ldrsh
 * r0, [r0, r1]`) and costs +4 bytes on a 36-byte function; measured at 77.8%.
 * So the callers' `lsls #0x10; asrs #0x10` is an explicit `(s16)` cast in the
 * CALLER's source, which is exactly what the brief's copy-then-narrow rule says
 * a narrowing after a `bl` means when the value is used afterwards. A signed
 * compare downstream constrains the caller's local, not the callee's return.
 * The discriminating evidence here is callee-side (`ldrh` vs `ldrsh`) and it
 * beats the call-site shape. */
u16 sub_08015820(s16);
u16 sub_080157D0(s16);
/* sub_0801C210's allocator and initialiser, read off sub_0801C210 (their only
 * caller) plus their own bodies. sub_0801C6E8 scans gUnknown_03000288's 16
 * slots and returns the free one or NULL, which is the value sub_0801C210
 * NULL-tests and returns. sub_0801C69C takes the handle plus sub_0801C210's
 * three arguments forwarded unchanged -- their widths are invisible at that
 * call (the values are already zero-extended by sub_0801C210's own
 * PROMOTE_MODE, so any narrowing there would be elided), so these mirror
 * sub_0801C210's declared widths rather than measuring anything. */
struct Unk0801C210 *sub_0801C6E8(int);
void sub_0801C69C(struct Unk0801C210 *, void *, u16, u8);
/* The rest of the 0x0801Cxxx animation-handle vocabulary.
 *   sub_0801C27C / sub_0801C2DC  the two halves of "advance one step":
 *     sub_0801C254 calls them in that order and re-narrows only the second's
 *     result (`lsls #0x18; lsrs #0x18`), which is what makes sub_0801C254 `u8`.
 *   sub_0801C640  installs a script: it STORES its second argument into the
 *     handle's +0x00 and derives +0x04/+0x08/+0x0c from it. `void *` because
 *     the body reads it as u16-offset table or as u32 pointers depending on
 *     the handle's +0x20 bit 1, so no single element type describes it.
 *   sub_0801C51C  a PASS-THROUGH wrapper and the arity is only visible that
 *     way: it never touches r1 at all, yet calls sub_0801C640, which reads r1
 *     and stores it. A one-parameter sub_0801C51C would be storing garbage.
 *   sub_0801C67C  re-runs sub_0801C2DC with +0x18/+0x1a forced, restoring
 *     +0x1a afterwards. void -- `pop {r4, r5}; pop {r0}`. */
u8 sub_0801C27C(struct Unk0801C210 *);
u8 sub_0801C2DC(struct Unk0801C210 *);
void sub_0801C640(struct Unk0801C210 *, void *);
void sub_0801C51C(struct Unk0801C210 *, void *);
void sub_0801C67C(struct Unk0801C210 *);
/* The 0x08028xxx block's callees.
 *   sub_080266DC(u8) -> u8   sub_080288D8 and sub_08028904 both narrow the
 *     argument to a byte (`lsls #0x18; lsrs #0x18`) off a u16 parameter and
 *     truth-test the result with `lsls r0,#0x18`.
 *   sub_080271CC(int) -> u8  INT, not u16, and sub_080289BC is what proves it:
 *     it passes a raw `int` parameter bare, where a u16 parameter would have
 *     put `lsls #0x10; lsrs #0x10` in front of the `bl`. Its other caller
 *     sub_08028990 passes an already-zero-extended u16 and so cannot see the
 *     difference. Result re-narrowed to u8 at both sites.
 *   sub_08028B70 returns `int`: sub_08028CF4 tests it with a BARE `cmp r0,#0`
 *     and then casts to u8 (`lsls #0x18; lsrs #0x18`) for sub_08019940's u8
 *     first parameter -- a narrow return would have re-narrowed before the
 *     compare instead.
 *   sub_08028BAC returns a byte (`lsls r0,#0x18; cmp r0,#0` at the one site).
 *   sub_08028A68 / sub_08028AEC / sub_08027118 / sub_08025EA0 are argument-free
 *     and result-discarded at every site in this block. */
/* Spelled `bool8` to agree textually with the promoted definition in
 * src/decomp/c_080266DC.c. `bool8` IS `u8` (include/gba/types.h:27), so this is
 * the same type either way and no caller changes -- but tools/proto_check.py
 * compares declaration TEXT and does not resolve typedefs, so the two spellings
 * read as a mismatch. Wave 30. */
bool8 sub_080266DC(u8);
u8 sub_080271CC(int);
int sub_08028B70(void);
u8 sub_08028BAC(void);
void sub_08028A68(void);
void sub_08028AEC(void);
void sub_08027118(void);
void sub_08025EA0(void);
/* sub_08028874's SECOND PARAMETER IS `int`, NOT `u8` -- corrected in wave 30
 * from the caller, which is the only place it is visible. sub_08028894 saves
 * both of its own `int` parameters with bare `adds rN, rM, #0`, builds
 * SEPARATE u16-narrowed copies for its sub_08028848 call, and then passes the
 * RAW originals to sub_08028874 with no narrowing at all. A `u8` parameter
 * there emits `lsls #0x18; lsrs #0x18` in front of that `bl`; a `u16` one emits
 * `lsls #0x10; lsrs #0x10`. Neither is in the ROM. The already-promoted
 * definition in src/decomp/c_08028874.c could not see this: its only use of the
 * value is a `strb` into a u8 struct member, which is byte-identical for every
 * width, so the definition is the weaker evidence here. Retyped and re-matched
 * with try_match. */
void sub_08028874(int, int);
void sub_08028894(int, int);
u8 sub_080288D8(u16);
u8 sub_08028904(u16);
u8 sub_08028990(u16);
u8 sub_080289BC(int);
void sub_08028568(void);
void sub_08028168(void);
/* sub_080276D0 / sub_080276F0 are the 0 and 1 halves of one two-line body;
 * sub_08027844 / sub_08027A08 are the 0x10 and 4 halves of another. All four
 * are argument-free and end `pop {r0}` / `pop {r4}; pop {r0}`, i.e. void.
 * sub_08027FBC's second and third parameters are u16: each is used as
 * `lsls #0x10; lsrs #0xc`, which is PROMOTE_MODE's zero-extension FUSED by
 * combine with a `* 0x10` -- three instructions collapsed to two, and a shape
 * an `int` parameter cannot produce. */
void sub_080276D0(void);
void sub_080276F0(void);
void sub_08027844(void);
void sub_08027A08(void);
void sub_08027FBC(void *, u16, u16);
/* The 0x08005xxx menu block. sub_08005838 and sub_080059B4 take THREE
 * arguments and read only the third, which arrives `lsls #0x18; lsrs #0x18`,
 * i.e. a `u8` parameter under PROMOTE_MODE. The first two are dead in both
 * bodies, so `int` is the weakest model for them and not a measurement. */
void sub_08005154(void);
void sub_0800517C(void);
void sub_0800518C(void);
void sub_08005580(void);
void sub_08005838(int, int, u8);
void sub_080059B4(int, int, u8);
void sub_08005D14(void);
void sub_08005EF0(int);
void sub_080145BC(void);
/* The gUnknown_03000050 arena's allocate / free pair, one level below
 * sub_08014E44 / sub_08014ED4. Each takes the arena handle in r0 -- its
 * `!= -1` gate is in the caller, not here -- and the caller's own argument
 * untouched in r1. sub_08014DCC's result is what sub_08014E44 returns, so
 * `void *`; sub_08014ED4 discards sub_08014E68's and ends `pop {r0}`. */
void *sub_08014DCC(int, int);
void sub_08014E68(int, void *);
/* Never declared here before wave 30, though both have matched definitions in
 * src/decomp/ -- these two lines just publish what those files already say
 * (c_08014D7C.c, c_08028848.c), so that sub_08014DA8 and sub_08028894 can call
 * them without an implicit declaration. */
int sub_08014D7C(void *, u32);
void sub_08028848(u16, u16);
/* sub_080281D8 parks its second argument in the slot's +0x18 and sub_08028190
 * is what consumes it -- `ldr r0,[r0,#0x18]`, skip if zero, hand to
 * sub_080196F4(void *). That shared displacement on a sub_080152EC slot is why
 * the parameter is `struct Unk03001470 *` and not a Proc. */
void sub_08028190(struct Unk03001470 *);
/* Already MATCHED as src/decomp/c_0804360C.c and simply never declared here;
 * sub_080276D0 / sub_080276F0 need it. Its argument is the same
 * gUnknown_08090A98 element they have just stored into
 * gUnknown_03003130.unk04 -- r0 still holds it at the `bl`. */
void sub_0804360C(int);
/* Wave 30, W30-B extension work.
 * sub_08022DD4's three parameters are s16. Its own prologue zero-extends the
 * first two (PROMOTE_MODE, which says nothing about signedness) and every use
 * inside re-narrows with `lsls #0x10; asrs #0x10`, including the third, which
 * is the switch selector. Its only caller sub_080230C4 forwards three
 * sign-extended values and nothing else in the ROM sees it.
 * sub_080230DC takes FIVE, and the last two are OUT parameters: `push` saves
 * four registers plus lr, so `ldr r0, [sp, #0x14]` is argument 5, and both it
 * and r3 are written with `strh` and never read. Its THIRD parameter is dead --
 * r2 is overwritten by a pool `ldr` before any read -- but sub_0802323C
 * materialises it, so it is declared. */
void sub_08022DD4(s16, s16, s16);
void sub_080230C4(s16, s16, s16);
void sub_080230DC(s16, s16, s16, s16 *, s16 *);
void sub_08049FB0(void);
void sub_08049FD4(void);
void sub_08049EB4(void);
void sub_08049B80(void);
/* Wave 30, W30-D. THREE parameters on CALLER-side evidence, which is the only
 * evidence there is: sub_080030BC's own body reads r0 only (r5 = r0, and r1/r2
 * are clobbered by a pool `ldr` before any read), but its sole caller
 * sub_08003088 materialises r1 and r2 from saved registers before each of its
 * four `bl`s. A body that ignores its later arguments is ordinary; the call
 * site is the stronger evidence. void because sub_080030BC tail-calls
 * sub_080032EC and sub_08003088 discards r0. */
void sub_080030BC(int, int, int);
/* Wave 30, W30-D. Five parameters, all typed from sub_080487B4's OWN prologue,
 * which narrows every one of them: r0 and r1 with `lsls #0x18; lsrs #0x18`
 * (u8), r3 and the stack argument at [sp, #0x28] with `lsls #0x10; lsrs #0x10`
 * (u16). r2 is kept whole and used as the base of `adds r1, r7, r1` after the
 * index is scaled `lsls #1`, so it is a halfword pointer -- and sub_0804931C
 * passes gUnknown_08499578, which is already declared `u16 *`. The stack slot
 * is argument five: `push {r4,r5,r6,r7,lr}` + `push {r5,r6,r7}` + `sub sp,#8`
 * is exactly 0x28. Return unused at all three call sites. */
void sub_080487B4(u8, u8, u16 *, u16, u16);
/* Wave 30, W30-D. Three callees of the 0x08075/0x08087 blocks that had no
 * declaration. sub_08085F40 and sub_0803D960 are already PROMOTED
 * (src/decomp/c_08085F40.c, src/decomp/c_0803D960.c) and these two lines just
 * publish the signatures those definitions already have -- sub_0803D960's
 * parameter is the Proc_StartBlocking parent it forwards.
 * sub_08075904 takes an index it scales by 0x30 (`lsls #1; adds; lsls #4`,
 * i.e. a 3<<4-byte record) into gUnknown_08615194 + 0xc, and returns: one arm
 * is a bare `movs r0, #0`. Its two callers both discard the result, so `int`
 * is the widest thing the body supports and nothing narrows it. */
int sub_08075904(int);
void sub_080879A0(void);
void sub_08085F40(void);
void sub_0803D960(ProcPtr);

#endif // UNKNOWN_FUNCS_H
