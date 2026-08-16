	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803CFA4
sub_0803CFA4: @ 0x0803CFA4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	adds r3, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0x10]
	adds r7, r1, #0
	ldr r1, _0803D054 @ =0x000004B2
	adds r0, r7, r1
	adds r1, r3, #0
	bl sub_0803CC84
	ldr r2, _0803D058 @ =0x000004C2
	adds r1, r7, r2
	movs r0, #0
	strb r0, [r1]
	ldr r2, _0803D05C @ =gUnknown_08091144
	ldr r1, [r2]
	ldr r0, [r1]
	ldrh r0, [r0]
	strb r0, [r7]
	ldr r0, [r1]
	ldrh r0, [r0, #2]
	strb r0, [r7, #1]
	movs r5, #0
	mov sl, r2
	mov r3, sp
	adds r3, #8
	str r3, [sp, #0x18]
	movs r4, #5
	add r4, sp
	mov r8, r4
	ldr r0, _0803D060 @ =0x000004C4
	adds r1, r7, r0
	movs r2, #0
_0803CFF2:
	adds r0, r1, r5
	strb r2, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #4
	bls _0803CFF2
	movs r5, #0
	movs r1, #0
_0803D004:
	mov r2, sp
	adds r0, r2, r5
	strb r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #5
	bls _0803D004
	movs r5, #0
	ldr r2, [sp, #0x18]
	ldr r3, _0803D064 @ =gUnknown_03003FF3
_0803D01A:
	adds r0, r5, r3
	ldrb r1, [r0]
	adds r1, r2, r1
	subs r0, r5, #1
	lsls r0, r0, #6
	strb r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #4
	bls _0803D01A
	movs r5, #0
	movs r3, #0
	str r3, [sp, #0x14]
	mov sb, r3
	mov r1, sl
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	cmp r5, r0
	blt _0803D046
	b _0803D1A8
_0803D046:
	movs r6, #0
	ldr r0, [r1]
	ldr r0, [r0]
	mov r4, sb
	adds r4, #1
	str r4, [sp, #0x1c]
	b _0803D18E
	.align 2, 0
_0803D054: .4byte 0x000004B2
_0803D058: .4byte 0x000004C2
_0803D05C: .4byte gUnknown_08091144
_0803D060: .4byte 0x000004C4
_0803D064: .4byte gUnknown_03003FF3
_0803D068:
	ldr r0, [r1]
	ldr r1, [r0]
	mov r0, sb
	lsls r2, r0, #1
	ldr r3, _0803D0AC @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r6
	adds r1, #0x12
	adds r1, r1, r0
	ldrb r3, [r1]
	mov ip, r2
	cmp r3, #0
	beq _0803D0B8
	ldr r1, _0803D0B0 @ =gUnknown_08499594
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	ldr r1, [r1]
	adds r1, r1, r0
	ldr r4, _0803D0B4 @ =0x000004CB
	adds r2, r7, r4
	adds r2, r2, r5
	lsrs r0, r3, #6
	adds r0, #1
	ldr r3, [sp, #0x18]
	adds r0, r3, r0
	ldrb r0, [r0]
	ldrb r1, [r1]
	orrs r0, r1
	strb r0, [r2]
	b _0803D0C0
	.align 2, 0
_0803D0AC: .4byte 0x0000417A
_0803D0B0: .4byte gUnknown_08499594
_0803D0B4: .4byte 0x000004CB
_0803D0B8:
	ldr r4, _0803D110 @ =0x000004CB
	adds r0, r7, r4
	adds r0, r0, r5
	strb r3, [r0]
_0803D0C0:
	adds r1, r5, #0
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #1
	adds r4, r7, #2
	adds r4, r4, r1
	str r4, [sp, #0x20]
	mov r1, sl
	ldr r0, [r1]
	ldr r2, [r0]
	ldr r4, _0803D114 @ =0x0000417A
	adds r3, r2, r4
	add r3, ip
	ldrh r0, [r3]
	adds r0, r0, r6
	lsls r0, r0, #1
	ldr r4, _0803D118 @ =0x00000A22
	adds r1, r2, r4
	adds r1, r1, r0
	ldrh r0, [r1]
	ldr r1, [sp, #0x20]
	strh r0, [r1]
	ldrh r0, [r3]
	adds r0, r0, r6
	ldr r3, _0803D11C @ =0x00001432
	adds r2, r2, r3
	adds r2, r2, r0
	ldrb r2, [r2]
	movs r0, #0x1f
	ands r0, r2
	subs r0, #6
	cmp r0, #0xe
	bhi _0803D174
	lsls r0, r0, #2
	ldr r1, _0803D120 @ =_0803D124
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803D110: .4byte 0x000004CB
_0803D114: .4byte 0x0000417A
_0803D118: .4byte 0x00000A22
_0803D11C: .4byte 0x00001432
_0803D120: .4byte _0803D124
_0803D124: @ jump table
	.4byte _0803D160 @ case 0
	.4byte _0803D174 @ case 1
	.4byte _0803D160 @ case 2
	.4byte _0803D174 @ case 3
	.4byte _0803D160 @ case 4
	.4byte _0803D160 @ case 5
	.4byte _0803D174 @ case 6
	.4byte _0803D174 @ case 7
	.4byte _0803D160 @ case 8
	.4byte _0803D174 @ case 9
	.4byte _0803D174 @ case 10
	.4byte _0803D174 @ case 11
	.4byte _0803D174 @ case 12
	.4byte _0803D174 @ case 13
	.4byte _0803D160 @ case 14
_0803D160:
	mov r4, r8
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	lsrs r0, r2, #5
	mov r3, sp
	adds r1, r3, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0803D174:
	movs r0, #0x1f
	ands r2, r0
	cmp r2, #8
	bne _0803D186
	ldr r0, [sp, #0x14]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x14]
_0803D186:
	adds r6, #1
	mov r1, sl
	ldr r0, [r1]
	ldr r0, [r0]
_0803D18E:
	ldrh r0, [r0]
	cmp r6, r0
	bge _0803D196
	b _0803D068
_0803D196:
	ldr r4, [sp, #0x1c]
	mov sb, r4
	mov r1, sl
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	cmp sb, r0
	bge _0803D1A8
	b _0803D046
_0803D1A8:
	movs r5, #0
	mov r2, sp
_0803D1AC:
	mov r1, sp
	adds r0, r1, r5
	ldrb r1, [r0]
	ldrb r0, [r2]
	cmp r0, r1
	bhs _0803D1BA
	strb r1, [r2]
_0803D1BA:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #4
	bls _0803D1AC
	mov r2, r8
	ldrb r1, [r2]
	ldr r3, _0803D1EC @ =0x000004C9
	adds r0, r7, r3
	strb r1, [r0]
	mov r0, sp
	ldrb r0, [r0]
	adds r0, #1
	ldr r4, _0803D1F0 @ =0x000004CA
	adds r1, r7, r4
	strb r0, [r1]
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bne _0803D1F8
	ldr r1, _0803D1F4 @ =0x000004C3
	adds r0, r7, r1
	mov r2, sp
	ldrb r2, [r2, #0x14]
	strb r2, [r0]
	b _0803D200
	.align 2, 0
_0803D1EC: .4byte 0x000004C9
_0803D1F0: .4byte 0x000004CA
_0803D1F4: .4byte 0x000004C3
_0803D1F8:
	ldr r3, _0803D22C @ =0x000004C3
	adds r1, r7, r3
	movs r0, #0
	strb r0, [r1]
_0803D200:
	movs r5, #0
	ldr r4, _0803D230 @ =0x000004C4
	adds r2, r7, r4
	ldr r3, _0803D234 @ =gUnknown_03003FF3
_0803D208:
	adds r1, r2, r5
	adds r0, r5, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #4
	bls _0803D208
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803D22C: .4byte 0x000004C3
_0803D230: .4byte 0x000004C4
_0803D234: .4byte gUnknown_03003FF3

