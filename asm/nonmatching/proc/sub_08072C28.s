	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072C28
sub_08072C28: @ 0x08072C28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r3, #0
	cmp r3, r1
	bhs _08072C3C
_08072C32:
	strh r2, [r0]
	adds r0, #2
	adds r3, #1
	cmp r3, r1
	blo _08072C32
_08072C3C:
	bx lr
	.align 2, 0

