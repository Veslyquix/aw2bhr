	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080727C0
sub_080727C0: @ 0x080727C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	mov sb, r1
	str r2, [sp, #4]
	ldr r7, [sp, #0x28]
	ldr r5, [sp, #0x34]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sl, r3
	ldr r0, [sp, #0x30]
	mov r8, r0
	movs r0, #0x20
	adds r1, r7, #0
	bl Div
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl DivRem
	adds r1, r7, #0
	muls r1, r0, r1
	lsls r1, r1, #1
	add r1, r8
	ldr r2, [sp, #0x2c]
	adds r0, r6, #0
	muls r0, r2, r0
	lsls r0, r0, #6
	adds r1, r1, r0
	mov r8, r1
	movs r5, #0
	cmp r5, r2
	bge _0807285A
	mov r0, sb
	lsls r0, r0, #1
	mov ip, r0
_0807281C:
	movs r4, #0
	adds r6, r5, #1
	cmp r4, r7
	bge _08072852
	lsls r0, r5, #6
	mov r1, r8
	adds r3, r1, r0
	ldr r2, [sp]
	add r2, ip
_0807282E:
	mov r1, sb
	adds r0, r1, r4
	cmp r0, #0x1f
	bhi _08072848
	ldr r0, [sp, #4]
	adds r1, r0, r5
	cmp r1, #0x1f
	bhi _08072848
	lsls r1, r1, #6
	adds r1, r1, r2
	ldrh r0, [r3]
	add r0, sl
	strh r0, [r1]
_08072848:
	adds r3, #2
	adds r2, #2
	adds r4, #1
	cmp r4, r7
	blt _0807282E
_08072852:
	adds r5, r6, #0
	ldr r1, [sp, #0x2c]
	cmp r5, r1
	blt _0807281C
_0807285A:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

