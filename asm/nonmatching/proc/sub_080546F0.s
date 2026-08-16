	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080546F0
sub_080546F0: @ 0x080546F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x48
	ldr r0, _08054A5C @ =gUnknown_0300453C
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08054A60 @ =gUnknown_0300451C
	strh r1, [r0]
	ldr r0, _08054A64 @ =gUnknown_03004508
	strh r1, [r0]
	ldr r0, _08054A68 @ =gUnknown_03004534
	strh r1, [r0]
	ldr r0, _08054A6C @ =gUnknown_030045B0
	strh r1, [r0]
	ldr r1, _08054A70 @ =gUnknown_02029664
	movs r0, #0
	strb r0, [r1]
	movs r7, #0
	mov r0, sp
	adds r0, #4
	str r0, [sp, #0x14]
	movs r4, #0
	movs r3, #0
	ldr r0, _08054A74 @ =gUnknown_020298E0
	adds r1, r0, #0
	adds r1, #0x8c
	str r1, [sp, #0x44]
	mov ip, r3
	adds r5, r0, #0
	adds r5, #0x16
	ldr r2, _08054A78 @ =gUnknown_02029C0C
	mov sl, r2
	ldr r6, _08054A7C @ =gUnknown_030045A0
	mov sb, r6
	ldr r0, _08054A80 @ =gUnknown_02029C10
	mov r8, r0
_0805473E:
	lsls r2, r7, #1
	mov r1, sl
	strh r3, [r1]
	mov r6, r8
	strh r3, [r6]
	mov r0, sb
	strh r3, [r0]
	lsls r1, r7, #3
	str r1, [sp, #0x3c]
	strh r3, [r5, #2]
	movs r0, #0x58
	muls r0, r7, r0
	ldr r6, _08054A84 @ =gUnknown_02029710
	adds r0, r0, r6
	strh r3, [r0]
	movs r0, #0x6c
	muls r0, r7, r0
	ldr r1, _08054A88 @ =gUnknown_02029808
	adds r0, r0, r1
	strh r3, [r0]
	strh r3, [r0, #0x2e]
	ldr r0, _08054A8C @ =gUnknown_03004548
	adds r0, r2, r0
	strh r3, [r0]
	ldr r0, _08054A90 @ =gUnknown_02028E4C
	ldr r6, [sp, #0x3c]
	adds r1, r6, r0
	strh r3, [r1]
	strh r3, [r1, #2]
	strb r4, [r1, #4]
	movs r0, #1
	strb r0, [r1, #5]
	ldr r1, _08054A94 @ =gUnknown_02028E5C
	lsls r0, r7, #2
	adds r0, r0, r1
	strh r3, [r0]
	strh r3, [r0, #2]
	strh r3, [r5]
	ldr r1, _08054A98 @ =gUnknown_020296B0
	mov r6, ip
	adds r0, r6, r1
	strh r3, [r0, #0x18]
	strb r4, [r0, #0x1a]
	strb r4, [r0, #0x1b]
	ldr r6, [sp, #0x44]
	strb r4, [r6]
	strb r4, [r6, #1]
	strb r4, [r0, #0x1c]
	ldr r0, _08054A9C @ =gUnknown_02029C00
	adds r0, r2, r0
	strh r3, [r0]
	ldr r0, _08054AA0 @ =gUnknown_02029C04
	adds r0, r2, r0
	strh r3, [r0]
	ldr r0, _08054AA4 @ =gUnknown_02029C08
	adds r0, r2, r0
	strh r3, [r0]
	ldr r0, _08054AA8 @ =gUnknown_02029BE8
	adds r2, r2, r0
	strh r3, [r2]
	adds r6, #0x90
	str r6, [sp, #0x44]
	movs r0, #0x28
	add ip, r0
	adds r5, #0x90
	movs r2, #2
	add sl, r2
	add sb, r2
	add r8, r2
	adds r7, #1
	cmp r7, #1
	ble _0805473E
	movs r7, #0
	ldr r3, _08054A74 @ =gUnknown_020298E0
	mov sl, r3
	movs r5, #0xff
	ldr r6, _08054A88 @ =gUnknown_02029808
	mov sb, r6
	movs r0, #0
	mov r8, r0
	movs r6, #0
_080547E0:
	movs r1, #0
	mov ip, r1
	mov r0, sl
	adds r0, #0x1a
	adds r4, r6, r0
	ldr r3, _08054AAC @ =gUnknown_020296BC
	add r3, r8
	movs r0, #0x6c
	adds r1, r7, #0
	muls r1, r0, r1
	ldr r0, _08054AB0 @ =gUnknown_02029816
	adds r2, r1, r0
	mov r0, sb
	adds r0, #2
	adds r1, r1, r0
_080547FE:
	strh r5, [r4]
	strh r5, [r1]
	strh r5, [r2]
	strh r5, [r3]
	adds r4, #2
	adds r3, #2
	adds r2, #2
	adds r1, #2
	movs r0, #1
	add ip, r0
	mov r0, ip
	cmp r0, #5
	ble _080547FE
	movs r1, #0x28
	add r8, r1
	adds r6, #0x90
	adds r7, #1
	cmp r7, #1
	ble _080547E0
	movs r7, #0
	movs r4, #0
	ldr r2, _08054A74 @ =gUnknown_020298E0
	str r2, [sp, #0xc]
	ldr r3, _08054AB4 @ =0x0000FFFF
	mov sb, r3
	movs r6, #0
	str r6, [sp, #0x1c]
	movs r0, #0
	str r0, [sp, #0x20]
	movs r1, #0
	str r1, [sp, #0x24]
	movs r2, #0
	str r2, [sp, #0x28]
	movs r3, #0
	str r3, [sp, #0x2c]
	ldr r6, _08054A88 @ =gUnknown_02029808
	str r6, [sp, #0x10]
_08054848:
	movs r0, #0
	mov ip, r0
	ldr r1, [sp, #0x2c]
	str r1, [sp, #8]
	ldr r2, [sp, #0x28]
	mov r8, r2
	movs r3, #0
	str r3, [sp, #0x18]
	ldr r6, [sp, #0x20]
	ldr r0, _08054AB8 @ =gUnknown_020298EC
	adds r6, r6, r0
	str r6, [sp, #0x30]
	ldr r1, [sp, #0x1c]
	ldr r2, _08054ABC @ =gUnknown_020296CE
	adds r1, r1, r2
	str r1, [sp, #0x34]
	ldr r3, [sp, #0x1c]
	str r3, [sp, #0x38]
	ldr r6, [sp, #0x20]
	ldr r0, [sp, #0x24]
	ldr r1, _08054AC0 @ =gUnknown_02029B80
	adds r0, r0, r1
	mov sl, r0
	ldr r5, [sp, #0x24]
_08054878:
	mov r2, ip
	lsls r2, r2, #1
	str r2, [sp, #0x40]
	mov r3, sl
	strh r4, [r3]
	ldr r0, _08054AC4 @ =gUnknown_02029B94
	adds r0, r5, r0
	strh r4, [r0]
	ldr r0, [sp, #0xc]
	adds r0, #0x26
	adds r0, r6, r0
	strh r4, [r0]
	ldr r0, [sp, #0xc]
	adds r0, #0x30
	adds r0, r6, r0
	strh r4, [r0]
	ldr r0, [sp, #0xc]
	adds r0, #0x3a
	adds r0, r6, r0
	movs r1, #1
	strh r1, [r0]
	movs r0, #0xb4
	adds r1, r7, #0
	muls r1, r0, r1
	ldr r0, [sp, #0x18]
	adds r1, r0, r1
	ldr r2, _08054AC8 @ =gUnknown_02029A10
	adds r1, r1, r2
	strh r4, [r1, #8]
	strh r4, [r1, #0xa]
	strh r4, [r1, #0xc]
	strh r4, [r1, #0xe]
	strh r4, [r1, #0x10]
	strh r4, [r1, #0x12]
	strh r4, [r1, #0x16]
	strh r4, [r1, #0x14]
	strh r4, [r1, #0x1c]
	strh r4, [r1, #0x1e]
	strh r4, [r1, #0x20]
	strh r4, [r1, #0x22]
	ldr r0, _08054ACC @ =gUnknown_02029BEC
	adds r0, r5, r0
	strh r4, [r0]
	ldrh r0, [r1, #0x18]
	mov r3, sb
	orrs r0, r3
	strh r0, [r1, #0x18]
	movs r0, #0x6c
	adds r2, r7, #0
	muls r2, r0, r2
	ldr r0, [sp, #0x40]
	adds r2, r0, r2
	ldr r1, [sp, #0x10]
	adds r1, #0x24
	adds r1, r2, r1
	ldrh r0, [r1]
	orrs r0, r3
	strh r0, [r1]
	ldr r0, [sp, #0x10]
	adds r0, #0x30
	adds r0, r2, r0
	strh r4, [r0]
	ldr r1, _08054AD0 @ =gUnknown_02029822
	adds r2, r2, r1
	movs r3, #0xff
	strh r3, [r2]
	ldr r1, [sp, #0xc]
	adds r1, #2
	adds r1, r6, r1
	ldrh r0, [r1]
	mov r2, sb
	orrs r0, r2
	strh r0, [r1]
	ldr r1, _08054A98 @ =gUnknown_020296B0
	adds r1, #2
	ldr r3, [sp, #0x38]
	adds r1, r3, r1
	ldrh r0, [r1]
	orrs r0, r2
	strh r0, [r1]
	ldr r1, _08054AD4 @ =gUnknown_020297C0
	adds r1, #2
	add r1, r8
	ldrh r0, [r1]
	orrs r0, r2
	strh r0, [r1]
	ldr r1, _08054A84 @ =gUnknown_02029710
	movs r0, #0x58
	muls r0, r7, r0
	ldr r2, [sp, #0x40]
	adds r3, r2, r0
	adds r1, #0xc
	adds r3, r3, r1
	ldrh r0, [r3]
	mov r1, sb
	orrs r0, r1
	strh r0, [r3]
	ldr r0, _08054AD8 @ =gUnknown_020297CC
	add r0, r8
	strh r4, [r0]
	ldr r1, _08054ADC @ =gUnknown_02029668
	adds r1, r5, r1
	ldrh r0, [r1]
	mov r2, sb
	orrs r0, r2
	strh r0, [r1]
	ldr r1, _08054AE0 @ =gUnknown_0202967C
	adds r1, r5, r1
	ldrh r0, [r1]
	orrs r0, r2
	strh r0, [r1]
	movs r0, #0xff
	ldr r3, [sp, #0x34]
	strh r0, [r3]
	ldr r1, [sp, #0x30]
	strh r0, [r1]
	ldr r1, _08054AE4 @ =gUnknown_02029C14
	ldr r0, [sp, #8]
	add r0, ip
	adds r0, r0, r1
	movs r2, #0
	strb r2, [r0]
	movs r3, #2
	add r8, r3
	ldr r0, [sp, #0x18]
	adds r0, #0x24
	str r0, [sp, #0x18]
	ldr r1, [sp, #0x30]
	adds r1, #2
	str r1, [sp, #0x30]
	ldr r2, [sp, #0x34]
	adds r2, #2
	str r2, [sp, #0x34]
	ldr r3, [sp, #0x38]
	adds r3, #2
	str r3, [sp, #0x38]
	adds r6, #2
	movs r0, #2
	add sl, r0
	adds r5, #2
	movs r1, #1
	add ip, r1
	mov r2, ip
	cmp r2, #4
	bgt _0805499C
	b _08054878
_0805499C:
	ldr r3, [sp, #0x1c]
	adds r3, #0x28
	str r3, [sp, #0x1c]
	ldr r6, [sp, #0x20]
	adds r6, #0x90
	str r6, [sp, #0x20]
	ldr r0, [sp, #0x24]
	adds r0, #0xa
	str r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	adds r1, #0x24
	str r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	adds r2, #5
	str r2, [sp, #0x2c]
	adds r7, #1
	cmp r7, #1
	bgt _080549C2
	b _08054848
_080549C2:
	movs r7, #0
	ldr r4, _08054AE8 @ =0x000007FF
	ldr r3, _08054AEC @ =gUnknown_085519FC
	ldr r6, _08054AF0 @ =0x000001FF
	adds r2, r6, #0
_080549CC:
	ldr r1, [r3]
	lsls r0, r7, #1
	adds r0, r0, r1
	strh r2, [r0]
	adds r7, #1
	cmp r7, r4
	ble _080549CC
	ldr r0, _08054AF4 @ =gUnknown_03004504
	ldrb r0, [r0]
	movs r5, #1
	ands r5, r0
	cmp r5, #0
	bne _08054A10
	ldr r0, _08054AF8 @ =gUnknown_08551A00
	ldr r0, [r0]
	ldr r1, _08054AFC @ =0x06002000
	movs r4, #0x80
	lsls r4, r4, #2
	adds r2, r4, #0
	bl CpuFastSet
	ldr r0, _08054B00 @ =gUnknown_08551A04
	ldr r0, [r0]
	ldr r1, _08054B04 @ =0x06002800
	adds r2, r4, #0
	bl CpuFastSet
	str r5, [sp]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r2, _08054B08 @ =0x01002000
	mov r0, sp
	bl CpuFastSet
_08054A10:
	movs r4, #0
	str r4, [sp]
	ldr r1, _08054B0C @ =0x06008000
	ldr r5, _08054B08 @ =0x01002000
	mov r0, sp
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #4]
	ldr r1, _08054B10 @ =gUnknown_0200FC50
	ldr r0, [sp, #0x14]
	adds r2, r5, #0
	bl CpuFastSet
	bl sub_0801D8B4
	ldr r0, _08054AF8 @ =gUnknown_08551A00
	ldr r0, [r0]
	ldr r1, _08054AFC @ =0x06002000
	movs r4, #0x80
	lsls r4, r4, #2
	adds r2, r4, #0
	bl CpuFastSet
	ldr r0, _08054B00 @ =gUnknown_08551A04
	ldr r0, [r0]
	ldr r1, _08054B04 @ =0x06002800
	adds r2, r4, #0
	bl CpuFastSet
	add sp, #0x48
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08054A5C: .4byte gUnknown_0300453C
_08054A60: .4byte gUnknown_0300451C
_08054A64: .4byte gUnknown_03004508
_08054A68: .4byte gUnknown_03004534
_08054A6C: .4byte gUnknown_030045B0
_08054A70: .4byte gUnknown_02029664
_08054A74: .4byte gUnknown_020298E0
_08054A78: .4byte gUnknown_02029C0C
_08054A7C: .4byte gUnknown_030045A0
_08054A80: .4byte gUnknown_02029C10
_08054A84: .4byte gUnknown_02029710
_08054A88: .4byte gUnknown_02029808
_08054A8C: .4byte gUnknown_03004548
_08054A90: .4byte gUnknown_02028E4C
_08054A94: .4byte gUnknown_02028E5C
_08054A98: .4byte gUnknown_020296B0
_08054A9C: .4byte gUnknown_02029C00
_08054AA0: .4byte gUnknown_02029C04
_08054AA4: .4byte gUnknown_02029C08
_08054AA8: .4byte gUnknown_02029BE8
_08054AAC: .4byte gUnknown_020296BC
_08054AB0: .4byte gUnknown_02029816
_08054AB4: .4byte 0x0000FFFF
_08054AB8: .4byte gUnknown_020298EC
_08054ABC: .4byte gUnknown_020296CE
_08054AC0: .4byte gUnknown_02029B80
_08054AC4: .4byte gUnknown_02029B94
_08054AC8: .4byte gUnknown_02029A10
_08054ACC: .4byte gUnknown_02029BEC
_08054AD0: .4byte gUnknown_02029822
_08054AD4: .4byte gUnknown_020297C0
_08054AD8: .4byte gUnknown_020297CC
_08054ADC: .4byte gUnknown_02029668
_08054AE0: .4byte gUnknown_0202967C
_08054AE4: .4byte gUnknown_02029C14
_08054AE8: .4byte 0x000007FF
_08054AEC: .4byte gUnknown_085519FC
_08054AF0: .4byte 0x000001FF
_08054AF4: .4byte gUnknown_03004504
_08054AF8: .4byte gUnknown_08551A00
_08054AFC: .4byte 0x06002000
_08054B00: .4byte gUnknown_08551A04
_08054B04: .4byte 0x06002800
_08054B08: .4byte 0x01002000
_08054B0C: .4byte 0x06008000
_08054B10: .4byte gUnknown_0200FC50

