	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08068E60
sub_08068E60: @ 0x08068E60
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x28
	mov r8, r0
	ldr r2, _08068FF4 @ =gUnknown_0202F204
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_080674F4
	mov r1, r8
	str r0, [r1, #0x2c]
	ldr r2, _08068FF8 @ =gUnknown_030030CC
	ldrb r1, [r2]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r1
	movs r3, #1
	orrs r0, r3
	strb r0, [r2]
	ldrb r0, [r2, #1]
	orrs r0, r3
	movs r6, #2
	orrs r0, r6
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r5, _08068FFC @ =gUnknown_030030B4
	ldrb r2, [r5]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r5]
	ldr r4, _08069000 @ =gUnknown_03001FE8
	ldrb r2, [r4]
	adds r0, r1, #0
	ands r0, r2
	orrs r0, r3
	strb r0, [r4]
	ldr r2, _08069004 @ =gUnknown_03002B6C
	ldrb r0, [r2]
	ands r1, r0
	orrs r1, r6
	strb r1, [r2]
	ldr r2, _08069008 @ =gUnknown_0300251C
	ldrb r0, [r2]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2]
	bl sub_08012358
	bl sub_08063994
	adds r0, r4, #0
	movs r1, #1
	bl sub_08012C48
	adds r0, r5, #0
	movs r1, #2
	bl sub_08012C48
	ldrb r1, [r5, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r5, #1]
	movs r4, #0
	str r4, [sp, #0x18]
	ldr r1, _0806900C @ =0x0600E000
	ldr r5, _08069010 @ =0x01000400
	add r0, sp, #0x18
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #0x1c]
	add r0, sp, #0x1c
	ldr r4, _08069014 @ =gUnknown_08499580
	ldr r1, [r4]
	adds r2, r5, #0
	bl CpuFastSet
	ldr r0, _08069018 @ =gUnknown_08183C28
	movs r1, #0
	movs r2, #0x80
	bl sub_08013618
	ldr r0, _0806901C @ =gUnknown_0823BDE0
	movs r1, #0
	movs r2, #0x20
	bl sub_08013618
	ldr r0, _08069020 @ =gUnknown_081837A0
	ldr r1, _08069024 @ =0x06008000
	bl sub_08011CAC
	ldr r0, _08069028 @ =gUnknown_081838EC
	ldr r1, [r4]
	bl sub_08011CAC
	ldr r0, _0806902C @ =gUnknown_0823A3D4
	ldr r1, _08069030 @ =0x06002800
	bl sub_08011CAC
	ldr r0, _08069034 @ =gUnknown_08239FA4
	ldr r4, _08069038 @ =gUnknown_08499578
	ldr r1, [r4]
	bl sub_08011CAC
	movs r2, #0
	ldr r5, _0806903C @ =0x000003FF
	add r6, sp, #0x20
	add r7, sp, #0x24
	mov sb, r7
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r3, r0, #0
_08068F5C:
	ldr r0, [r4]
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r7, [r1]
	adds r0, r3, r7
	strh r0, [r1]
	adds r2, #1
	cmp r2, r5
	ble _08068F5C
	movs r5, #0
	str r5, [sp, #0x20]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r4, _08069040 @ =0x01000008
	adds r0, r6, #0
	adds r2, r4, #0
	bl CpuFastSet
	str r5, [sp, #0x24]
	ldr r1, _08069024 @ =0x06008000
	mov r0, sb
	adds r2, r4, #0
	bl CpuFastSet
	bl sub_08013AEC
	bl sub_08013B0C
	bl sub_08013B1C
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_08072C40
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl sub_08072C40
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl sub_08072C40
	movs r0, #0
	movs r1, #4
	movs r2, #4
	mov r3, r8
	bl sub_080677BC
	movs r0, #0xe0
	lsls r0, r0, #6
	str r0, [sp]
	str r5, [sp, #4]
	movs r0, #0xc0
	str r0, [sp, #8]
	adds r0, #0x40
	str r0, [sp, #0xc]
	movs r0, #0xe
	str r0, [sp, #0x10]
	mov r0, r8
	str r0, [sp, #0x14]
	movs r0, #1
	movs r1, #1
	movs r2, #0
	movs r3, #0x88
	bl sub_080679D8
	add sp, #0x28
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08068FF4: .4byte gUnknown_0202F204
_08068FF8: .4byte gUnknown_030030CC
_08068FFC: .4byte gUnknown_030030B4
_08069000: .4byte gUnknown_03001FE8
_08069004: .4byte gUnknown_03002B6C
_08069008: .4byte gUnknown_0300251C
_0806900C: .4byte 0x0600E000
_08069010: .4byte 0x01000400
_08069014: .4byte gUnknown_08499580
_08069018: .4byte gUnknown_08183C28
_0806901C: .4byte gUnknown_0823BDE0
_08069020: .4byte gUnknown_081837A0
_08069024: .4byte 0x06008000
_08069028: .4byte gUnknown_081838EC
_0806902C: .4byte gUnknown_0823A3D4
_08069030: .4byte 0x06002800
_08069034: .4byte gUnknown_08239FA4
_08069038: .4byte gUnknown_08499578
_0806903C: .4byte 0x000003FF
_08069040: .4byte 0x01000008

