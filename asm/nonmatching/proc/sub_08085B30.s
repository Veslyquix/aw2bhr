	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08085B30
sub_08085B30: @ 0x08085B30
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sb, r0
	bl sub_0807898C
	bl sub_08078AF0
	bl sub_0801F114
	ldr r1, _08085C08 @ =0x06010000
	movs r0, #2
	movs r2, #0xf0
	movs r3, #0x14
	bl sub_0801F150
	movs r0, #0x43
	bl sub_0801F234
	movs r0, #0x44
	bl sub_0801F234
	movs r0, #0x45
	bl sub_0801F234
	movs r0, #0x46
	bl sub_0801F234
	movs r0, #0x52
	bl sub_0801F234
	movs r0, #0x69
	bl sub_0801F234
	movs r5, #0
	ldr r0, _08085C0C @ =gUnknown_081D93FC
	mov r8, r0
_08085B80:
	adds r0, r5, #0
	adds r0, #0x55
	bl sub_0801F234
	adds r5, #1
	cmp r5, #9
	ble _08085B80
	ldr r0, _08085C10 @ =gUnknown_03002B6C
	ldr r1, [r0]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	movs r2, #0xdc
	lsls r2, r2, #2
	movs r0, #4
	movs r3, #9
	bl sub_0801F150
	movs r0, #0xb8
	bl sub_0801F234
	movs r0, #0xb9
	bl sub_0801F234
	movs r0, #0xba
	bl sub_0801F234
	movs r0, #0xbb
	bl sub_0801F234
	bl sub_08087938
	movs r0, #0
	bl sub_0801B780
	movs r0, #6
	bl sub_08037750
	ldr r0, _08085C14 @ =gUnknown_03003FC0
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _08085C20
	mov r1, r8
	ldr r4, [r1]
	movs r0, #7
	str r0, [r4]
	movs r0, #2
	bl sub_080375A4
	ldr r5, _08085C18 @ =gUnknown_03005900
	ldrb r0, [r5]
	ldr r1, [r4]
	movs r2, #0
	bl sub_08086A58
	ldrb r0, [r5]
	ldr r1, _08085C1C @ =gUnknown_03005930
	ldrh r1, [r1]
	adds r0, r0, r1
	bl sub_08086F3C
	movs r2, #0x4e
	add r2, sb
	mov sl, r2
	b _08085C8C
	.align 2, 0
_08085C08: .4byte 0x06010000
_08085C0C: .4byte gUnknown_081D93FC
_08085C10: .4byte gUnknown_03002B6C
_08085C14: .4byte gUnknown_03003FC0
_08085C18: .4byte gUnknown_03005900
_08085C1C: .4byte gUnknown_03005930
_08085C20:
	mov r0, r8
	ldr r1, [r0]
	movs r0, #5
	str r0, [r1]
	ldr r6, _08085C38 @ =gUnknown_081D9400
	ldr r4, _08085C3C @ =gUnknown_081D9404
	ldr r7, _08085C40 @ =gUnknown_081D9408
	movs r1, #0x4e
	add r1, sb
	mov sl, r1
	b _08085C56
	.align 2, 0
_08085C38: .4byte gUnknown_081D9400
_08085C3C: .4byte gUnknown_081D9404
_08085C40: .4byte gUnknown_081D9408
_08085C44:
	ldrh r0, [r5]
	subs r0, #1
	strh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bgt _08085C56
	movs r0, #8
	strh r0, [r5]
_08085C56:
	ldr r5, [r6]
	ldrb r0, [r5]
	bl sub_08037448
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08085C44
	ldr r4, [r4]
	movs r2, #0
	ldrsh r0, [r5, r2]
	adds r0, r0, r4
	ldrb r0, [r0]
	mov r2, r8
	ldr r1, [r2]
	ldr r1, [r1]
	movs r2, #0
	bl sub_08086A58
	movs r1, #0
	ldrsh r0, [r5, r1]
	adds r0, r0, r4
	ldrb r0, [r0]
	ldr r1, [r7]
	ldrh r1, [r1]
	adds r0, r0, r1
	bl sub_08086F3C
_08085C8C:
	ldr r2, _08085D34 @ =gUnknown_0300251C
	ldrb r1, [r2, #1]
	movs r0, #0x20
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x1b
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r2, _08085D38 @ =gUnknown_03001FE8
	ldrb r1, [r2, #1]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #1]
	add r1, sp, #0xc
	movs r0, #0
	strh r0, [r1]
	ldr r1, [r2]
	lsls r1, r1, #0x13
	lsrs r1, r1, #0x1b
	lsls r1, r1, #0xb
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	ldr r2, _08085D3C @ =0x01000800
	add r0, sp, #0xc
	bl CpuSet
	mov r0, sb
	bl sub_08078D80
	ldr r0, _08085D40 @ =gUnknown_085802CC
	ldr r1, _08085D44 @ =gUnknown_0200FC50
	movs r2, #1
	str r2, [sp]
	str r2, [sp, #4]
	mov r2, sb
	str r2, [sp, #8]
	movs r2, #0
	movs r3, #0
	bl sub_08073304
	ldr r0, _08085D48 @ =gUnknown_030030B4
	ldr r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	lsls r0, r0, #0xe
	ldr r1, _08085D4C @ =0x06006C00
	adds r0, r0, r1
	movs r1, #0
	movs r2, #0
	bl sub_0802D5A0
	ldr r0, _08085D50 @ =gUnknown_03003FC0
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _08085D58
	movs r0, #1
	rsbs r0, r0, #0
	mov r2, r8
	ldr r1, [r2]
	ldr r3, [r1]
	lsls r3, r3, #1
	adds r3, #2
	ldr r5, _08085D54 @ =gUnknown_08499580
	ldr r1, [r5]
	str r1, [sp]
	movs r4, #0
	str r4, [sp, #4]
	movs r1, #4
	movs r2, #0xe
	bl sub_0801A368
	ldr r0, [r5]
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x12
	movs r1, #0
	movs r2, #0xd
	movs r3, #4
	bl sub_0801A368
	b _08085D9E
	.align 2, 0
_08085D34: .4byte gUnknown_0300251C
_08085D38: .4byte gUnknown_03001FE8
_08085D3C: .4byte 0x01000800
_08085D40: .4byte gUnknown_085802CC
_08085D44: .4byte gUnknown_0200FC50
_08085D48: .4byte gUnknown_030030B4
_08085D4C: .4byte 0x06006C00
_08085D50: .4byte gUnknown_03003FC0
_08085D54: .4byte gUnknown_08499580
_08085D58:
	movs r6, #1
	rsbs r6, r6, #0
	mov r1, r8
	ldr r0, [r1]
	ldr r3, [r0]
	lsls r3, r3, #1
	adds r3, #2
	ldr r5, _08085EE8 @ =gUnknown_08499580
	ldr r0, [r5]
	str r0, [sp]
	movs r4, #0
	str r4, [sp, #4]
	adds r0, r6, #0
	movs r1, #8
	movs r2, #0xc
	bl sub_0801A368
	ldr r0, [r5]
	str r0, [sp]
	str r4, [sp, #4]
	adds r0, r6, #0
	movs r1, #4
	movs r2, #0xc
	movs r3, #4
	bl sub_0801A368
	ldr r0, [r5]
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x12
	movs r1, #0
	movs r2, #0xd
	movs r3, #4
	bl sub_0801A368
_08085D9E:
	bl sub_08013B0C
	bl sub_080116E8
	ldr r0, _08085EEC @ =gUnknown_084892EC
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r2, _08085EF0 @ =0x06010A00
	movs r0, #6
	movs r1, #0
	movs r3, #1
	bl sub_0803F6BC
	ldr r2, _08085EF4 @ =0x06010B00
	movs r0, #0xe
	movs r1, #0
	movs r3, #1
	bl sub_0803F6BC
	ldr r2, _08085EF8 @ =0x06010C00
	movs r0, #0xa
	movs r1, #0
	movs r3, #1
	bl sub_0803F6BC
	ldr r2, _08085EFC @ =0x06010D00
	movs r0, #0xb
	movs r1, #0
	movs r3, #1
	bl sub_0803F6BC
	movs r0, #6
	movs r1, #0
	bl sub_0802A8AC
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08085F00 @ =gUnknown_0823E140
	ldr r4, _08085F04 @ =gUnknown_0200FC50
	adds r1, r4, #0
	bl Decompress
	ldr r2, _08085F08 @ =0x06010E80
	mov r8, r2
	movs r0, #0xa0
	lsls r0, r0, #3
	adds r7, r4, r0
	ldr r6, _08085F0C @ =0x06010E00
	movs r1, #0x80
	lsls r1, r1, #1
	adds r4, r4, r1
	movs r5, #1
_08085E12:
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0x20
	bl CpuFastSet
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x20
	bl CpuFastSet
	movs r2, #0x80
	lsls r2, r2, #1
	add r8, r2
	adds r7, #0x80
	adds r6, r6, r2
	adds r4, #0x80
	subs r5, #1
	cmp r5, #0
	bge _08085E12
	ldr r4, _08085F10 @ =gUnknown_0200FE50
	ldr r1, _08085F14 @ =0x06011000
	adds r0, r4, #0
	movs r2, #0x10
	bl CpuFastSet
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r4, r1
	ldr r1, _08085F18 @ =0x06011040
	movs r2, #0x10
	bl CpuFastSet
	ldr r0, _08085F1C @ =gUnknown_0823E550
	movs r1, #0xa8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08085F20 @ =gUnknown_0823E654
	ldr r2, _08085F24 @ =0xFFFFFE00
	adds r4, r4, r2
	adds r1, r4, #0
	bl Decompress
	ldr r6, _08085F28 @ =0x06011100
	movs r5, #2
_08085E6E:
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #8
	bl CpuFastSet
	adds r6, #0x20
	adds r4, #0x20
	subs r5, #1
	cmp r5, #0
	bge _08085E6E
	ldr r0, _08085F04 @ =gUnknown_0200FC50
	ldr r6, _08085F2C @ =0x06011160
	adds r4, r0, #0
	adds r4, #0x60
	movs r5, #4
_08085E8C:
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #8
	bl CpuFastSet
	adds r6, #0x20
	adds r4, #0x20
	subs r5, #1
	cmp r5, #0
	bge _08085E8C
	movs r4, #0
	ldr r0, _08085F30 @ =gUnknown_08239DE4
	movs r1, #0xb0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	mov r0, sl
	strh r4, [r0]
	bl sub_08087248
	ldr r1, _08085F34 @ =gUnknown_03002B34
	strh r0, [r1]
	bl sub_08087298
	ldr r1, _08085F38 @ =gUnknown_03002F18
	strh r0, [r1]
	bl sub_08085F40
	movs r0, #0xc8
	lsls r0, r0, #1
	bl sub_0803B524
	ldr r0, _08085F3C @ =gUnknown_08616CF4
	mov r1, sb
	bl Proc_Start
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08085EE8: .4byte gUnknown_08499580
_08085EEC: .4byte gUnknown_084892EC
_08085EF0: .4byte 0x06010A00
_08085EF4: .4byte 0x06010B00
_08085EF8: .4byte 0x06010C00
_08085EFC: .4byte 0x06010D00
_08085F00: .4byte gUnknown_0823E140
_08085F04: .4byte gUnknown_0200FC50
_08085F08: .4byte 0x06010E80
_08085F0C: .4byte 0x06010E00
_08085F10: .4byte gUnknown_0200FE50
_08085F14: .4byte 0x06011000
_08085F18: .4byte 0x06011040
_08085F1C: .4byte gUnknown_0823E550
_08085F20: .4byte gUnknown_0823E654
_08085F24: .4byte 0xFFFFFE00
_08085F28: .4byte 0x06011100
_08085F2C: .4byte 0x06011160
_08085F30: .4byte gUnknown_08239DE4
_08085F34: .4byte gUnknown_03002B34
_08085F38: .4byte gUnknown_03002F18
_08085F3C: .4byte gUnknown_08616CF4

