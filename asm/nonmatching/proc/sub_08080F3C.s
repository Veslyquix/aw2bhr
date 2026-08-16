	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08080F3C
sub_08080F3C: @ 0x08080F3C
	ldr r1, _08080F4C @ =gUnknown_03005924
	movs r0, #6
	str r0, [r1]
	ldr r1, _08080F50 @ =gUnknown_030058FC
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_08080F4C: .4byte gUnknown_03005924
_08080F50: .4byte gUnknown_030058FC

