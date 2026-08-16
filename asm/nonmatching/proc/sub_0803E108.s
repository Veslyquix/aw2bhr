	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803E108
sub_0803E108: @ 0x0803E108
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0x1c
	adds r4, r0, #0
	adds r5, r1, #0
	mov r8, r2
	mov sb, r3
	add r6, sp, #0x18
	movs r0, #8
	adds r1, r6, #0
	bl sub_0803DF98
	add r0, sp, #0x18
	ldrh r0, [r0]
	subs r4, r4, r0
	ldrh r0, [r6, #2]
	subs r5, r5, r0
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, r8
	mov r3, sb
	bl sub_0803E088
	add sp, #0x1c
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

