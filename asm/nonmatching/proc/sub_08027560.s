	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08027560
sub_08027560: @ 0x08027560
	push {lr}
	adds r1, r2, #0
	cmp r0, #0x7f
	ble _08027572
	adds r1, #1
	adds r0, r3, #0
	bl sub_0801C4D4
	b _08027578
_08027572:
	adds r0, r3, #0
	bl sub_0801C4D4
_08027578:
	ldr r0, _08027590 @ =gUnknown_081121D0
	ldr r1, _08027594 @ =0x06013940
	bl Decompress
	ldr r0, _08027598 @ =gUnknown_081126E4
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
_08027590: .4byte gUnknown_081121D0
_08027594: .4byte 0x06013940
_08027598: .4byte gUnknown_081126E4

