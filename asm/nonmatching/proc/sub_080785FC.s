	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080785FC
sub_080785FC: @ 0x080785FC
	ldr r1, _08078604 @ =gUnknown_03005944
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_08078604: .4byte gUnknown_03005944

