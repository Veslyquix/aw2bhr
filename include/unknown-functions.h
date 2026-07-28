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
void Decompress(u8 *, void *);

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

void sub_08013098(s16, ProcPtr);
void sub_080130B0(s16, ProcPtr);
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
int sub_08044374(int);

bool8 sub_0803B18C(void);
void sub_0803B4DC(s16);
void sub_0803B524(s16);
void sub_0803B5A4(s16);
void sub_0803B5E8(void);

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
void sub_08072C40(u32, u16, u32);
s32 Interpolate(s32, s32, s32, s32, s32);

s32 Div(s32, s32);

#endif // UNKNOWN_FUNCS_H