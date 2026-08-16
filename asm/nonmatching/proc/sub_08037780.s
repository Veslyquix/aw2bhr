	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08037780
sub_08037780: @ 0x08037780
	push {lr}
	ldr r0, _0803778C @ =sub_08037790
	bl sub_08011B5C
	pop {r0}
	bx r0
	.align 2, 0
_0803778C: .4byte sub_08037790

