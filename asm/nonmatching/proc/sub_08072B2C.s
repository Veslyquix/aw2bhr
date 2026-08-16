	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072B2C
sub_08072B2C: @ 0x08072B2C
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	bge _08072B3A
	movs r0, #0x60
	rsbs r0, r0, #0
	b _08072B50
_08072B3A:
	cmp r1, #0xef
	bgt _08072B4E
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #6
	movs r1, #0xf0
	bl Div
	subs r0, #0x60
	b _08072B50
_08072B4E:
	movs r0, #0x5f
_08072B50:
	pop {r1}
	bx r1

