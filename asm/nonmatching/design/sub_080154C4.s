	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080154C4
sub_080154C4: @ 0x080154C4
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r6, sp
	adds r0, r5, #0
	mov r1, sp
	bl sub_0801566C
	movs r0, #1
	ands r4, r0
	lsls r4, r4, #4
	ldrb r1, [r6, #1]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r1
	orrs r0, r4
	strb r0, [r6, #1]
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r5, #0
	bl sub_08015608
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

