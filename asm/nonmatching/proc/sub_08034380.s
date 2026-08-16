	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034380
sub_08034380: @ 0x08034380
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x13
	bhi _08034390
	movs r0, #1
	b _08034392
_08034390:
	movs r0, #0
_08034392:
	bx lr

