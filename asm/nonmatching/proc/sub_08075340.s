	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08075340
sub_08075340: @ 0x08075340
	push {lr}
	ldr r2, _08075360 @ =gUnknown_081D1624
	movs r1, #0x1f
	ands r1, r0
	asrs r1, r1, #1
	ldr r0, _08075364 @ =gPal
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r1, [r1]
	adds r0, #0xb2
	strh r1, [r0]
	bl sub_080135A4
	pop {r0}
	bx r0
	.align 2, 0
_08075360: .4byte gUnknown_081D1624
_08075364: .4byte gPal

