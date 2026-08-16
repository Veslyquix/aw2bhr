	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080036A4
sub_080036A4: @ 0x080036A4
	push {r4, lr}
	sub sp, #4
	movs r2, #0x83
	lsls r2, r2, #3
	movs r4, #0
	str r4, [sp]
	movs r0, #0x30
	movs r1, #0x19
	movs r3, #0
	bl sub_0801F34C
	movs r2, #0x85
	lsls r2, r2, #3
	str r4, [sp]
	movs r0, #0x2f
	movs r1, #0x19
	movs r3, #0
	bl sub_0801F34C
	movs r2, #0x87
	lsls r2, r2, #3
	str r4, [sp]
	movs r0, #2
	movs r1, #0x19
	movs r3, #0
	bl sub_0801F34C
	movs r2, #0x89
	lsls r2, r2, #3
	str r4, [sp]
	movs r0, #0x34
	movs r1, #0x18
	movs r3, #0
	bl sub_0801F34C
	movs r2, #0x8b
	lsls r2, r2, #3
	str r4, [sp]
	movs r0, #0xc
	movs r1, #0x19
	movs r3, #0
	bl sub_0801F34C
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

