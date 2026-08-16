	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800376C
sub_0800376C: @ 0x0800376C
	push {r4, lr}
	sub sp, #4
	movs r2, #0x84
	lsls r2, r2, #3
	movs r4, #0
	str r4, [sp]
	movs r0, #0x31
	movs r1, #0x18
	movs r3, #0
	bl sub_0801F34C
	movs r2, #0x86
	lsls r2, r2, #3
	str r4, [sp]
	movs r0, #0x32
	movs r1, #0x18
	movs r3, #0
	bl sub_0801F34C
	movs r2, #0x88
	lsls r2, r2, #3
	str r4, [sp]
	movs r0, #0x33
	movs r1, #0x18
	movs r3, #0
	bl sub_0801F34C
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

