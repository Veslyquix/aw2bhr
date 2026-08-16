	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B578
sub_0803B578: @ 0x0803B578
	push {lr}
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl sub_0803B524
	pop {r0}
	bx r0

