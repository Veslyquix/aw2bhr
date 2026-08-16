	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080409B4
sub_080409B4: @ 0x080409B4
	push {lr}
	adds r2, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r2, #0
	adds r1, #0x66
	movs r3, #0
	ldrsh r1, [r1, r3]
	bl sub_08040380
	pop {r0}
	bx r0
	.align 2, 0

