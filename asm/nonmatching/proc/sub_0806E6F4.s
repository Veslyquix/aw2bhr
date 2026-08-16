	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806E6F4
sub_0806E6F4: @ 0x0806E6F4
	push {r4, r5, lr}
	sub sp, #4
	ldr r4, [r0, #0x54]
	mov r5, sp
	adds r5, #2
	mov r0, sp
	adds r1, r5, #0
	bl sub_08073F90
	ldr r2, [r4, #0x48]
	mov r1, sp
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	ldrh r1, [r1]
	adds r1, r0, r1
	strh r1, [r2, #0x3c]
	ldr r2, [r4, #0x4c]
	ldrh r5, [r5]
	adds r0, r0, r5
	strh r0, [r2, #0x3c]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

