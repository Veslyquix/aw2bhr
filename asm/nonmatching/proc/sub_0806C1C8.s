	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806C1C8
sub_0806C1C8: @ 0x0806C1C8
	push {lr}
	sub sp, #4
	ldr r1, [r0, #0x2c]
	ldr r3, [r0, #0x54]
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	bl PutSprite
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0

