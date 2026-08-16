	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078260
sub_08078260: @ 0x08078260
	movs r2, #0x31
	adds r1, r0, #6
_08078264:
	strh r2, [r1]
	subs r2, #1
	subs r1, #2
	cmp r1, r0
	bge _08078264
	bx lr

