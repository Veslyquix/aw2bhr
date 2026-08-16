	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804AE10
sub_0804AE10: @ 0x0804AE10
	push {lr}
	ldr r0, _0804AE1C @ =gUnknown_084C38BC
	bl sub_080193B0
	pop {r0}
	bx r0
	.align 2, 0
_0804AE1C: .4byte gUnknown_084C38BC

