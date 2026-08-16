	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080566C8
sub_080566C8: @ 0x080566C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x54
	movs r0, #0
	str r0, [sp, #0x20]
	mov r1, sp
	adds r1, #4
	str r1, [sp, #0x34]
	mov r2, sp
	adds r2, #8
	str r2, [sp, #0x3c]
	mov r3, sp
	adds r3, #0xc
	str r3, [sp, #0x40]
	mov r4, sp
	adds r4, #0x18
	str r4, [sp, #0x4c]
	mov r0, sp
	adds r0, #0x1c
	str r0, [sp, #0x50]
	add r7, sp, #0x10
	adds r1, #0x10
	str r1, [sp, #0x48]
	movs r2, #0x12
	add r2, sp
	mov sb, r2
	movs r3, #0x16
	add r3, sp
	mov sl, r3
	subs r4, #0xa
	str r4, [sp, #0x44]
	subs r0, #0x16
	str r0, [sp, #0x38]
	subs r1, #0x12
	str r1, [sp, #0x30]
	ldr r2, _08056AF0 @ =gUnknown_085D6A48
	mov r8, r2
	ldr r6, _08056AF4 @ =gUnknown_03004580
	ldr r3, _08056AF8 @ =gUnknown_08555850
	mov ip, r3
_0805671E:
	ldr r4, [sp, #0x20]
	lsls r3, r4, #1
	mov r0, sp
	adds r5, r0, r3
	lsls r2, r4, #4
	adds r4, r6, #2
	adds r4, r2, r4
	ldrh r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	add r0, r8
	ldrh r0, [r0]
	strh r0, [r5]
	ldr r0, [sp, #0x34]
	adds r1, r0, r3
	adds r0, r6, #4
	adds r0, r2, r0
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r0, [sp, #0x3c]
	adds r1, r0, r3
	adds r0, r2, r6
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, [sp, #0x40]
	adds r5, r1, r3
	ldrh r0, [r4]
	strh r0, [r5]
	ldr r0, [sp, #0x4c]
	adds r4, r0, r3
	adds r0, r6, #6
	adds r0, r2, r0
	ldrh r0, [r0]
	strh r0, [r4]
	ldr r0, [sp, #0x50]
	adds r1, r0, r3
	ldr r0, _08056AFC @ =gUnknown_03004588
	adds r2, r2, r0
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, r7, r3
	ldrh r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	add r0, r8
	ldrh r0, [r0, #2]
	strh r0, [r2]
	ldrh r0, [r5]
	cmp r0, #1
	bhi _08056794
	ldrh r0, [r4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	add r1, ip
	ldrh r0, [r1]
	strh r0, [r2]
_08056794:
	ldr r0, [sp, #0x20]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x20]
	cmp r0, #1
	bls _0805671E
	ldr r2, _08056B00 @ =gUnknown_08552118
	mov r1, sb
	ldrh r0, [r1]
	lsls r0, r0, #1
	ldrh r1, [r7]
	lsls r1, r1, #3
	adds r0, r0, r1
	adds r0, r0, r2
	ldrh r0, [r0]
	ldr r3, [sp, #0x48]
	strh r0, [r3]
	ldrh r0, [r7]
	lsls r0, r0, #1
	mov r4, sb
	ldrh r1, [r4]
	lsls r1, r1, #3
	adds r0, r0, r1
	adds r0, r0, r2
	ldrh r2, [r0]
	mov r0, sl
	strh r2, [r0]
	ldr r0, _08056B04 @ =gUnknown_020296B0
	ldrh r1, [r3]
	strb r1, [r0, #0x1c]
	adds r0, #0x44
	strb r2, [r0]
	ldr r1, [sp, #0x40]
	ldrh r0, [r1]
	ldrh r1, [r3]
	ldr r3, [sp, #0x34]
	ldrh r2, [r3]
	bl sub_08056D70
	ldr r4, [sp, #0x34]
	strh r0, [r4]
	ldr r1, [sp, #0x44]
	ldrh r0, [r1]
	mov r2, sl
	ldrh r1, [r2]
	ldr r3, [sp, #0x38]
	ldrh r2, [r3]
	bl sub_08056D70
	ldr r4, [sp, #0x38]
	strh r0, [r4]
	movs r0, #0
	str r0, [sp, #0x20]
	ldr r1, _08056B08 @ =gUnknown_02029BA8
	str r1, [sp, #0x24]
	ldr r2, _08056B0C @ =gUnknown_085D70A8
	str r2, [sp, #0x28]
	ldr r3, _08056B10 @ =gUnknown_085D7768
	str r3, [sp, #0x2c]
_0805680C:
	ldr r4, [sp, #0x20]
	lsls r7, r4, #1
	ldr r0, [sp, #0x40]
	adds r5, r0, r7
	ldrh r0, [r5]
	ldr r2, [sp, #0x4c]
	adds r1, r2, r7
	ldrh r1, [r1]
	ldr r6, _08056B14 @ =gUnknown_08562128
	ldr r3, [sp, #0x50]
	adds r4, r3, r7
	ldrh r2, [r4]
	adds r2, r2, r6
	ldrb r2, [r2]
	bl sub_08057D58
	adds r3, r0, #0
	cmp r3, #0
	bne _08056848
	ldr r3, _08056B18 @ =gUnknown_085D64A8
	ldrh r2, [r4]
	adds r2, r2, r6
	ldrh r1, [r5]
	lsls r0, r1, #2
	adds r0, r0, r1
	ldrb r2, [r2]
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
_08056848:
	ldr r4, [sp, #0x20]
	lsls r5, r4, #5
	ldr r0, [sp, #0x24]
	adds r2, r5, r0
	ldr r1, [sp, #0x34]
	adds r6, r1, r7
	ldrh r0, [r6]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r0, r3, #0
	adds r0, #0x18
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2]
	ldr r2, [sp, #0x24]
	adds r2, #4
	adds r2, r5, r2
	ldrh r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r3, r0
	ldrb r0, [r0, #0x1c]
	str r0, [r2]
	ldr r2, [sp, #0x24]
	adds r2, #8
	adds r2, r5, r2
	ldrh r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r3, r0
	ldrb r0, [r0, #0x1d]
	str r0, [r2]
	ldr r2, [sp, #0x24]
	adds r2, #0xc
	adds r2, r5, r2
	ldrh r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r3, r0
	ldrb r0, [r0, #0x1e]
	str r0, [r2]
	ldr r2, [sp, #0x24]
	adds r2, #0x10
	adds r2, r5, r2
	ldr r4, [sp, #0x48]
	adds r4, r4, r7
	mov sl, r4
	ldrh r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldrh r1, [r4]
	adds r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x1f
	adds r1, r1, r0
	ldrb r0, [r1]
	str r0, [r2]
	ldr r2, [sp, #0x24]
	adds r2, #0x14
	adds r2, r5, r2
	ldrh r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r3, r0
	adds r0, #0x22
	ldrb r0, [r0]
	str r0, [r2]
	ldrh r0, [r6]
	lsls r0, r0, #3
	adds r0, r3, r0
	ldr r0, [r0]
	ldr r1, _08056B1C @ =gUnknown_08553850
	ldr r2, [sp, #0x20]
	lsls r4, r2, #2
	adds r4, r4, r1
	ldr r1, [r4]
	bl Decompress
	ldr r0, [sp, #0x24]
	adds r0, #0x18
	adds r0, r5, r0
	ldr r1, [r4]
	str r1, [r0]
	ldr r3, _08056B20 @ =gUnknown_02029BC4
	adds r5, r5, r3
	ldr r0, [r4]
	str r0, [r5]
	ldr r4, [sp, #0x20]
	lsls r4, r4, #3
	mov sb, r4
	ldr r3, _08056B24 @ =gUnknown_02029700
	add r3, sb
	mov r0, sl
	ldrh r2, [r0]
	lsls r2, r2, #2
	ldrh r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r2, r2, r0
	mov r1, sp
	adds r1, r1, r7
	mov r8, r1
	ldrh r1, [r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r2, r2, r0
	ldr r0, [sp, #0x28]
	adds r0, #0xc
	adds r2, r2, r0
	ldr r0, [r2]
	str r0, [r3]
	ldr r3, _08056B28 @ =gUnknown_02029704
	add r3, sb
	ldrh r0, [r6]
	lsls r2, r0, #1
	adds r2, r2, r0
	mov r4, r8
	ldrh r1, [r4]
	lsls r0, r1, #3
	adds r0, r0, r1
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _08056B2C @ =gUnknown_085D70B0
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r3]
	ldr r3, _08056B30 @ =gUnknown_02029A00
	mov r2, sb
	adds r4, r2, r3
	mov r0, sl
	ldrh r2, [r0]
	lsls r2, r2, #2
	ldrh r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r2, r2, r0
	mov r0, r8
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r2, r2, r0
	ldr r0, [sp, #0x2c]
	adds r0, #0xc
	adds r2, r2, r0
	ldr r0, [r2]
	str r0, [r4]
	adds r3, #4
	add r3, sb
	ldrh r0, [r6]
	lsls r2, r0, #1
	adds r2, r2, r0
	mov r4, r8
	ldrh r1, [r4]
	lsls r0, r1, #3
	adds r0, r0, r1
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r1, _08056B34 @ =gUnknown_085D7770
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r3]
	movs r0, #0x58
	ldr r2, [sp, #0x20]
	adds r5, r2, #0
	muls r5, r0, r5
	ldr r3, _08056B38 @ =gUnknown_02029710
	adds r3, #4
	adds r3, r5, r3
	ldr r4, _08056B3C @ =gUnknown_08553D80
	ldr r0, [sp, #0x3c]
	adds r0, r0, r7
	mov sl, r0
	ldrh r0, [r0]
	lsls r2, r0, #2
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r1, _08056AF0 @ =gUnknown_085D6A48
	mov ip, r1
	mov r0, r8
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0, #0x14]
	movs r6, #0x64
	muls r0, r6, r0
	adds r2, r2, r0
	adds r0, r4, #0
	adds r0, #0xc
	adds r2, r2, r0
	ldr r0, [r2]
	str r0, [r3]
	ldr r3, _08056B38 @ =gUnknown_02029710
	adds r3, #8
	adds r3, r5, r3
	mov r1, sl
	ldrh r0, [r1]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	mov r0, r8
	ldrh r2, [r0]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0, #0x14]
	muls r0, r6, r0
	adds r1, r1, r0
	adds r4, #8
	adds r1, r1, r4
	ldr r0, [r1]
	str r0, [r3]
	ldr r1, _08056B38 @ =gUnknown_02029710
	adds r5, r5, r1
	ldr r6, _08056B40 @ =gUnknown_08553C18
	mov r2, r8
	ldrh r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r1, [r0, #0x14]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrh r0, [r0]
	strh r0, [r5, #0x16]
	ldrh r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r1, [r0, #0x14]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r7, r0
	adds r1, r6, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r5, #0x18]
	ldrh r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r1, [r0, #0x14]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrh r0, [r0, #6]
	strh r0, [r5, #0x1a]
	ldr r3, _08056B44 @ =gUnknown_020297C0
	ldr r4, [sp, #0x20]
	add sb, r4
	mov r0, sb
	lsls r0, r0, #2
	mov sb, r0
	adds r2, r3, #0
	adds r2, #0x18
	add r2, sb
	ldr r4, _08056B48 @ =gUnknown_085D6EC8
	mov r0, r8
	ldrh r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0xc
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2]
	adds r2, r3, #0
	adds r2, #0x1c
	add r2, sb
	mov r0, r8
	ldrh r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x10
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2]
	adds r0, r3, #0
	adds r0, #0x20
	add sb, r0
	mov r2, r8
	ldrh r1, [r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #8
	adds r0, r0, r1
	ldr r0, [r0]
	mov r3, sb
	str r0, [r3]
	ldr r0, [sp, #0x20]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x20]
	cmp r0, #1
	bhi _08056ACA
	b _0805680C
_08056ACA:
	movs r4, #0
	mov sl, r4
	ldr r0, _08056B38 @ =gUnknown_02029710
	mov sb, r0
	adds r5, r6, #0
	mov r4, ip
	mov r7, sp
	ldr r6, [sp, #0x30]
	ldr r1, _08056B4C @ =gUnknown_020298E0
	mov r8, r1
	movs r2, #0x76
	add r2, r8
	mov ip, r2
_08056AE4:
	mov r0, sl
	lsls r3, r0, #1
	mov r2, sb
	adds r2, #0x26
	adds r2, r3, r2
	b _08056B50
	.align 2, 0
_08056AF0: .4byte gUnknown_085D6A48
_08056AF4: .4byte gUnknown_03004580
_08056AF8: .4byte gUnknown_08555850
_08056AFC: .4byte gUnknown_03004588
_08056B00: .4byte gUnknown_08552118
_08056B04: .4byte gUnknown_020296B0
_08056B08: .4byte gUnknown_02029BA8
_08056B0C: .4byte gUnknown_085D70A8
_08056B10: .4byte gUnknown_085D7768
_08056B14: .4byte gUnknown_08562128
_08056B18: .4byte gUnknown_085D64A8
_08056B1C: .4byte gUnknown_08553850
_08056B20: .4byte gUnknown_02029BC4
_08056B24: .4byte gUnknown_02029700
_08056B28: .4byte gUnknown_02029704
_08056B2C: .4byte gUnknown_085D70B0
_08056B30: .4byte gUnknown_02029A00
_08056B34: .4byte gUnknown_085D7770
_08056B38: .4byte gUnknown_02029710
_08056B3C: .4byte gUnknown_08553D80
_08056B40: .4byte gUnknown_08553C18
_08056B44: .4byte gUnknown_020297C0
_08056B48: .4byte gUnknown_085D6EC8
_08056B4C: .4byte gUnknown_020298E0
_08056B50:
	ldrh r1, [r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r1, [r0, #0x14]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r0, [r0, #0xc]
	strh r0, [r2]
	mov r2, sb
	adds r2, #0x30
	adds r2, r3, r2
	ldrh r1, [r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r1, [r0, #0x14]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r0, [r0, #0xe]
	strh r0, [r2]
	mov r2, sb
	adds r2, #0x44
	adds r2, r3, r2
	ldrh r1, [r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r1, [r0, #0x14]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r0, [r0, #0x12]
	strh r0, [r2]
	mov r2, sb
	adds r2, #0x4e
	adds r2, r3, r2
	ldrh r1, [r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r1, [r0, #0x14]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r0, [r0, #0x14]
	strh r0, [r2]
	mov r2, sb
	adds r2, #0x7e
	adds r2, r3, r2
	ldrh r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r1, [r0, #0x14]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r0, [r0, #0xc]
	rsbs r0, r0, #0
	strh r0, [r2]
	mov r2, sb
	adds r2, #0x88
	adds r2, r3, r2
	ldrh r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r1, [r0, #0x14]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r0, [r0, #0xe]
	rsbs r0, r0, #0
	strh r0, [r2]
	mov r2, sb
	adds r2, #0x9c
	adds r2, r3, r2
	ldrh r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r1, [r0, #0x14]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r0, [r0, #0x12]
	strh r0, [r2]
	ldr r1, _08056D6C @ =gUnknown_020297B6
	adds r2, r3, r1
	ldrh r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r1, [r0, #0x14]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r0, [r0, #0x14]
	strh r0, [r2]
	mov r2, r8
	adds r2, #0xe8
	adds r2, r3, r2
	ldrh r1, [r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r1, [r0, #0x14]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r0, [r0, #0x18]
	strh r0, [r2]
	mov r2, r8
	adds r2, #0xf2
	adds r2, r3, r2
	ldrh r1, [r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r1, [r0, #0x14]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r0, [r0, #0x1a]
	strh r0, [r2]
	mov r2, r8
	adds r2, #0xfc
	adds r2, r3, r2
	ldrh r1, [r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r1, [r0, #0x14]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r0, [r0, #0x1e]
	strh r0, [r2]
	movs r2, #0x83
	lsls r2, r2, #1
	add r2, r8
	adds r2, r3, r2
	ldrh r1, [r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r1, [r0, #0x14]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r0, [r0, #0x20]
	strh r0, [r2]
	mov r2, r8
	adds r2, #0x58
	adds r2, r3, r2
	ldrh r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r1, [r0, #0x14]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r0, [r0, #0x18]
	rsbs r0, r0, #0
	strh r0, [r2]
	mov r2, r8
	adds r2, #0x62
	adds r2, r3, r2
	ldrh r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r1, [r0, #0x14]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r0, [r0, #0x1a]
	rsbs r0, r0, #0
	strh r0, [r2]
	mov r2, r8
	adds r2, #0x6c
	adds r2, r3, r2
	ldrh r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r1, [r0, #0x14]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r0, [r0, #0x1e]
	strh r0, [r2]
	add r3, ip
	ldrh r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r1, [r0, #0x14]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r0, [r0, #0x20]
	strh r0, [r3]
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	cmp r0, #4
	bhi _08056D3E
	b _08056AE4
_08056D3E:
	ldr r2, [sp, #0x40]
	ldrh r1, [r2]
	ldr r3, [sp, #0x34]
	ldrh r2, [r3]
	movs r0, #0
	bl sub_08056D8C
	ldr r4, [sp, #0x44]
	ldrh r1, [r4]
	ldr r0, [sp, #0x38]
	ldrh r2, [r0]
	movs r0, #1
	bl sub_08056D8C
	add sp, #0x54
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08056D6C: .4byte gUnknown_020297B6

