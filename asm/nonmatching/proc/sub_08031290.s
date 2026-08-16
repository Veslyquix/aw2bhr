	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08031290
sub_08031290: @ 0x08031290
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	movs r0, #0x4f
	movs r1, #0x8c
	movs r2, #0x70
	movs r3, #0
	bl sub_0801F34C
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0

