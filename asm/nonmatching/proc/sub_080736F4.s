	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080736F4
sub_080736F4: @ 0x080736F4
	adds r3, r0, #0
	cmp r1, #0x9f
	bhi _08073710
	cmp r3, #0
	bge _08073700
	movs r3, #0
_08073700:
	cmp r3, #0xef
	ble _08073706
	movs r3, #0xf0
_08073706:
	lsls r0, r1, #1
	adds r0, r0, r2
	movs r1, #0xff
	ands r3, r1
	strh r3, [r0]
_08073710:
	bx lr
	.align 2, 0

