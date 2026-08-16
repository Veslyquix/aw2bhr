	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08019F50
sub_08019F50: @ 0x08019F50
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	mov r8, r0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r4, [sp, #0x1c]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	str r3, [sp, #4]
	bl sub_0801A604
	str r4, [sp]
	mov r0, r8
	adds r1, r5, #0
	adds r2, r6, #0
	ldr r3, [sp, #4]
	bl sub_08019F90
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1

