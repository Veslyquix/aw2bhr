#include "global.h"

bool8 sub_08018100(s16 a)
{
    if (gUnknown_03002514 != 1)
    {
        gUnknown_03002F08.unk02 = gUnknown_0200C528[a].unk04->unk08;
        sub_0801815C(gUnknown_03002F08.unk02);
    }
    gUnknown_0200C528[a].unk04++;
    return FALSE;
}
/* WAVE 86 (W86-C): hypothesis REFUTED FROM THE ROM, no source lever found.
 * See work/sub_08018100/W86-notes.md.
 *
 * The wave-86 brief hypothesised that the parameter has two homes because the
 * narrowed value is coalesced with the CALL-ARGUMENT copy (r1 = the callee's
 * second argument register). It is not. `sub_0801815C` takes ONE u8 argument
 * and the ROM passes it in r0 -- the halfword just stored to
 * gUnknown_03002F08+2, re-narrowed: `ldrh r0,[r0,#8] / strh r0,[r3,#2] /
 * lsls r0,#0x18 / lsrs r0,#0x18 / bl`. Nothing anywhere sets r1 from r5; r1
 * at the `bl` is dead leftover from the index computation. The draft's
 * `sub_0801815C(gUnknown_03002F08.unk02)` is correct.
 *
 * The matched twin sub_08018464 is the control and it points the other way:
 * ITS ROM carries the same two homes this candidate produces
 * (`lsrs r1,r0,#0x10 ; adds r4,r1,#0`, r1 read before the call and r4 after).
 * So the copy is ordinary ROM output; sub_08018100's single home is the
 * anomaly. Probe: a narrow parameter used ONLY after a call gives
 * `adds r4,r0,#0 ; lsls r4,#0x10 ; lsrs r4,#0x10` -- copy first, narrow in
 * place -- so agbcc has no configuration that narrows straight into the
 * callee-saved home. With wave 32's seven spellings and waves 81/82's seven
 * profiles, this stays a bare allocation residual with no source construct
 * behind it. Do not re-batch it on the parked-high-score axis: 22.8% is low
 * only because the divergence is at +0x06. */
