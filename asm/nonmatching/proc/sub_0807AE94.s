	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807AE94
sub_0807AE94: @ 0x0807AE94
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r1, r7, #0
	adds r1, #0x4c
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0x20
	bgt _0807AEB8
	adds r3, r0, #0
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	b _0807AF34
_0807AEB8:
	cmp r0, #0x24
	bgt _0807AECE
	movs r2, #0
	ldrsh r3, [r1, r2]
	subs r3, #0x20
	movs r0, #4
	str r0, [sp]
	movs r0, #0
	movs r1, #0xf0
	movs r2, #0xe0
	b _0807AF36
_0807AECE:
	cmp r0, #0x28
	bgt _0807AEE2
	movs r0, #0
	ldrsh r3, [r1, r0]
	subs r3, #0x24
	movs r0, #4
	str r0, [sp]
	movs r0, #0
	movs r1, #0xe0
	b _0807AF34
_0807AEE2:
	cmp r0, #0x2a
	bgt _0807AEF8
	movs r2, #0
	ldrsh r3, [r1, r2]
	subs r3, #0x28
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r1, #0xf0
	movs r2, #0xe8
	b _0807AF36
_0807AEF8:
	cmp r0, #0x2c
	bgt _0807AF0C
	movs r0, #0
	ldrsh r3, [r1, r0]
	subs r3, #0x2a
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r1, #0xe8
	b _0807AF34
_0807AF0C:
	cmp r0, #0x2d
	bgt _0807AF22
	movs r2, #0
	ldrsh r3, [r1, r2]
	subs r3, #0x2c
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0xf0
	movs r2, #0xec
	b _0807AF36
_0807AF22:
	cmp r0, #0x2e
	bgt _0807AF3E
	movs r0, #0
	ldrsh r3, [r1, r0]
	subs r3, #0x2d
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0xec
_0807AF34:
	movs r2, #0xf0
_0807AF36:
	bl Interpolate
	str r0, [r7, #0x34]
	b _0807AFAE
_0807AF3E:
	movs r0, #0
	strh r0, [r1]
	ldr r0, [r7, #0x3c]
	cmp r0, #0
	bne _0807AF5C
	ldr r0, _0807AF54 @ =gUnknown_0822B944
	ldr r1, _0807AF58 @ =gUnknown_0849957C
	ldr r1, [r1]
	bl Decompress
	b _0807AF66
	.align 2, 0
_0807AF54: .4byte gUnknown_0822B944
_0807AF58: .4byte gUnknown_0849957C
_0807AF5C:
	ldr r0, _0807B09C @ =gUnknown_0822BCF0
	ldr r1, _0807B0A0 @ =gUnknown_0849957C
	ldr r1, [r1]
	bl Decompress
_0807AF66:
	bl sub_08013AFC
	ldr r0, _0807B0A4 @ =gUnknown_08616034
	adds r1, r7, #0
	bl Proc_Start
	ldr r1, [r7, #0x3c]
	str r1, [r0, #0x3c]
	ldr r2, _0807B0A8 @ =gUnknown_030030B4
	ldrb r1, [r2, #1]
	movs r0, #0x20
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0xf
	orrs r0, r1
	strb r0, [r2, #1]
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	bl sub_08013CA8
	bl sub_08013B0C
	bl sub_0807A908
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_0801A5B0
	adds r0, r7, #0
	bl Proc_Break
_0807AFAE:
	adds r4, r7, #0
	adds r4, #0x4c
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0x20
	bne _0807AFC0
	movs r0, #0x78
	bl sub_0803B4DC
_0807AFC0:
	ldr r2, _0807B0AC @ =gUnknown_03002B34
	ldr r1, [r7, #0x34]
	movs r0, #0xf0
	subs r0, r0, r1
	strh r0, [r2]
	ldr r0, _0807B0B0 @ =gUnknown_030030A0
	subs r1, #0xf0
	strh r1, [r0]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldr r0, [r7, #0x3c]
	cmp r0, #0
	bne _0807B0D0
	ldr r0, _0807B0B4 @ =gUnknown_081D931C
	ldr r1, [r0]
	ldrb r1, [r1, #8]
	subs r4, r1, #1
	mov r8, r0
	cmp r4, #0
	blt _0807B03E
	ldr r2, _0807B0B8 @ =gUnknown_086160A4
	mov sb, r2
	lsls r0, r4, #3
	adds r0, r0, r4
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	adds r6, r0, r1
	lsls r0, r4, #0xc
	movs r2, #0x90
	lsls r2, r2, #8
	adds r5, r0, r2
_0807B002:
	mov r1, r8
	ldr r0, [r1]
	ldrb r0, [r0, #8]
	subs r0, #1
	lsls r0, r0, #1
	mov r1, sb
	adds r2, r0, r1
	ldr r1, _0807B0BC @ =gUnknown_086160C8
	adds r0, r0, r1
	ldrh r0, [r0]
	muls r0, r4, r0
	ldrh r2, [r2]
	adds r0, r0, r2
	ldr r1, [r7, #0x34]
	subs r1, #0xf0
	adds r0, r0, r1
	ldr r1, _0807B0C0 @ =0x000001FF
	ands r0, r1
	adds r2, r6, #0
	orrs r2, r5
	movs r1, #0x30
	movs r3, #0
	bl sub_08043FD8
	subs r6, #0x24
	ldr r2, _0807B0C4 @ =0xFFFFF000
	adds r5, r5, r2
	subs r4, #1
	cmp r4, #0
	bge _0807B002
_0807B03E:
	movs r4, #0
	mov r1, r8
	ldr r0, [r1]
	ldrb r2, [r0, #9]
	cmp r4, r2
	bge _0807B128
	ldr r1, _0807B0C8 @ =gUnknown_086160AC
	mov r8, r1
	adds r6, r0, #0
	movs r5, #0xb6
	lsls r5, r5, #1
_0807B054:
	ldrb r0, [r6, #9]
	subs r0, #1
	lsls r2, r0, #2
	add r2, r8
	ldr r1, _0807B0CC @ =gUnknown_086160CE
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #2
	subs r0, r0, r4
	muls r1, r0, r1
	ldr r0, [r2]
	subs r0, r0, r1
	ldr r1, [r7, #0x34]
	subs r1, #0xf0
	subs r0, r0, r1
	ldr r1, _0807B0C0 @ =0x000001FF
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #5
	orrs r0, r1
	adds r2, r4, #0
	adds r2, #0xc
	lsls r2, r2, #0xc
	orrs r2, r5
	movs r1, #0xa0
	movs r3, #0
	bl sub_08043FD8
	adds r5, #0x24
	adds r4, #1
	ldrb r2, [r6, #9]
	cmp r4, r2
	blt _0807B054
	b _0807B128
	.align 2, 0
_0807B09C: .4byte gUnknown_0822BCF0
_0807B0A0: .4byte gUnknown_0849957C
_0807B0A4: .4byte gUnknown_08616034
_0807B0A8: .4byte gUnknown_030030B4
_0807B0AC: .4byte gUnknown_03002B34
_0807B0B0: .4byte gUnknown_030030A0
_0807B0B4: .4byte gUnknown_081D931C
_0807B0B8: .4byte gUnknown_086160A4
_0807B0BC: .4byte gUnknown_086160C8
_0807B0C0: .4byte 0x000001FF
_0807B0C4: .4byte 0xFFFFF000
_0807B0C8: .4byte gUnknown_086160AC
_0807B0CC: .4byte gUnknown_086160CE
_0807B0D0:
	movs r4, #0
	ldr r0, _0807B138 @ =gUnknown_0202FDEC
	ldrb r1, [r0, #8]
	cmp r4, r1
	bge _0807B128
	ldr r2, _0807B13C @ =gUnknown_086160B8
	mov r8, r2
	adds r6, r0, #0
	movs r5, #0x80
	lsls r5, r5, #1
_0807B0E4:
	ldrb r0, [r6, #8]
	subs r0, #1
	lsls r2, r0, #2
	add r2, r8
	ldr r1, _0807B140 @ =gUnknown_086160D4
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #3
	subs r0, r0, r4
	muls r1, r0, r1
	ldr r0, [r2]
	subs r0, r0, r1
	ldr r1, [r7, #0x34]
	subs r1, #0xf0
	subs r0, r0, r1
	ldr r1, _0807B144 @ =0x000001FF
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #5
	orrs r0, r1
	adds r2, r4, #0
	adds r2, #9
	lsls r2, r2, #0xc
	orrs r2, r5
	movs r1, #0xa0
	movs r3, #0
	bl sub_08043FD8
	adds r5, #0x24
	adds r4, #1
	ldrb r0, [r6, #8]
	cmp r4, r0
	blt _0807B0E4
_0807B128:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807B138: .4byte gUnknown_0202FDEC
_0807B13C: .4byte gUnknown_086160B8
_0807B140: .4byte gUnknown_086160D4
_0807B144: .4byte 0x000001FF

