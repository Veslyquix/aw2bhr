	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08016974
sub_08016974: @ 0x08016974
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r5, sp
	adds r0, r4, #0
	mov r1, sp
	bl sub_0801566C
	ldrb r1, [r5, #1]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r5, #1]
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r4, #0
	bl sub_08015608
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0

