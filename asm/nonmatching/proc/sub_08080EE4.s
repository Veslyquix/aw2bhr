	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08080EE4
sub_08080EE4: @ 0x08080EE4
	push {lr}
	ldr r0, _08080EF4 @ =gUnknown_03005970
	ldr r0, [r0]
	bl sub_08043E18
	pop {r0}
	bx r0
	.align 2, 0
_08080EF4: .4byte gUnknown_03005970

