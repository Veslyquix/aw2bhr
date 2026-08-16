	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080849BC
sub_080849BC: @ 0x080849BC
	ldr r1, _080849C4 @ =gUnknown_03005940
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_080849C4: .4byte gUnknown_03005940

