	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08073974
sub_08073974: @ 0x08073974
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #0x9f
	bhi _08073992
	cmp r4, #0
	bge _08073982
	movs r4, #0
_08073982:
	cmp r4, #0xf0
	ble _08073988
	movs r4, #0xf0
_08073988:
	lsls r0, r1, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r3
	strh r4, [r0]
_08073992:
	pop {r4}
	pop {r0}
	bx r0

