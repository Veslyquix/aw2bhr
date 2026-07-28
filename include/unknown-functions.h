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
 * in the tree contradicts or confirms it yet. */
s8 sub_0801A168(void);

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

void sub_080152C0(s32, u8);
/* Allocates a gUnknown_03001470 slot and returns &gUnknown_03001470[i], or NULL
 * when sub_08015BD0 reports -1. Second parameter is `u8`: the prologue is
 * `lsls r1,#0x18; lsrs r1,#0x18`, which the table in docs/agbcc-codegen.md
 * gives as a narrow parameter widened for a call. Callers store a u16 through
 * the result at +0x20 (sub_08035144, sub_08042B84). 86 callers. */
struct Unk03001470 *sub_080152EC(const void *, u8);
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
/* `int` and not `u8`, even though its body is a bare `ldrb`: see the comment
 * on the definition in src/decomp/c_08042E18.c -- sub_08042DFC forwards the
 * result with no re-narrowing, which only an int-wide return produces. */
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

#endif // UNKNOWN_FUNCS_H