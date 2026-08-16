	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C280
sub_0802C280: @ 0x0802C280
	push {lr}
	ldr r0, _0802C28C @ =gUnknown_0849A8F0
	bl sub_080193B0
	pop {r0}
	bx r0
	.align 2, 0
_0802C28C: .4byte gUnknown_0849A8F0

