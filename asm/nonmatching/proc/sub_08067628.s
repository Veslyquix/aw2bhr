	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08067628
sub_08067628: @ 0x08067628
	push {lr}
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl sub_0806CC00
	pop {r0}
	bx r0

