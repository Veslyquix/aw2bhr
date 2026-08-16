	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08040590
sub_08040590: @ 0x08040590
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	lsls r0, r0, #4
	adds r0, #8
	str r0, [r4, #0x54]
	ldr r0, [r4, #0x30]
	lsls r0, r0, #4
	adds r0, #0x10
	str r0, [r4, #0x58]
	ldr r0, _080405D0 @ =gUnknown_08499590
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	adds r1, r4, #0
	adds r1, #0x66
	strh r0, [r1]
	ldr r0, _080405D4 @ =gUnknown_08111D94
	movs r1, #1
	movs r2, #1
	bl sub_0801C210
	str r0, [r4, #0x50]
	movs r1, #2
	bl sub_0801C4D4
	ldr r1, [r4, #0x50]
	adds r4, #0x4a
	ldrh r0, [r4]
	strh r0, [r1, #0x22]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080405D0: .4byte gUnknown_08499590
_080405D4: .4byte gUnknown_08111D94

