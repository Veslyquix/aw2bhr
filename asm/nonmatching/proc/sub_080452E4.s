	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080452E4
sub_080452E4: @ 0x080452E4
	push {lr}
	movs r1, #0x3c
	ldrsh r2, [r0, r1]
	ldr r1, [r0, #0x40]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r2, #0
	bl sub_08029088
	pop {r0}
	bx r0
	.align 2, 0

