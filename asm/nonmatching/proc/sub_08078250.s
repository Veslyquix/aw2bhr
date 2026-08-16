	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078250
sub_08078250: @ 0x08078250
	movs r2, #0x2c
	adds r1, r0, #6
_08078254:
	strh r2, [r1]
	subs r2, #1
	subs r1, #2
	cmp r1, r0
	bge _08078254
	bx lr

