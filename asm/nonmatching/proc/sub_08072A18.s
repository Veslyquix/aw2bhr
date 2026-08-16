	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072A18
sub_08072A18: @ 0x08072A18
	push {r4, lr}
	adds r4, r0, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	cmp r2, #0
	ble _08072A34
_08072A24:
	ldrh r0, [r4]
	adds r0, r3, r0
	strh r0, [r1]
	adds r4, #2
	adds r1, #2
	subs r2, #2
	cmp r2, #0
	bgt _08072A24
_08072A34:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

