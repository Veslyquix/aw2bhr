	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C1C0
sub_0802C1C0: @ 0x0802C1C0
	push {lr}
	ldr r0, _0802C1CC @ =gUnknown_0849A6B0
	bl sub_080193B0
	pop {r0}
	bx r0
	.align 2, 0
_0802C1CC: .4byte gUnknown_0849A6B0

