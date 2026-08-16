	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078558
sub_08078558: @ 0x08078558
	push {lr}
	ldr r1, [r0, #0x2c]
	ldr r2, [r0, #0x30]
	movs r3, #1
	bl sub_08074C84
	pop {r0}
	bx r0

