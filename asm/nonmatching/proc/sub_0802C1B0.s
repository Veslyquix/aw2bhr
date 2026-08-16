	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C1B0
sub_0802C1B0: @ 0x0802C1B0
	push {lr}
	ldr r0, _0802C1BC @ =gUnknown_0849A5E0
	bl sub_080193B0
	pop {r0}
	bx r0
	.align 2, 0
_0802C1BC: .4byte gUnknown_0849A5E0

