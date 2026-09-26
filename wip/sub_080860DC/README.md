# sub_080860DC

0x080860DC, 1452 bytes, THUMB, parked.

Best score so far: 98.9% (best.c).

## Files

- `sub_080860DC.c`: the current draft
- `best.c`: the closest attempt, when it is not the draft
- `NOTES.md`: working notes
- `target.s`: the original assembly

## What has been tried

From `data/parked.json`.

### Best so far

WAVE 79 (W79-E) RE-MEASURED BY EXIT CODE: exact 1452/1452, 98.8%, 18 differing bytes, first difference +0x298. Unchanged from wave 74. W83-B: decoded the residual window from the ROM listing without spending a probe -- at each clamp site agbcc loads the gUnknown_02027F74 byte through a FRESH pc-relative word plus `adds #55` (not a folded displacement and not the hoisted force-addr slot), while the clamped halfword object is reached through a POINTER VALUE loaded from the arm-resident register, and the window registers stay unk37=r1 / cursor-byte=r3 / val-ptr=r2 in BOTH arms; the candidate hands unk37 a callee-saved slot in both, which is where the asymmetry-between-arms lever must bite. Not yet measured.

### What still differs

Of the 18 bytes, FOUR are the addend bytes of relocation-equivalent -fforce-addr words (this unit emits its own .rodata block holding the same five addresses in the same order as the ROM's gUnknown_081D9410/9414/9418/941C/9420; promote.py carves it out of data/rodata.s) and are NOT residual. The true residual is the six-instruction window duplicated in the 0x220 and 0x110 arms: ROM `ldrb r3,[r0]; str r3,[r5,#0x5c]; ... ldrb r1,[r0]; ldrh r0,[r2]; cmp r0,r1; bls; strh r1,[r2]; ldrh r0,[r2]; adds r0,r3,r0`, where the array byte wins r3 and gUnknown_02027F74.unk37 gets r1. The candidate gives the byte r1 and unk37 r4 in the first arm, and (thanks to the wave-74 split) the byte r3 but unk37 still r4 and the reload through r1 in the second. THE ROM'S TWO COPIES OF THE WINDOW ARE BYTE-IDENTICAL TO EACH OTHER; THE CANDIDATE'S TWO ARE NOT.

### Why it is close

Wave 74 improved 19 to 18 differences with a valid second-arm live-range split; every structural choice is settled.

### Already ruled out

- Narrow byte bindings and first-reference/scope probes did not close the allocation.
- A clean 3344-iteration --current permuter run found nothing better.
- WAVE 79 (W79-E): binding the array byte to a FRESH int local in BOTH arms -- `bb = gUnknown_03005990[gUnknown_0300596C]; p->unk5c = bb; ...; p->unk58 = bb + gUnknown_03005980;` -- which was the one form the wave-74 note left open (it ruled out binding 'through EXISTING int locals', and wave 37's chapter says the binding lever needs a NEW local). IT IS BYTE-NEUTRAL: gcc already CSEs the stored value, so the window does not move at all. Measured 19 of 1452 rather than 18, and the extra byte is purely the loss of the wave-74 second-arm split that the symmetric spelling removes. The draft was restored and re-verified at 98.8% / 18.
- W81-B, three new ruled-out axes on the same window: (1) transferring the wave-74 live-range split into the 0x220 arm so both arms carry it symmetrically = 1452/1452 at 98.7% / 19 bytes, one WORSE (the split does not transfer); (2) a block-scoped pointer temp `u8 *pb; pb = &gUnknown_02027F74.unk37;` in the 0x110 arm only = +8 bytes, 26.1%, first difference +0xa -- the per-block u8 * local reshuffles global allocation far outside its own arm; (3) moving `p->unk5c = gUnknown_03005990[...]` below the clamp in both arms = 94.0% / 87 bytes -- the reorder breaks the ROM's array-byte liveness shape entirely.

### Settled

- Preserve multiplication for the narrow member, u16 store spelling, duplicated tails and the retained second-arm split.
- WAVE 79: classified NO-CONSTRUCT under the wave-77 discriminator. The array byte and unk37 are already distinct pseudos with the ROM's live ranges and the ROM's statement order; nothing in the source changes the SET of pseudos, only which of two free registers each is handed. Reload/allocation pick, not a construct.

### Why it is parked

Wave 74 W74-E, re-confirmed wave 79 W79-E. Resume only with a new allocator-priority mechanism. Four of the 18 bytes are relocation-equivalent and must not be chased.

### Wave 84

WAVE 84 (W84-C): the arms-asymmetry axis is CLOSED. Ternary clamp in one arm only regresses to 77 bytes / 94.7%; fresh-bb binding arm1-only is byte-neutral at 18. Two full chained 300s runs (-j5: --current then default-from-best.c) found nothing. Remaining window: arm1 BYTE=r1/UNK37=r4 vs ROM BYTE=r3/UNK37=r1. Draft restored byte-identical.
