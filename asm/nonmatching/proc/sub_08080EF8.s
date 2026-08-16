	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08080EF8
sub_08080EF8: @ 0x08080EF8
	push {lr}
	ldr r0, _08080F08 @ =gUnknown_03005970
	ldr r0, [r0]
	bl sub_08043DF4
	pop {r0}
	bx r0
	.align 2, 0
_08080F08: .4byte gUnknown_03005970

