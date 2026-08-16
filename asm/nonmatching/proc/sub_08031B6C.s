	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08031B6C
sub_08031B6C: @ 0x08031B6C
	adds r2, r0, #0
	movs r3, #0x10
_08031B70:
	ldrb r0, [r1]
	strb r0, [r2]
	adds r1, #1
	adds r2, #1
	subs r3, #1
	cmp r3, #0
	bgt _08031B70
	movs r0, #0
	strb r0, [r2]
	bx lr

