	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08043E8C
sub_08043E8C: @ 0x08043E8C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	adds r5, r1, #0
	mov r8, r2
	ldr r6, _08043F50 @ =gUnknown_02017C50
	ldr r4, _08043F54 @ =gUnknown_08091384
	ldr r1, [r4]
	lsls r0, r0, #4
	ldr r2, [sp]
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, #0x18
	adds r0, r0, r1
	ldr r0, [r0]
	movs r2, #0xc0
	lsls r2, r2, #1
	adds r1, r6, #0
	bl sub_08011C68
	movs r0, #0
	movs r7, #0xf0
	lsls r7, r7, #8
	mov sl, r7
	ldr r1, _08043F58 @ =0x00000FFF
	mov sb, r1
	movs r2, #0xf0
	lsls r2, r2, #4
	mov ip, r2
	ldr r4, _08043F5C @ =0x0000F0FF
_08043ED0:
	adds r3, r0, #1
	movs r2, #0xf
_08043ED4:
	ldrh r1, [r6]
	adds r6, #2
	adds r0, r1, #0
	mov r7, sl
	ands r0, r7
	cmp r0, #0
	bne _08043EF2
	mov r0, sb
	ands r1, r0
	movs r7, #0x80
	lsls r7, r7, #5
	adds r0, r7, #0
	orrs r1, r0
	lsls r0, r1, #0x10
	lsrs r1, r0, #0x10
_08043EF2:
	adds r0, r1, #0
	mov r7, ip
	ands r0, r7
	cmp r0, #0
	bne _08043F0A
	ands r1, r4
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r7, #0
	orrs r1, r0
	lsls r0, r1, #0x10
	lsrs r1, r0, #0x10
_08043F0A:
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _08043F1E
	ldr r0, _08043F60 @ =0x0000FF0F
	ands r1, r0
	movs r0, #0x10
	orrs r1, r0
	lsls r0, r1, #0x10
	lsrs r1, r0, #0x10
_08043F1E:
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08043F2E
	ldr r0, _08043F64 @ =0x0000FFF0
	ands r1, r0
	movs r0, #1
	orrs r1, r0
_08043F2E:
	strh r1, [r5]
	adds r5, #2
	subs r2, #1
	cmp r2, #0
	bge _08043ED4
	adds r0, r3, #0
	cmp r0, #0xb
	ble _08043ED0
	mov r0, r8
	cmp r0, #0xe
	bgt _08043F68
	ldr r0, [sp]
	mov r1, r8
	bl sub_08043AA0
	b _08043F92
	.align 2, 0
_08043F50: .4byte gUnknown_02017C50
_08043F54: .4byte gUnknown_08091384
_08043F58: .4byte 0x00000FFF
_08043F5C: .4byte 0x0000F0FF
_08043F60: .4byte 0x0000FF0F
_08043F64: .4byte 0x0000FFF0
_08043F68:
	ldr r0, [sp]
	movs r1, #0x18
	bl __modsi3
	adds r4, r0, #0
	bl GetLoadedCoPalette
	adds r2, r0, #0
	ldr r1, _08043FA4 @ =gUnknown_084A0090
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r1, #8
	adds r0, r0, r1
	lsls r2, r2, #5
	ldr r0, [r0]
	adds r0, r0, r2
	mov r1, r8
	movs r2, #8
	bl CpuFastSet
_08043F92:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08043FA4: .4byte gUnknown_084A0090

