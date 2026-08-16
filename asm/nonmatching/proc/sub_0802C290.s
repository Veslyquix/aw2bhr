	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C290
sub_0802C290: @ 0x0802C290
	push {lr}
	ldr r0, _0802C29C @ =gUnknown_0849A8F0
	bl sub_0801930C
	pop {r0}
	bx r0
	.align 2, 0
_0802C29C: .4byte gUnknown_0849A8F0

