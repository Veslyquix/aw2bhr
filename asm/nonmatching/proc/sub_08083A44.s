	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08083A44
sub_08083A44: @ 0x08083A44
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	movs r5, #0
	mov r6, r8
	adds r6, #0x52
	ldr r7, _08083AA0 @ =gUnknown_0861696C
	ldr r0, _08083AA4 @ =gUnknown_08616972
	mov sl, r0
_08083A5E:
	cmp r5, #2
	bne _08083AB8
	ldrh r0, [r6]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r7
	ldrb r3, [r0]
	adds r3, #2
	lsls r3, r3, #0xc
	ldr r0, _08083AA8 @ =0x00000998
	orrs r3, r0
	mov r1, sl
	ldrh r0, [r1, #6]
	ldr r2, _08083AAC @ =0x000001FF
	adds r1, r2, #0
	ands r1, r0
	ldr r0, _08083AB0 @ =gUnknown_08616980
	movs r4, #6
	ldrsh r2, [r0, r4]
	subs r2, #8
	str r3, [sp]
	movs r0, #2
	ldr r3, _08083AB4 @ =gUnknown_08615C76
	bl PutSprite
	movs r5, #0x52
	add r5, r8
	mov sb, r5
	movs r4, #3
	b _08083B0E
	.align 2, 0
_08083AA0: .4byte gUnknown_0861696C
_08083AA4: .4byte gUnknown_08616972
_08083AA8: .4byte 0x00000998
_08083AAC: .4byte 0x000001FF
_08083AB0: .4byte gUnknown_08616980
_08083AB4: .4byte gUnknown_08615C76
_08083AB8:
	ldrh r0, [r6]
	adds r0, r0, r5
	movs r1, #6
	bl DivRem
	adds r4, r0, #0
	ldrh r0, [r6]
	adds r0, r0, r5
	movs r1, #6
	bl DivRem
	adds r4, r4, r7
	ldrb r3, [r4]
	adds r3, #2
	lsls r3, r3, #0xc
	adds r0, r0, r7
	ldrb r0, [r0]
	lsls r0, r0, #5
	movs r1, #0xec
	lsls r1, r1, #1
	adds r0, r0, r1
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	orrs r3, r0
	adds r4, r5, #1
	lsls r2, r4, #1
	mov r5, sl
	adds r0, r2, r5
	movs r5, #0
	ldrsh r1, [r0, r5]
	ldr r0, _08083B50 @ =gUnknown_08616980
	adds r2, r2, r0
	movs r0, #0
	ldrsh r2, [r2, r0]
	str r3, [sp]
	movs r0, #2
	ldr r3, _08083B54 @ =gUnknown_08615C84
	bl PutSprite
	movs r1, #0x52
	add r1, r8
	mov sb, r1
_08083B0E:
	adds r5, r4, #0
	cmp r5, #4
	ble _08083A5E
	ldr r4, _08083B58 @ =gUnknown_0861696C
	mov r2, sb
	ldrh r0, [r2]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _08083BB0
	movs r5, #0
	ldr r4, _08083B5C @ =gUnknown_081D93D4
	mov sl, r4
	movs r6, #0xa6
	lsls r6, r6, #2
	movs r4, #0x48
_08083B36:
	cmp r5, #0
	bne _08083B64
	bl sub_0803BC7C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08083B64
	ldr r7, _08083B60 @ =0x0000AA98
	str r7, [sp]
	movs r0, #3
	movs r1, #0x90
	movs r2, #0x48
	b _08083B84
	.align 2, 0
_08083B50: .4byte gUnknown_08616980
_08083B54: .4byte gUnknown_08615C84
_08083B58: .4byte gUnknown_0861696C
_08083B5C: .4byte gUnknown_081D93D4
_08083B60: .4byte 0x0000AA98
_08083B64:
	mov r0, r8
	adds r0, #0x66
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #2
	bl DivRem
	cmp r5, r0
	bne _08083B8E
	movs r0, #0x88
	lsls r0, r0, #8
	orrs r0, r6
	str r0, [sp]
	movs r0, #3
	movs r1, #0x90
	adds r2, r4, #0
_08083B84:
	mov r7, sl
	ldr r3, [r7]
	bl PutSprite
	b _08083BA4
_08083B8E:
	movs r0, #0xa0
	lsls r0, r0, #6
	orrs r0, r6
	str r0, [sp]
	movs r0, #3
	movs r1, #0x90
	adds r2, r4, #0
	mov r7, sl
	ldr r3, [r7]
	bl PutSprite
_08083BA4:
	adds r6, #0xc
	adds r4, #0x10
	adds r5, #1
	cmp r5, #1
	ble _08083B36
	b _08083D44
_08083BB0:
	mov r1, sb
	ldrh r0, [r1]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #1
	bne _08083C40
	movs r5, #0
	ldr r2, _08083BEC @ =gUnknown_081D93D4
	mov sl, r2
	movs r6, #0xa6
	lsls r6, r6, #2
	movs r4, #0x48
_08083BD0:
	cmp r5, #0
	bne _08083BF4
	bl sub_0803BC88
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08083BF4
	ldr r7, _08083BF0 @ =0x0000BA98
	str r7, [sp]
	movs r0, #3
	movs r1, #0x90
	movs r2, #0x48
	b _08083C14
	.align 2, 0
_08083BEC: .4byte gUnknown_081D93D4
_08083BF0: .4byte 0x0000BA98
_08083BF4:
	mov r0, r8
	adds r0, #0x66
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #2
	bl DivRem
	cmp r5, r0
	bne _08083C1E
	movs r0, #0x88
	lsls r0, r0, #8
	orrs r0, r6
	str r0, [sp]
	movs r0, #3
	movs r1, #0x90
	adds r2, r4, #0
_08083C14:
	mov r7, sl
	ldr r3, [r7]
	bl PutSprite
	b _08083C34
_08083C1E:
	movs r0, #0xe0
	lsls r0, r0, #6
	orrs r0, r6
	str r0, [sp]
	movs r0, #3
	movs r1, #0x90
	adds r2, r4, #0
	mov r7, sl
	ldr r3, [r7]
	bl PutSprite
_08083C34:
	adds r6, #0xc
	adds r4, #0x10
	adds r5, #1
	cmp r5, #1
	ble _08083BD0
	b _08083D44
_08083C40:
	mov r1, sb
	ldrh r0, [r1]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #5
	bne _08083CD0
	movs r5, #0
	ldr r2, _08083C7C @ =gUnknown_081D93D4
	mov sl, r2
	movs r6, #0xa6
	lsls r6, r6, #2
	movs r4, #0x48
_08083C60:
	cmp r5, #0
	bne _08083C84
	bl sub_0803BC94
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08083C84
	ldr r7, _08083C80 @ =0x0000CA98
	str r7, [sp]
	movs r0, #3
	movs r1, #0x90
	movs r2, #0x48
	b _08083CA4
	.align 2, 0
_08083C7C: .4byte gUnknown_081D93D4
_08083C80: .4byte 0x0000CA98
_08083C84:
	mov r0, r8
	adds r0, #0x66
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #2
	bl DivRem
	cmp r5, r0
	bne _08083CAE
	movs r0, #0x88
	lsls r0, r0, #8
	orrs r0, r6
	str r0, [sp]
	movs r0, #3
	movs r1, #0x90
	adds r2, r4, #0
_08083CA4:
	mov r7, sl
	ldr r3, [r7]
	bl PutSprite
	b _08083CC4
_08083CAE:
	movs r0, #0xf0
	lsls r0, r0, #7
	orrs r0, r6
	str r0, [sp]
	movs r0, #3
	movs r1, #0x90
	adds r2, r4, #0
	mov r7, sl
	ldr r3, [r7]
	bl PutSprite
_08083CC4:
	adds r6, #0xc
	adds r4, #0x10
	adds r5, #1
	cmp r5, #1
	ble _08083C60
	b _08083D44
_08083CD0:
	mov r1, sb
	ldrh r0, [r1]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #3
	bne _08083D44
	movs r5, #0
	ldr r2, _08083D20 @ =gUnknown_081D93D4
	mov sl, r2
	mov r4, r8
	adds r4, #0x66
	str r4, [sp, #4]
	movs r6, #0xac
	lsls r6, r6, #2
	movs r4, #0x48
_08083CF6:
	ldr r7, [sp, #4]
	movs r1, #0
	ldrsh r0, [r7, r1]
	movs r1, #2
	bl DivRem
	cmp r5, r0
	bne _08083D24
	movs r0, #0x88
	lsls r0, r0, #8
	orrs r0, r6
	str r0, [sp]
	movs r0, #3
	movs r1, #0x90
	adds r2, r4, #0
	mov r7, sl
	ldr r3, [r7]
	bl PutSprite
	b _08083D3A
	.align 2, 0
_08083D20: .4byte gUnknown_081D93D4
_08083D24:
	movs r0, #0xb0
	lsls r0, r0, #7
	orrs r0, r6
	str r0, [sp]
	movs r0, #3
	movs r1, #0x90
	adds r2, r4, #0
	mov r7, sl
	ldr r3, [r7]
	bl PutSprite
_08083D3A:
	adds r6, #0xc
	adds r4, #0x10
	adds r5, #1
	cmp r5, #1
	ble _08083CF6
_08083D44:
	mov r1, r8
	ldr r0, [r1, #0x60]
	cmp r0, #0
	beq _08083E1C
	ldr r0, _08083D70 @ =gUnknown_03005968
	ldr r0, [r0]
	cmp r0, #0
	beq _08083D74
	movs r2, #0x80
	lsls r2, r2, #1
	mov r0, r8
	adds r0, #0x4c
	movs r4, #0
	ldrsh r3, [r0, r4]
	movs r0, #4
	str r0, [sp]
	movs r1, #0x10
	bl Interpolate
	mov r5, r8
	str r0, [r5, #0x34]
	b _08083D90
	.align 2, 0
_08083D70: .4byte gUnknown_03005968
_08083D74:
	movs r1, #0x80
	lsls r1, r1, #1
	mov r0, r8
	adds r0, #0x4c
	movs r7, #0
	ldrsh r3, [r0, r7]
	movs r0, #4
	str r0, [sp]
	movs r0, #1
	movs r2, #0x10
	bl Interpolate
	mov r1, r8
	str r0, [r1, #0x34]
_08083D90:
	ldr r4, _08083E08 @ =gSinLut
	adds r0, r4, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r5, r0, #4
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r5, #0
	adds r1, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sb, r0
	movs r0, #0
	ldrsh r4, [r4, r0]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	mov r2, r8
	ldr r1, [r2, #0x34]
	cmp r1, #0
	bne _08083DC0
	movs r1, #2
_08083DC0:
	bl Div
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	lsls r0, r4, #4
	adds r1, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	mov r7, r8
	ldr r1, [r7, #0x34]
	cmp r1, #0
	bne _08083DDE
	movs r1, #2
_08083DDE:
	adds r0, r5, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #1
	mov r1, sb
	adds r2, r6, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldr r1, _08083E0C @ =0x0000025B
	ldr r2, _08083E10 @ =0x00000153
	ldr r3, _08083E14 @ =gUnknown_0848B6CE
	ldr r0, _08083E18 @ =0x0000D2C8
	str r0, [sp]
	movs r0, #1
	bl PutSpriteExt
	b _08083EB4
	.align 2, 0
_08083E08: .4byte gSinLut
_08083E0C: .4byte 0x0000025B
_08083E10: .4byte 0x00000153
_08083E14: .4byte gUnknown_0848B6CE
_08083E18: .4byte 0x0000D2C8
_08083E1C:
	ldr r0, _08083EC4 @ =gUnknown_03005968
	ldr r0, [r0]
	cmp r0, #0
	beq _08083EB4
	movs r0, #0x20
	bl sub_0803CBD8
	cmp r0, #0
	beq _08083EB4
	ldr r4, _08083EC8 @ =gUnknown_0861696C
	mov r1, sb
	ldrh r0, [r1]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _08083EB4
	ldr r4, _08083ECC @ =gSinLut
	adds r0, r4, #0
	adds r0, #0x80
	movs r5, #0
	ldrsh r2, [r0, r5]
	lsls r2, r2, #4
	mov sb, r2
	movs r7, #0x80
	lsls r7, r7, #1
	mov r8, r7
	mov r0, sb
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r0, #0
	ldrsh r4, [r4, r0]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #4
	adds r0, r4, #0
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, sb
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #1
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldr r1, _08083ED0 @ =0x0000025B
	ldr r2, _08083ED4 @ =0x00000153
	ldr r3, _08083ED8 @ =gUnknown_0848B6CE
	ldr r0, _08083EDC @ =0x0000D2C8
	str r0, [sp]
	movs r0, #1
	bl PutSpriteExt
_08083EB4:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08083EC4: .4byte gUnknown_03005968
_08083EC8: .4byte gUnknown_0861696C
_08083ECC: .4byte gSinLut
_08083ED0: .4byte 0x0000025B
_08083ED4: .4byte 0x00000153
_08083ED8: .4byte gUnknown_0848B6CE
_08083EDC: .4byte 0x0000D2C8

