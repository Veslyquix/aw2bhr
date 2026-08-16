	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807286C
sub_0807286C: @ 0x0807286C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp]
	mov sl, r1
	str r2, [sp, #4]
	ldr r0, [sp, #0x30]
	mov r8, r0
	ldr r5, [sp, #0x3c]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp, #8]
	ldr r6, [sp, #0x38]
	ldrb r0, [r6]
	adds r0, #1
	mov sb, r0
	adds r6, #2
	mov r1, r8
	bl Div
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r4, #0
	muls r1, r0, r1
	subs r5, r5, r1
	mov r1, r8
	muls r1, r5, r1
	lsls r1, r1, #1
	adds r1, r6, r1
	ldr r2, [sp, #0x34]
	muls r0, r2, r0
	lsls r0, r0, #6
	adds r6, r1, r0
	movs r5, #0
	cmp r5, r2
	bge _08072912
	mov r7, sl
	lsls r7, r7, #1
	mov ip, r7
_080728C6:
	movs r4, #0
	adds r0, r5, #1
	str r0, [sp, #0xc]
	cmp r4, r8
	bge _0807290A
	ldr r1, [sp, #0x34]
	subs r0, r1, r5
	subs r0, #1
	mov r2, sb
	muls r2, r0, r2
	adds r0, r2, #0
	lsls r0, r0, #1
	adds r3, r6, r0
	ldr r2, [sp]
	add r2, ip
_080728E4:
	mov r7, sl
	adds r0, r7, r4
	cmp r0, #0x1f
	bhi _08072900
	ldr r0, [sp, #4]
	adds r1, r0, r5
	cmp r1, #0x1f
	bhi _08072900
	lsls r1, r1, #6
	adds r1, r1, r2
	ldrh r0, [r3]
	ldr r7, [sp, #8]
	adds r0, r7, r0
	strh r0, [r1]
_08072900:
	adds r3, #2
	adds r2, #2
	adds r4, #1
	cmp r4, r8
	blt _080728E4
_0807290A:
	ldr r5, [sp, #0xc]
	ldr r0, [sp, #0x34]
	cmp r5, r0
	blt _080728C6
_08072912:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

