	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080846F4
sub_080846F4: @ 0x080846F4
	ldr r0, _080846FC @ =gUnknown_03005968
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080846FC: .4byte gUnknown_03005968

