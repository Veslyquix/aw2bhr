	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807AA84
sub_0807AA84: @ 0x0807AA84
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	bl sub_0807898C
	bl sub_08013AEC
	ldr r3, _0807AB94 @ =gUnknown_03002B6C
	ldrb r1, [r3]
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r3]
	ldr r5, _0807AB98 @ =gUnknown_03001FE8
	ldrb r1, [r5]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r5]
	ldr r0, _0807AB9C @ =gUnknown_081D9308
	ldr r6, [r0]
	ldrb r0, [r6]
	ands r2, r0
	movs r0, #2
	orrs r2, r0
	strb r2, [r6]
	ldr r3, _0807ABA0 @ =gUnknown_0300251C
	ldrb r0, [r3]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3]
	ldrb r2, [r5, #1]
	movs r1, #0x3f
	adds r0, r1, #0
	ands r0, r2
	movs r2, #0x40
	orrs r0, r2
	strb r0, [r5, #1]
	ldrb r0, [r6, #1]
	ands r1, r0
	orrs r1, r2
	strb r1, [r6, #1]
	ldr r1, _0807ABA4 @ =gUnknown_03002B34
	movs r0, #0xf0
	strh r0, [r1]
	ldr r1, _0807ABA8 @ =gUnknown_030030A0
	ldr r2, _0807ABAC @ =0x0000FF10
	adds r0, r2, #0
	strh r0, [r1]
	ldrb r1, [r3, #1]
	movs r4, #0x20
	rsbs r4, r4, #0
	adds r0, r4, #0
	ands r0, r1
	movs r1, #0x1b
	orrs r0, r1
	strb r0, [r3, #1]
	adds r0, r7, #0
	bl sub_08078D80
	mov r0, sp
	movs r1, #0
	mov sb, r1
	strh r1, [r0]
	ldr r1, [r5]
	lsls r1, r1, #0x13
	lsrs r1, r1, #0x1b
	lsls r1, r1, #0xb
	movs r2, #0xc0
	lsls r2, r2, #0x13
	mov r8, r2
	add r1, r8
	ldr r2, _0807ABB0 @ =0x01000400
	bl CpuSet
	ldrb r2, [r5]
	movs r1, #0xd
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	movs r2, #4
	orrs r0, r2
	strb r0, [r5]
	ldrb r0, [r6]
	ands r1, r0
	orrs r1, r2
	strb r1, [r6]
	ldrb r1, [r5, #1]
	adds r0, r4, #0
	ands r0, r1
	movs r1, #0x1e
	orrs r0, r1
	strb r0, [r5, #1]
	ldrb r0, [r6, #1]
	ands r4, r0
	movs r0, #0xc
	orrs r4, r0
	strb r4, [r6, #1]
	mov r0, sp
	adds r0, #2
	mov r1, sb
	strh r1, [r0]
	ldr r1, [r5]
	lsls r1, r1, #0x13
	lsrs r1, r1, #0x1b
	lsls r1, r1, #0xb
	add r1, r8
	ldr r4, _0807ABB4 @ =0x01000800
	adds r2, r4, #0
	bl CpuSet
	add r0, sp, #4
	mov r2, sb
	strh r2, [r0]
	ldr r1, [r6]
	lsls r1, r1, #0x13
	lsrs r1, r1, #0x1b
	lsls r1, r1, #0xb
	add r1, r8
	adds r2, r4, #0
	bl CpuSet
	ldr r1, _0807ABB8 @ =gUnknown_081D930C
	ldr r0, [r1]
	ldrb r0, [r0, #9]
	ldr r5, _0807ABBC @ =gUnknown_081D9304
	cmp r0, #0
	bne _0807ABC0
	movs r0, #1
	b _0807ABC2
	.align 2, 0
_0807AB94: .4byte gUnknown_03002B6C
_0807AB98: .4byte gUnknown_03001FE8
_0807AB9C: .4byte gUnknown_081D9308
_0807ABA0: .4byte gUnknown_0300251C
_0807ABA4: .4byte gUnknown_03002B34
_0807ABA8: .4byte gUnknown_030030A0
_0807ABAC: .4byte 0x0000FF10
_0807ABB0: .4byte 0x01000400
_0807ABB4: .4byte 0x01000800
_0807ABB8: .4byte gUnknown_081D930C
_0807ABBC: .4byte gUnknown_081D9304
_0807ABC0:
	movs r0, #0
_0807ABC2:
	str r0, [r7, #0x3c]
	ldr r0, [r7, #0x3c]
	cmp r0, #0
	beq _0807ABCC
	b _0807AD6C
_0807ABCC:
	ldr r0, _0807AD38 @ =gUnknown_0822AC80
	ldr r5, [r5]
	ldr r1, [r5]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	movs r6, #0xc0
	lsls r6, r6, #0x13
	adds r1, r1, r6
	bl Decompress
	ldr r0, _0807AD3C @ =gUnknown_0822B944
	ldr r1, _0807AD40 @ =gUnknown_081D9310
	mov r8, r1
	ldr r4, [r1]
	adds r1, r4, #0
	bl Decompress
	ldr r1, [r5]
	lsls r1, r1, #0x13
	lsrs r1, r1, #0x1b
	lsls r1, r1, #0xb
	adds r1, r1, r6
	adds r0, r4, #0
	movs r2, #0xc0
	bl CpuFastSet
	movs r6, #0
	mov sb, r8
	ldr r2, _0807AD44 @ =gUnknown_081D9314
	mov sl, r2
	adds r7, #0x4c
	str r7, [sp, #8]
	mov r8, r5
	ldr r5, _0807AD48 @ =0x06000800
_0807AC12:
	mov r0, sb
	ldr r7, [r0]
	lsls r4, r6, #6
	adds r4, r4, r7
	mov r2, r8
	ldr r1, [r2]
	lsls r1, r1, #0x13
	lsrs r1, r1, #0x1b
	lsls r1, r1, #0xb
	adds r1, r1, r5
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	mov r0, r8
	ldr r1, [r0]
	lsls r1, r1, #0x13
	lsrs r1, r1, #0x1b
	lsls r1, r1, #0xb
	adds r1, r1, r5
	adds r1, #0x20
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	adds r5, #0x40
	adds r6, #1
	cmp r6, #5
	ble _0807AC12
	movs r1, #0x88
	lsls r1, r1, #3
	adds r0, r7, r1
	ldr r4, _0807AD4C @ =gUnknown_030030B4
	ldr r1, [r4]
	lsls r1, r1, #0x13
	lsrs r1, r1, #0x1b
	lsls r1, r1, #0xb
	ldr r2, _0807AD50 @ =0x06000440
	adds r1, r1, r2
	movs r2, #0x30
	bl CpuFastSet
	movs r6, #0
	adds r7, r4, #0
	ldr r5, _0807AD54 @ =0x06000C40
_0807AC6C:
	lsls r4, r6, #6
	mov r2, sl
	ldr r0, [r2]
	adds r4, r4, r0
	ldr r1, [r7]
	lsls r1, r1, #0x13
	lsrs r1, r1, #0x1b
	lsls r1, r1, #0xb
	adds r1, r1, r5
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r1, [r7]
	lsls r1, r1, #0x13
	lsrs r1, r1, #0x1b
	lsls r1, r1, #0xb
	adds r1, r1, r5
	adds r1, #0x20
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	adds r5, #0x40
	adds r6, #1
	cmp r6, #2
	ble _0807AC6C
	ldr r0, _0807AD58 @ =gUnknown_0822BB60
	movs r1, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r6, #0
	ldr r0, _0807AD5C @ =gUnknown_0202FDEC
	ldrb r1, [r0, #8]
	cmp r6, r1
	bge _0807ACEE
	adds r5, r0, #0
	movs r4, #0x80
	lsls r4, r4, #1
_0807ACBC:
	adds r0, r6, r5
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldr r0, _0807AD60 @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1d]
	adds r0, #0x18
	ldr r1, _0807AD64 @ =0x000003FF
	ands r1, r4
	lsls r1, r1, #5
	ldr r2, _0807AD68 @ =0x06010000
	adds r1, r1, r2
	adds r2, r6, #0
	adds r2, #0x19
	bl sub_08043E3C
	adds r4, #0x24
	adds r6, #1
	ldrb r0, [r5, #8]
	cmp r6, r0
	blt _0807ACBC
_0807ACEE:
	movs r6, #0
	ldr r0, _0807AD5C @ =gUnknown_0202FDEC
	ldrb r1, [r0, #9]
	cmp r6, r1
	blt _0807ACFA
	b _0807AE38
_0807ACFA:
	adds r5, r0, #0
	movs r4, #0xb6
	lsls r4, r4, #1
_0807AD00:
	adds r0, r5, #4
	adds r0, r6, r0
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldr r0, _0807AD60 @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1d]
	adds r0, #0x30
	ldr r1, _0807AD64 @ =0x000003FF
	ands r1, r4
	lsls r1, r1, #5
	ldr r2, _0807AD68 @ =0x06010000
	adds r1, r1, r2
	adds r2, r6, #0
	adds r2, #0x1c
	bl sub_08043E3C
	adds r4, #0x24
	adds r6, #1
	ldrb r0, [r5, #9]
	cmp r6, r0
	blt _0807AD00
	b _0807AE38
	.align 2, 0
_0807AD38: .4byte gUnknown_0822AC80
_0807AD3C: .4byte gUnknown_0822B944
_0807AD40: .4byte gUnknown_081D9310
_0807AD44: .4byte gUnknown_081D9314
_0807AD48: .4byte 0x06000800
_0807AD4C: .4byte gUnknown_030030B4
_0807AD50: .4byte 0x06000440
_0807AD54: .4byte 0x06000C40
_0807AD58: .4byte gUnknown_0822BB60
_0807AD5C: .4byte gUnknown_0202FDEC
_0807AD60: .4byte gUnknown_08499598
_0807AD64: .4byte 0x000003FF
_0807AD68: .4byte 0x06010000
_0807AD6C:
	ldr r0, _0807AE54 @ =gUnknown_0822BB80
	ldr r1, [r5]
	ldr r1, [r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl Decompress
	ldr r0, _0807AE58 @ =gUnknown_0822BCF0
	ldr r4, _0807AE5C @ =gUnknown_0200FC50
	adds r1, r4, #0
	bl Decompress
	movs r1, #0x80
	lsls r1, r1, #3
	adds r4, r4, r1
	ldr r5, _0807AE60 @ =gUnknown_030030B4
	ldr r1, [r5]
	lsls r1, r1, #0x13
	lsrs r1, r1, #0x1b
	lsls r1, r1, #0xb
	ldr r0, _0807AE64 @ =0x06000400
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0x40
	bl CpuFastSet
	movs r6, #0
	ldr r2, _0807AE68 @ =gUnknown_081D9318
	mov r8, r2
	adds r7, #0x4c
	str r7, [sp, #8]
	adds r7, r5, #0
	ldr r5, _0807AE6C @ =0x06000C00
_0807ADB6:
	lsls r4, r6, #6
	mov r1, r8
	ldr r0, [r1]
	adds r4, r4, r0
	ldr r1, [r7]
	lsls r1, r1, #0x13
	lsrs r1, r1, #0x1b
	lsls r1, r1, #0xb
	adds r1, r1, r5
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r1, [r7]
	lsls r1, r1, #0x13
	lsrs r1, r1, #0x1b
	lsls r1, r1, #0xb
	adds r1, r1, r5
	adds r1, #0x20
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	adds r5, #0x40
	adds r6, #1
	cmp r6, #3
	ble _0807ADB6
	ldr r0, _0807AE70 @ =gUnknown_0822BDFC
	movs r1, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r6, #0
	ldr r1, _0807AE74 @ =gUnknown_0202FDEC
	ldrb r2, [r1, #8]
	cmp r6, r2
	bge _0807AE38
	adds r5, r1, #0
	movs r4, #0x80
	lsls r4, r4, #1
_0807AE06:
	adds r0, r6, r5
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldr r0, _0807AE78 @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1d]
	adds r0, #0x30
	ldr r1, _0807AE7C @ =0x000003FF
	ands r1, r4
	lsls r1, r1, #5
	ldr r2, _0807AE80 @ =0x06010000
	adds r1, r1, r2
	adds r2, r6, #0
	adds r2, #0x19
	bl sub_08043E3C
	adds r4, #0x24
	adds r6, #1
	ldrb r0, [r5, #8]
	cmp r6, r0
	blt _0807AE06
_0807AE38:
	movs r0, #0
	bl sub_0801B780
	movs r0, #0
	ldr r1, [sp, #8]
	strh r0, [r1]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807AE54: .4byte gUnknown_0822BB80
_0807AE58: .4byte gUnknown_0822BCF0
_0807AE5C: .4byte gUnknown_0200FC50
_0807AE60: .4byte gUnknown_030030B4
_0807AE64: .4byte 0x06000400
_0807AE68: .4byte gUnknown_081D9318
_0807AE6C: .4byte 0x06000C00
_0807AE70: .4byte gUnknown_0822BDFC
_0807AE74: .4byte gUnknown_0202FDEC
_0807AE78: .4byte gUnknown_08499598
_0807AE7C: .4byte 0x000003FF
_0807AE80: .4byte 0x06010000

