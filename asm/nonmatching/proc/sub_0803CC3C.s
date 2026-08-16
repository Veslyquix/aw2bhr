	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803CC3C
sub_0803CC3C: @ 0x0803CC3C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r0, #0
	subs r1, #0xb4
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xb
	bhi _0803CC5E
	adds r0, r1, #0
	movs r1, #3
	bl Div
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0803CC60
_0803CC5E:
	movs r0, #1
_0803CC60:
	pop {r1}
	bx r1

