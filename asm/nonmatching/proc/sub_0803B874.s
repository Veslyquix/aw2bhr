	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B874
sub_0803B874: @ 0x0803B874
	push {lr}
	ldr r0, _0803B884 @ =sub_08034334
	ldr r1, _0803B888 @ =sub_08034338
	ldr r2, _0803B88C @ =sub_0803B83C
	bl sub_08012FB8
	pop {r0}
	bx r0
	.align 2, 0
_0803B884: .4byte sub_08034334
_0803B888: .4byte sub_08034338
_0803B88C: .4byte sub_0803B83C

