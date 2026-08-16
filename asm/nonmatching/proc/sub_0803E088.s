	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803E088
sub_0803E088: @ 0x0803E088
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r6, [sp, #0x1c]
	ldr r4, [sp, #0x20]
	str r4, [sp, #4]
	ldr r4, [sp, #0x28]
	ldr r5, [sp, #0x2c]
	str r6, [sp]
	bl sub_0803E01C
	add r6, sp, #0x24
	ldrb r6, [r6]
	strb r6, [r0, #5]
	lsls r5, r5, #6
	ldrb r2, [r0, #3]
	movs r1, #0x3f
	ands r1, r2
	orrs r1, r5
	movs r2, #0xf
	ands r4, r2
	lsls r4, r4, #2
	movs r2, #0x3d
	rsbs r2, r2, #0
	ands r1, r2
	orrs r1, r4
	strb r1, [r0, #3]
	add r7, sp, #0x24
	ldrb r7, [r7]
	strb r7, [r0, #6]
	add r1, sp, #0x30
	ldrb r1, [r1]
	strb r1, [r0, #7]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

