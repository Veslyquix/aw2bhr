	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08032420
sub_08032420: @ 0x08032420
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0803227C
	ldr r0, _08032450 @ =gUnknown_0849B060
	ldr r2, [r0]
	movs r1, #4
	ldrsh r0, [r2, r1]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #0x13
	asrs r1, r1, #0x10
	movs r3, #6
	ldrsh r0, [r2, r3]
	lsls r2, r0, #2
	adds r2, r2, r0
	lsls r2, r2, #0x13
	asrs r2, r2, #0x10
	adds r0, r4, #0
	bl sub_08032340
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08032450: .4byte gUnknown_0849B060

