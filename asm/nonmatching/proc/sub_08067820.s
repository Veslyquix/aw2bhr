	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08067820
sub_08067820: @ 0x08067820
	push {lr}
	ldr r0, _0806782C @ =gUnknown_08580FE4
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0806782C: .4byte gUnknown_08580FE4

