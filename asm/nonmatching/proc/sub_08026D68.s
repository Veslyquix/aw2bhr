	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08026D68
sub_08026D68: @ 0x08026D68
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _08026DB4 @ =gUnknown_08090A90
	mov sb, r0
	ldr r7, _08026DB8 @ =gUnknown_08090A94
	ldr r4, [r0]
	movs r3, #0
	movs r2, #0
	movs r6, #0x80
	movs r5, #4
_08026D80:
	ldr r0, [r4]
	adds r0, r2, r0
	str r3, [r0, #8]
	strb r3, [r0, #0xc]
	ldr r0, [r4]
	adds r0, r2, r0
	strb r3, [r0, #0xd]
	ldr r0, [r4]
	adds r0, r2, r0
	strb r3, [r0, #0xe]
	ldr r0, [r4]
	adds r0, r2, r0
	strb r3, [r0, #0xf]
	ldr r1, [r4]
	adds r1, r2, r1
	adds r1, #0x2d
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	adds r2, #0x3c
	subs r5, #1
	cmp r5, #0
	bge _08026D80
	movs r6, #0
	b _08026EE4
	.align 2, 0
_08026DB4: .4byte gUnknown_08090A90
_08026DB8: .4byte gUnknown_08090A94
_08026DBC:
	movs r5, #0
	ldr r0, [r1]
	ldr r0, [r0]
	adds r2, r6, #1
	mov r8, r2
	b _08026EDA
_08026DC8:
	ldr r0, [r1]
	ldr r1, [r0]
	lsls r2, r6, #1
	ldr r3, _08026E10 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r5
	ldr r2, _08026E14 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r3, [r1]
	movs r0, #0xe0
	ands r0, r3
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08026ED2
	mov r1, sb
	ldr r2, [r1]
	lsrs r1, r0, #0x1d
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r2]
	adds r4, r1, r0
	movs r2, #0x1f
	ands r2, r3
	subs r0, r2, #6
	cmp r0, #0xe
	bhi _08026ED2
	lsls r0, r0, #2
	ldr r1, _08026E18 @ =_08026E1C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08026E10: .4byte 0x0000417A
_08026E14: .4byte 0x00001432
_08026E18: .4byte _08026E1C
_08026E1C: @ jump table
	.4byte _08026E98 @ case 0
	.4byte _08026ED2 @ case 1
	.4byte _08026E58 @ case 2
	.4byte _08026ED2 @ case 3
	.4byte _08026EAC @ case 4
	.4byte _08026EC0 @ case 5
	.4byte _08026ED2 @ case 6
	.4byte _08026ED2 @ case 7
	.4byte _08026E70 @ case 8
	.4byte _08026ED2 @ case 9
	.4byte _08026ED2 @ case 10
	.4byte _08026ED2 @ case 11
	.4byte _08026ED2 @ case 12
	.4byte _08026ED2 @ case 13
	.4byte _08026E84 @ case 14
_08026E58:
	adds r0, r2, #0
	bl sub_08026C6C
	ldr r1, [r4, #8]
	adds r1, r1, r0
	str r1, [r4, #8]
	adds r0, r4, #0
	adds r0, #0x2d
	strb r5, [r0]
	adds r0, #1
	strb r6, [r0]
	b _08026ED2
_08026E70:
	adds r0, r2, #0
	bl sub_08026C6C
	ldr r1, [r4, #8]
	adds r1, r1, r0
	str r1, [r4, #8]
	ldrb r0, [r4, #0xc]
	adds r0, #1
	strb r0, [r4, #0xc]
	b _08026ED2
_08026E84:
	adds r0, r2, #0
	bl sub_08026C6C
	ldr r1, [r4, #8]
	adds r1, r1, r0
	str r1, [r4, #8]
	ldrb r0, [r4, #0x10]
	adds r0, #1
	strb r0, [r4, #0x10]
	b _08026ED2
_08026E98:
	adds r0, r2, #0
	bl sub_08026C6C
	ldr r1, [r4, #8]
	adds r1, r1, r0
	str r1, [r4, #8]
	ldrb r0, [r4, #0xd]
	adds r0, #1
	strb r0, [r4, #0xd]
	b _08026ED2
_08026EAC:
	adds r0, r2, #0
	bl sub_08026C6C
	ldr r1, [r4, #8]
	adds r1, r1, r0
	str r1, [r4, #8]
	ldrb r0, [r4, #0xe]
	adds r0, #1
	strb r0, [r4, #0xe]
	b _08026ED2
_08026EC0:
	adds r0, r2, #0
	bl sub_08026C6C
	ldr r1, [r4, #8]
	adds r1, r1, r0
	str r1, [r4, #8]
	ldrb r0, [r4, #0xf]
	adds r0, #1
	strb r0, [r4, #0xf]
_08026ED2:
	adds r5, #1
	adds r1, r7, #0
	ldr r0, [r7]
	ldr r0, [r0]
_08026EDA:
	ldrh r0, [r0]
	cmp r5, r0
	bge _08026EE2
	b _08026DC8
_08026EE2:
	mov r6, r8
_08026EE4:
	adds r1, r7, #0
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	cmp r6, r0
	bge _08026EF2
	b _08026DBC
_08026EF2:
	bl sub_08026CD0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

