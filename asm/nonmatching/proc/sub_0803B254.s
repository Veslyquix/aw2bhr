	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B254
sub_0803B254: @ 0x0803B254
	push {lr}
	ldr r0, _0803B260 @ =gUnknown_0849E6D4
	bl sub_0801537C
	pop {r0}
	bx r0
	.align 2, 0
_0803B260: .4byte gUnknown_0849E6D4

