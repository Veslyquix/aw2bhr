	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08037A78
sub_08037A78: @ 0x08037A78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp]
	movs r0, #0
	ldr r2, _08037B64 @ =gUnknown_08499590
	ldr r1, [r2]
	ldrh r3, [r1, #2]
	cmp r0, r3
	bge _08037B54
	str r1, [sp, #0xc]
	ldr r4, _08037B68 @ =gUnknown_0849D534
	mov sb, r4
_08037A98:
	movs r7, #0
	adds r5, r0, #1
	str r5, [sp, #0x10]
	ldr r1, [sp, #0xc]
	ldrh r1, [r1]
	cmp r7, r1
	bge _08037B4A
	ldr r2, _08037B64 @ =gUnknown_08499590
	ldr r2, [r2]
	mov ip, r2
	lsls r0, r0, #1
	mov sl, r0
	mov r3, ip
	adds r3, #0x12
	str r3, [sp, #8]
	ldr r0, _08037B6C @ =0x0000417A
	add r0, ip
	add r0, sl
	str r0, [sp, #4]
	ldr r4, _08037B70 @ =gUnknown_03004010
	mov r8, r4
_08037AC2:
	ldr r5, [sp, #4]
	ldrh r0, [r5]
	adds r0, r0, r7
	ldr r1, [sp, #8]
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08037B3C
	lsrs r0, r0, #6
	adds r0, #1
	ldr r2, _08037B74 @ =gUnknown_030040F8
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r0, #0x12
	lsls r0, r0, #1
	ldr r3, _08037B78 @ =gUnknown_08582E74
	adds r0, r0, r3
	ldrh r6, [r0]
	lsls r6, r6, #1
	ldr r4, _08037B7C @ =gUnknown_080A0F38
	adds r6, r6, r4
	mov r5, r8
	ldrh r1, [r5]
	lsls r1, r1, #1
	ldr r0, [sp]
	adds r1, r0, r1
	ldr r0, _08037B80 @ =gUnknown_030032E0
	add r0, sl
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	mov r3, sb
	ldrh r2, [r3]
	ands r2, r0
	strh r2, [r1]
	ldrh r0, [r1, #4]
	ldrh r3, [r3, #2]
	ands r3, r0
	strh r3, [r1, #4]
	ldrh r0, [r1, #8]
	mov r5, sb
	ldrh r4, [r5, #4]
	ands r4, r0
	strh r4, [r1, #8]
	ldrh r5, [r5, #6]
	ldrh r0, [r1, #0xc]
	ands r5, r0
	strh r5, [r1, #0xc]
	ldrh r0, [r6]
	orrs r2, r0
	strh r2, [r1]
	ldrh r0, [r6, #4]
	orrs r3, r0
	strh r3, [r1, #4]
	ldrh r0, [r6, #8]
	orrs r4, r0
	strh r4, [r1, #8]
	ldrh r0, [r6, #0xc]
	orrs r5, r0
	strh r5, [r1, #0xc]
_08037B3C:
	movs r1, #2
	add r8, r1
	adds r7, #1
	mov r2, ip
	ldrh r2, [r2]
	cmp r7, r2
	blt _08037AC2
_08037B4A:
	ldr r0, [sp, #0x10]
	ldr r3, [sp, #0xc]
	ldrh r3, [r3, #2]
	cmp r0, r3
	blt _08037A98
_08037B54:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037B64: .4byte gUnknown_08499590
_08037B68: .4byte gUnknown_0849D534
_08037B6C: .4byte 0x0000417A
_08037B70: .4byte gUnknown_03004010
_08037B74: .4byte gUnknown_030040F8
_08037B78: .4byte gUnknown_08582E74
_08037B7C: .4byte gUnknown_080A0F38
_08037B80: .4byte gUnknown_030032E0

