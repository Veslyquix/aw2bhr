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

void sub_080135A4(void);
void ApplyPaletteExt(u16 *, u32, u32);
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
 * narrowing; fix it with the parameter rather than on its own. */
void sub_080152C0(s32, u8);
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
void sub_0803B5A4(s16);
void sub_0803B5E8(void);

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
void sub_08072C40(u32, u16, u32);
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
 * `movs`-sized literal and that is byte-identical for every integer type. */
int sub_0801F024(void *, int);

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
/* Continuation callbacks handed to sub_08015928 as a bare pool word by
 * sub_0804D928 and sub_0804E3B4. Only the symbol's address is used, so the
 * signature is not recoverable from the call site; both are themselves members
 * of the same setter family and take no arguments there. Declared `void(void)`
 * so `(u32)` casts of them compile. */
void sub_0804DA40(void);
void sub_0804E4CC(void);

#endif // UNKNOWN_FUNCS_H