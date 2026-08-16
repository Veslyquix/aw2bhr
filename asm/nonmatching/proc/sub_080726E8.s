	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080726E8
sub_080726E8: @ 0x080726E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	adds r7, r1, #0
	mov sl, r2
	ldr r0, [sp, #0x28]
	mov ip, r0
	ldr r0, [sp, #0x34]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sb, r3
	lsls r0, r0, #0x18
	ldr r1, [sp, #0x30]
	str r1, [sp, #4]
	cmp r0, #0
	beq _08072768
	movs r5, #0
	ldr r2, [sp, #0x2c]
	cmp r5, r2
	bge _080727B0
_08072718:
	movs r2, #0
	adds r6, r5, #1
	cmp r2, ip
	bge _0807275E
	lsls r3, r5, #6
	movs r0, #0x80
	lsls r0, r0, #3
	mov r8, r0
_08072728:
	adds r0, r7, r2
	adds r4, r2, #1
	cmp r0, #0x1f
	bhi _08072758
	mov r2, sl
	adds r1, r2, r5
	cmp r1, #0x1f
	bhi _08072758
	lsls r1, r1, #6
	lsls r0, r0, #1
	ldr r2, [sp]
	adds r0, r0, r2
	adds r1, r1, r0
	mov r2, ip
	subs r0, r2, r4
	lsls r0, r0, #1
	ldr r2, [sp, #4]
	adds r0, r0, r2
	adds r0, r3, r0
	ldrh r0, [r0]
	add r0, sb
	mov r2, r8
	eors r0, r2
	strh r0, [r1]
_08072758:
	adds r2, r4, #0
	cmp r2, ip
	blt _08072728
_0807275E:
	adds r5, r6, #0
	ldr r0, [sp, #0x2c]
	cmp r5, r0
	blt _08072718
	b _080727B0
_08072768:
	movs r5, #0
	ldr r1, [sp, #0x2c]
	cmp r5, r1
	bge _080727B0
	lsls r2, r7, #1
	mov r8, r2
_08072774:
	movs r2, #0
	adds r6, r5, #1
	cmp r2, ip
	bge _080727A8
	lsls r0, r5, #6
	ldr r1, [sp, #4]
	adds r4, r1, r0
	ldr r3, [sp]
	add r3, r8
_08072786:
	adds r0, r7, r2
	cmp r0, #0x1f
	bhi _0807279E
	mov r0, sl
	adds r1, r0, r5
	cmp r1, #0x1f
	bhi _0807279E
	lsls r1, r1, #6
	adds r1, r1, r3
	ldrh r0, [r4]
	add r0, sb
	strh r0, [r1]
_0807279E:
	adds r4, #2
	adds r3, #2
	adds r2, #1
	cmp r2, ip
	blt _08072786
_080727A8:
	adds r5, r6, #0
	ldr r1, [sp, #0x2c]
	cmp r5, r1
	blt _08072774
_080727B0:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

