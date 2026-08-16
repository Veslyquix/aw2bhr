	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803E260
sub_0803E260: @ 0x0803E260
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x1c
	adds r4, r0, #0
	adds r5, r1, #0
	mov r8, r2
	mov sb, r3
	ldr r7, [sp, #0x38]
	add r6, sp, #0x18
	movs r0, #4
	adds r1, r6, #0
	bl sub_0803DF98
	add r0, sp, #0x18
	ldrh r0, [r0]
	subs r4, r4, r0
	ldrh r0, [r6, #2]
	subs r5, r5, r0
	movs r0, #4
	str r0, [sp]
	movs r0, #0x63
	str r0, [sp, #4]
	mov r0, r8
	str r0, [sp, #8]
	mov r0, sb
	str r0, [sp, #0xc]
	str r7, [sp, #0x10]
	movs r0, #0x1e
	str r0, [sp, #0x14]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #1
	bl sub_0803E088
	add sp, #0x1c
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

