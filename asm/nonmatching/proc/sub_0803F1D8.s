	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803F1D8
sub_0803F1D8: @ 0x0803F1D8
	push {lr}
	adds r1, r0, #0
	adds r1, #0x64
	movs r3, #0
	ldrsh r2, [r1, r3]
	adds r0, #0x66
	movs r3, #0
	ldrsh r1, [r0, r3]
	adds r0, r2, #0
	bl sub_08029088
	pop {r0}
	bx r0
	.align 2, 0

