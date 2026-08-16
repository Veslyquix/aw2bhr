	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806A444
sub_0806A444: @ 0x0806A444
	push {lr}
	ldr r0, _0806A450 @ =gUnknown_08580F24
	bl sub_08067504
	pop {r0}
	bx r0
	.align 2, 0
_0806A450: .4byte gUnknown_08580F24

