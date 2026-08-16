	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08057D90
sub_08057D90: @ 0x08057D90
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r1, #0
	str r1, [sp, #0x10]
	ldr r6, _08057EA0 @ =gUnknown_08499590
	ldr r0, [r6]
	ldr r2, _08057EA4 @ =0x00002D5A
	adds r0, r0, r2
	bl sub_0801F92C
	ldr r3, _08057EA8 @ =gUnknown_030013EC
	ldr r4, [sp, #4]
	movs r1, #0
	ldrsh r0, [r4, r1]
	ldr r2, [sp, #8]
	movs r4, #0
	ldrsh r1, [r2, r4]
	ldr r5, _08057EAC @ =gUnknown_030040D8
	ldr r2, [r5]
	ldrb r2, [r2]
	ldr r4, [sp, #0x10]
	str r4, [sp]
	ldr r4, [r3]
	movs r3, #0x78
	bl _call_via_r4
	ldr r0, [r6]
	ldr r1, _08057EB0 @ =0x00002852
	adds r0, r0, r1
	bl sub_0801F92C
	ldr r0, [r5]
	bl sub_080202A4
	ldr r2, _08057EB4 @ =0x00007FFF
	mov sb, r2
	movs r3, #0
	ldr r0, [r6]
	ldrh r1, [r0, #2]
	ldr r4, [sp, #0x10]
	cmp r4, r1
	bge _08057E80
	mov sl, r6
	ldrh r0, [r0]
	str r0, [sp, #0x18]
	str r1, [sp, #0x14]
_08057DFC:
	movs r2, #0
	lsls r5, r3, #0x10
	ldr r0, [sp, #0x18]
	cmp r2, r0
	bge _08057E70
	mov r8, r5
	asrs r0, r5, #0x10
	lsls r1, r0, #2
	ldr r3, _08057EB8 @ =gUnknown_03003340
	adds r1, r1, r3
	ldr r1, [r1]
	mov ip, r1
	lsls r7, r0, #1
	mov r4, sl
	ldr r0, [r4]
	ldrh r6, [r0]
_08057E1C:
	lsls r0, r2, #0x10
	asrs r3, r0, #0x10
	mov r2, ip
	adds r1, r2, r3
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r4, r0, #0
	cmp r1, #0
	blt _08057E62
	mov r0, sl
	ldr r2, [r0]
	ldr r1, _08057EBC @ =0x0000417A
	adds r0, r2, r1
	adds r0, r0, r7
	ldrh r0, [r0]
	adds r1, r0, r3
	adds r0, r2, #0
	adds r0, #0x12
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08057E62
	ldr r3, _08057EA4 @ =0x00002D5A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, sb
	bgt _08057E62
	mov sb, r0
	lsrs r0, r4, #0x10
	str r0, [sp, #0xc]
	mov r1, r8
	lsrs r1, r1, #0x10
	str r1, [sp, #0x10]
_08057E62:
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r4, r2
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r6
	blt _08057E1C
_08057E70:
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r5, r3
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	ldr r4, [sp, #0x14]
	cmp r0, r4
	blt _08057DFC
_08057E80:
	mov r0, sp
	ldrh r1, [r0, #0xc]
	ldr r0, [sp, #4]
	strh r1, [r0]
	mov r2, sp
	ldrh r3, [r2, #0x10]
	ldr r2, [sp, #8]
	strh r3, [r2]
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057EA0: .4byte gUnknown_08499590
_08057EA4: .4byte 0x00002D5A
_08057EA8: .4byte gUnknown_030013EC
_08057EAC: .4byte gUnknown_030040D8
_08057EB0: .4byte 0x00002852
_08057EB4: .4byte 0x00007FFF
_08057EB8: .4byte gUnknown_03003340
_08057EBC: .4byte 0x0000417A

