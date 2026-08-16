	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B9B8
sub_0803B9B8: @ 0x0803B9B8
	push {lr}
	ldr r1, _0803B9D0 @ =gUnknown_03003FC0
	movs r0, #5
	strb r0, [r1, #1]
	bl sub_0803B5E8
	movs r0, #0
	bl sub_08001038
	pop {r0}
	bx r0
	.align 2, 0
_0803B9D0: .4byte gUnknown_03003FC0

