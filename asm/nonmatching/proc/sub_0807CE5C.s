	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807CE5C
sub_0807CE5C: @ 0x0807CE5C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	bl sub_0807F618
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807CE78
	bl _0807D690
_0807CE78:
	adds r0, r7, #0
	adds r0, #0x4e
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r5, r0, #0
	cmp r1, #0
	beq _0807CE8A
	bl _0807D6A4
_0807CE8A:
	ldr r0, [r7, #0x60]
	cmp r0, #0
	beq _0807CE94
	bl _0807D690
_0807CE94:
	adds r0, r7, #0
	adds r0, #0x66
	movs r3, #0
	ldrsh r1, [r0, r3]
	str r0, [sp, #4]
	cmp r1, #0
	beq _0807CEA6
	bl _0807D690
_0807CEA6:
	ldr r4, [r7, #0x40]
	mov sl, r4
	ldr r3, _0807CF4C @ =gUnknown_081D934C
	cmp r4, #0
	beq _0807CEB2
	b _0807D328
_0807CEB2:
	ldr r0, [r3]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _0807CEC2
	b _0807CFD4
_0807CEC2:
	ldr r0, _0807CF50 @ =gUnknown_081D9350
	mov r8, r0
	ldr r5, [r0]
	adds r4, r7, #0
	adds r4, #0x52
	ldrh r0, [r4]
	ldr r1, [r7, #0x58]
	ldr r2, _0807CF54 @ =gUnknown_03005948
	adds r1, r1, r2
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r5
	ldrb r0, [r0]
	ldr r1, _0807CF58 @ =0x06014200
	movs r2, #0x16
	bl sub_08043E3C
	ldrh r0, [r4]
	adds r0, #1
	ldr r1, [r7, #0x58]
	ldr r3, _0807CF54 @ =gUnknown_03005948
	adds r1, r1, r3
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r5
	ldrb r0, [r0]
	ldr r1, _0807CF5C @ =0x06014680
	movs r2, #0x17
	bl sub_08043E3C
	ldrh r0, [r4]
	adds r0, #2
	ldr r1, [r7, #0x58]
	ldr r2, _0807CF54 @ =gUnknown_03005948
	adds r1, r1, r2
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r5
	ldrb r0, [r0]
	ldr r1, _0807CF60 @ =0x06014B00
	movs r2, #0x18
	bl sub_08043E3C
	adds r0, r7, #0
	adds r0, #0x4c
	mov r3, sl
	strh r3, [r0]
	ldrh r0, [r4]
	mov sb, r4
	cmp r0, #0
	bne _0807CF64
	ldr r0, [r7, #0x58]
	ldr r4, _0807CF54 @ =gUnknown_03005948
	adds r0, r0, r4
	ldrb r0, [r0]
	subs r0, #1
	mov r1, sb
	strh r0, [r1]
	b _0807CF6A
	.align 2, 0
_0807CF4C: .4byte gUnknown_081D934C
_0807CF50: .4byte gUnknown_081D9350
_0807CF54: .4byte gUnknown_03005948
_0807CF58: .4byte 0x06014200
_0807CF5C: .4byte 0x06014680
_0807CF60: .4byte 0x06014B00
_0807CF64:
	subs r0, #1
	mov r2, sb
	strh r0, [r2]
_0807CF6A:
	adds r1, r7, #0
	adds r1, #0x4e
	ldr r0, _0807CFC4 @ =0x0000FFFF
	strh r0, [r1]
	ldr r5, _0807CFC8 @ =gUnknown_030058E0
	mov r3, sb
	ldrh r0, [r3]
	ldr r4, _0807CFCC @ =gUnknown_03005948
	ldr r1, [r7, #0x58]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r5
	ldrb r0, [r0]
	adds r1, r7, #0
	adds r1, #0x64
	movs r3, #0
	ldrsh r2, [r1, r3]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	movs r2, #0xf0
	lsls r2, r2, #2
	adds r1, r1, r2
	bl sub_08043B14
	mov r3, sb
	ldrh r0, [r3]
	ldr r1, [r7, #0x58]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r5
	ldrb r0, [r0]
	ldr r1, _0807CFD0 @ =0x06013D80
	movs r2, #0x15
	bl sub_08043E3C
	b _0807D300
	.align 2, 0
_0807CFC4: .4byte 0x0000FFFF
_0807CFC8: .4byte gUnknown_030058E0
_0807CFCC: .4byte gUnknown_03005948
_0807CFD0: .4byte 0x06013D80
_0807CFD4:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0807CFDE
	b _0807D0E4
_0807CFDE:
	adds r4, r7, #0
	adds r4, #0x52
	ldrh r0, [r4]
	ldr r1, _0807D060 @ =gUnknown_081D9354
	ldr r5, [r1]
	ldr r1, [r7, #0x58]
	adds r1, r1, r5
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	ldr r2, _0807D064 @ =gUnknown_030058E0
	adds r0, r0, r2
	ldrb r0, [r0]
	ldr r1, _0807D068 @ =0x06014200
	movs r2, #0x16
	bl sub_08043E3C
	ldrh r0, [r4]
	adds r0, #1
	ldr r1, [r7, #0x58]
	adds r1, r1, r5
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	ldr r3, _0807D064 @ =gUnknown_030058E0
	adds r0, r0, r3
	ldrb r0, [r0]
	ldr r1, _0807D06C @ =0x06014680
	movs r2, #0x17
	bl sub_08043E3C
	ldrh r0, [r4]
	adds r0, #2
	ldr r1, [r7, #0x58]
	adds r1, r1, r5
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	ldr r1, _0807D064 @ =gUnknown_030058E0
	adds r0, r0, r1
	ldrb r0, [r0]
	ldr r1, _0807D070 @ =0x06014B00
	movs r2, #0x18
	bl sub_08043E3C
	adds r0, r7, #0
	adds r0, #0x4c
	mov r2, sl
	strh r2, [r0]
	ldrh r1, [r4]
	ldr r0, [r7, #0x58]
	adds r0, r0, r5
	ldrb r0, [r0]
	subs r0, #1
	mov sb, r4
	cmp r1, r0
	bne _0807D074
	strh r2, [r4]
	b _0807D07A
	.align 2, 0
_0807D060: .4byte gUnknown_081D9354
_0807D064: .4byte gUnknown_030058E0
_0807D068: .4byte 0x06014200
_0807D06C: .4byte 0x06014680
_0807D070: .4byte 0x06014B00
_0807D074:
	adds r0, r1, #1
	mov r3, sb
	strh r0, [r3]
_0807D07A:
	adds r1, r7, #0
	adds r1, #0x4e
	movs r0, #1
	strh r0, [r1]
	ldr r5, _0807D0D8 @ =gUnknown_030058E0
	mov r4, sb
	ldrh r0, [r4]
	ldr r4, _0807D0DC @ =gUnknown_03005948
	ldr r1, [r7, #0x58]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r5
	ldrb r0, [r0]
	adds r1, r7, #0
	adds r1, #0x64
	movs r3, #0
	ldrsh r2, [r1, r3]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	movs r2, #0xf0
	lsls r2, r2, #2
	adds r1, r1, r2
	bl sub_08043B14
	mov r3, sb
	ldrh r0, [r3]
	adds r0, #2
	ldr r1, [r7, #0x58]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r5
	ldrb r0, [r0]
	ldr r1, _0807D0E0 @ =0x06013D80
	movs r2, #0x15
	bl sub_08043E3C
	b _0807D300
	.align 2, 0
_0807D0D8: .4byte gUnknown_030058E0
_0807D0DC: .4byte gUnknown_03005948
_0807D0E0: .4byte 0x06013D80
_0807D0E4:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0807D0EE
	b _0807D1FC
_0807D0EE:
	ldr r5, _0807D1DC @ =gUnknown_03005944
	ldr r0, [r5]
	cmp r0, #1
	bgt _0807D0F8
	b _0807D1FC
_0807D0F8:
	ldr r2, _0807D1E0 @ =gUnknown_030059C0
	adds r1, r7, #0
	adds r1, #0x64
	movs r4, #0
	ldrsh r0, [r1, r4]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	mov r8, r1
	cmp r0, #0
	beq _0807D1FC
	ldr r2, _0807D1E4 @ =gUnknown_03005938
	adds r4, r7, #0
	adds r4, #0x52
	ldrh r3, [r4]
	strh r3, [r2]
	ldr r1, [r7, #0x58]
	strh r1, [r2, #2]
	ldr r0, [r7, #0x5c]
	strh r0, [r2, #4]
	ldr r2, _0807D1E8 @ =gUnknown_081D9358
	ldr r0, [r2]
	adds r1, r1, r0
	strb r3, [r1]
	ldr r0, [r7, #0x58]
	mov sb, r4
	mov ip, r2
	cmp r0, #0
	bne _0807D136
	ldr r0, [r5]
	str r0, [r7, #0x58]
_0807D136:
	ldr r0, [r7, #0x58]
	subs r0, #1
	str r0, [r7, #0x58]
	ldr r1, _0807D1EC @ =gUnknown_03005910
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r6, r7, #0
	adds r6, #0x4c
	ldr r2, _0807D1F0 @ =gUnknown_081D9360
	mov sl, r2
	cmp r0, #0
	beq _0807D168
	adds r2, r5, #0
_0807D150:
	ldr r0, [r7, #0x58]
	cmp r0, #0
	bne _0807D15A
	ldr r0, [r2]
	str r0, [r7, #0x58]
_0807D15A:
	ldr r0, [r7, #0x58]
	subs r0, #1
	str r0, [r7, #0x58]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807D150
_0807D168:
	movs r2, #0
	str r2, [r7, #0x5c]
	mov r3, ip
	ldr r1, [r3]
	ldr r0, [r7, #0x58]
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r4, sb
	strh r0, [r4]
	strh r2, [r6]
	ldr r3, [r7, #0x58]
	cmp r2, r3
	bge _0807D194
	ldr r4, _0807D1F4 @ =gUnknown_03005948
_0807D184:
	adds r0, r2, r4
	ldrb r1, [r0]
	ldr r0, [r7, #0x5c]
	adds r0, r0, r1
	str r0, [r7, #0x5c]
	adds r2, #1
	cmp r2, r3
	blt _0807D184
_0807D194:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x60]
	ldr r4, _0807D1F8 @ =gUnknown_030058E0
	mov r1, sb
	ldrh r0, [r1]
	ldr r2, _0807D1F4 @ =gUnknown_03005948
	ldr r1, [r7, #0x58]
	adds r1, r1, r2
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	mov r3, r8
	movs r4, #0
	ldrsh r2, [r3, r4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	movs r2, #0xf0
	lsls r2, r2, #2
	adds r1, r1, r2
	bl sub_08043B14
	mov r3, sl
	ldr r1, [r3]
	ldr r0, [r7, #0x58]
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #8
	bl sub_0802D5CC
	b _0807D300
	.align 2, 0
_0807D1DC: .4byte gUnknown_03005944
_0807D1E0: .4byte gUnknown_030059C0
_0807D1E4: .4byte gUnknown_03005938
_0807D1E8: .4byte gUnknown_081D9358
_0807D1EC: .4byte gUnknown_03005910
_0807D1F0: .4byte gUnknown_081D9360
_0807D1F4: .4byte gUnknown_03005948
_0807D1F8: .4byte gUnknown_030058E0
_0807D1FC:
	mov r4, sl
	cmp r4, #0
	beq _0807D204
	b _0807D328
_0807D204:
	ldr r0, [r3]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807D214
	b _0807D328
_0807D214:
	ldr r5, _0807D308 @ =gUnknown_03005944
	ldr r0, [r5]
	cmp r0, #1
	bgt _0807D21E
	b _0807D328
_0807D21E:
	ldr r2, _0807D30C @ =gUnknown_030059C0
	adds r1, r7, #0
	adds r1, #0x64
	movs r4, #0
	ldrsh r0, [r1, r4]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	mov r8, r1
	cmp r0, #0
	beq _0807D328
	ldr r2, _0807D310 @ =gUnknown_03005938
	adds r4, r7, #0
	adds r4, #0x52
	ldrh r3, [r4]
	strh r3, [r2]
	ldr r1, [r7, #0x58]
	strh r1, [r2, #2]
	ldr r0, [r7, #0x5c]
	strh r0, [r2, #4]
	ldr r2, _0807D314 @ =gUnknown_081D9358
	ldr r0, [r2]
	adds r1, r1, r0
	strb r3, [r1]
	ldr r0, [r7, #0x58]
	adds r0, #1
	str r0, [r7, #0x58]
	ldr r1, [r5]
	mov sb, r4
	mov ip, r2
	cmp r0, r1
	bne _0807D262
	mov r0, sl
	str r0, [r7, #0x58]
_0807D262:
	ldr r3, _0807D318 @ =gUnknown_03005910
	ldr r2, [r7, #0x58]
	adds r0, r2, r3
	ldrb r0, [r0]
	adds r6, r7, #0
	adds r6, #0x4c
	ldr r1, _0807D31C @ =gUnknown_081D9360
	mov sl, r1
	cmp r0, #0
	beq _0807D290
	ldr r1, [r5]
	adds r4, r3, #0
	movs r3, #0
_0807D27C:
	adds r0, r2, #1
	str r0, [r7, #0x58]
	cmp r0, r1
	bne _0807D286
	str r3, [r7, #0x58]
_0807D286:
	ldr r2, [r7, #0x58]
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807D27C
_0807D290:
	movs r2, #0
	str r2, [r7, #0x5c]
	mov r3, ip
	ldr r1, [r3]
	ldr r0, [r7, #0x58]
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r4, sb
	strh r0, [r4]
	strh r2, [r6]
	ldr r3, [r7, #0x58]
	cmp r2, r3
	bge _0807D2BC
	ldr r4, _0807D320 @ =gUnknown_03005948
_0807D2AC:
	adds r0, r2, r4
	ldrb r1, [r0]
	ldr r0, [r7, #0x5c]
	adds r0, r0, r1
	str r0, [r7, #0x5c]
	adds r2, #1
	cmp r2, r3
	blt _0807D2AC
_0807D2BC:
	movs r0, #1
	str r0, [r7, #0x60]
	mov r0, sl
	ldr r1, [r0]
	ldr r0, [r7, #0x58]
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #8
	bl sub_0802D5CC
	ldr r4, _0807D324 @ =gUnknown_030058E0
	mov r1, sb
	ldrh r0, [r1]
	ldr r2, _0807D320 @ =gUnknown_03005948
	ldr r1, [r7, #0x58]
	adds r1, r1, r2
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	mov r3, r8
	movs r4, #0
	ldrsh r2, [r3, r4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	movs r2, #0xf0
	lsls r2, r2, #2
	adds r1, r1, r2
	bl sub_08043B14
_0807D300:
	movs r0, #0x67
	bl sub_0803B4DC
	b _0807D690
	.align 2, 0
_0807D308: .4byte gUnknown_03005944
_0807D30C: .4byte gUnknown_030059C0
_0807D310: .4byte gUnknown_03005938
_0807D314: .4byte gUnknown_081D9358
_0807D318: .4byte gUnknown_03005910
_0807D31C: .4byte gUnknown_081D9360
_0807D320: .4byte gUnknown_03005948
_0807D324: .4byte gUnknown_030058E0
_0807D328:
	ldr r0, [r3]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r4, #1
	ands r4, r1
	cmp r4, #0
	bne _0807D338
	b _0807D508
_0807D338:
	adds r6, r7, #0
	adds r6, #0x4c
	mov r3, sl
	cmp r3, #0
	ble _0807D370
	movs r0, #0
	strh r0, [r6]
	adds r1, r7, #0
	adds r1, #0x6a
	strh r0, [r1]
	ldr r0, _0807D3E8 @ =gUnknown_030058D4
	bl sub_0803BCDC
	bl sub_0803BD54
	ldr r0, _0807D3EC @ =gUnknown_08616690
	adds r1, r7, #0
	bl Proc_Start
	movs r0, #0x10
	bl sub_080733A0
	adds r0, r7, #0
	bl Proc_Break
	movs r0, #0x71
	bl sub_0803B4DC
_0807D370:
	adds r0, r7, #0
	bl sub_0807D800
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807D37E
	b _0807D690
_0807D37E:
	movs r4, #0x52
	adds r4, r4, r7
	mov sb, r4
	ldrh r0, [r4]
	ldr r1, _0807D3F0 @ =gUnknown_081D9354
	ldr r2, [r1]
	ldr r1, [r7, #0x58]
	adds r1, r1, r2
	ldrb r1, [r1]
	bl DivRem
	ldr r1, _0807D3E8 @ =gUnknown_030058D4
	adds r4, r7, #0
	adds r4, #0x64
	movs r3, #0
	ldrsh r2, [r4, r3]
	adds r2, r2, r1
	ldr r1, _0807D3F4 @ =gUnknown_081D9350
	ldr r3, [r1]
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r3
	ldrb r0, [r0]
	movs r1, #0
	strb r0, [r2]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldr r2, [sp, #4]
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	strh r1, [r6]
	ldr r1, _0807D3F8 @ =gUnknown_0300599C
	movs r3, #0
	ldrsh r0, [r4, r3]
	subs r0, #1
	adds r0, r0, r1
	ldr r1, [r7, #0x58]
	strb r1, [r0]
	movs r0, #0
	ldrsh r5, [r4, r0]
	bl sub_0803BD14
	mov r8, r4
	cmp r5, r0
	bne _0807D3FC
	ldr r0, [r7, #0x40]
	cmp r0, #0
	bne _0807D3FC
	movs r1, #1
	str r1, [r7, #0x40]
	b _0807D4E0
	.align 2, 0
_0807D3E8: .4byte gUnknown_030058D4
_0807D3EC: .4byte gUnknown_08616690
_0807D3F0: .4byte gUnknown_081D9354
_0807D3F4: .4byte gUnknown_081D9350
_0807D3F8: .4byte gUnknown_0300599C
_0807D3FC:
	ldr r0, _0807D4E8 @ =gUnknown_030059C0
	mov r2, r8
	movs r3, #0
	ldrsh r1, [r2, r3]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r5, _0807D4EC @ =gUnknown_081D935C
	cmp r0, #0
	beq _0807D41A
	ldr r0, [r5]
	ldr r1, [r7, #0x58]
	adds r1, r1, r0
	movs r0, #1
	strb r0, [r1]
_0807D41A:
	ldr r2, _0807D4F0 @ =gUnknown_03005938
	mov r4, sb
	ldrh r3, [r4]
	strh r3, [r2]
	ldr r1, [r7, #0x58]
	strh r1, [r2, #2]
	ldr r0, [r7, #0x5c]
	strh r0, [r2, #4]
	ldr r2, _0807D4F4 @ =gUnknown_081D9358
	ldr r0, [r2]
	adds r1, r1, r0
	strb r3, [r1]
	ldr r0, [r7, #0x58]
	adds r0, #1
	str r0, [r7, #0x58]
	ldr r4, _0807D4F8 @ =gUnknown_03005944
	ldr r1, [r4]
	mov ip, r2
	cmp r0, r1
	bne _0807D446
	movs r0, #0
	str r0, [r7, #0x58]
_0807D446:
	ldr r3, [r5]
	ldr r2, [r7, #0x58]
	adds r0, r2, r3
	ldrb r0, [r0]
	ldr r1, _0807D4FC @ =gUnknown_081D9360
	mov sl, r1
	cmp r0, #0
	beq _0807D470
	ldr r1, [r4]
	adds r4, r3, #0
	movs r3, #0
_0807D45C:
	adds r0, r2, #1
	str r0, [r7, #0x58]
	cmp r0, r1
	bne _0807D466
	str r3, [r7, #0x58]
_0807D466:
	ldr r2, [r7, #0x58]
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807D45C
_0807D470:
	movs r2, #0
	str r2, [r7, #0x5c]
	mov r3, ip
	ldr r1, [r3]
	ldr r0, [r7, #0x58]
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r4, sb
	strh r0, [r4]
	strh r2, [r6]
	ldr r3, [r7, #0x58]
	cmp r2, r3
	bge _0807D49C
	ldr r4, _0807D500 @ =gUnknown_03005948
_0807D48C:
	adds r0, r2, r4
	ldrb r1, [r0]
	ldr r0, [r7, #0x5c]
	adds r0, r0, r1
	str r0, [r7, #0x5c]
	adds r2, #1
	cmp r2, r3
	blt _0807D48C
_0807D49C:
	movs r0, #1
	str r0, [r7, #0x60]
	ldr r4, _0807D504 @ =gUnknown_030058E0
	mov r1, sb
	ldrh r0, [r1]
	ldr r2, _0807D500 @ =gUnknown_03005948
	ldr r1, [r7, #0x58]
	adds r1, r1, r2
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	mov r3, r8
	movs r4, #0
	ldrsh r2, [r3, r4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	movs r2, #0xf0
	lsls r2, r2, #2
	adds r1, r1, r2
	bl sub_08043B14
	mov r3, sl
	ldr r1, [r3]
	ldr r0, [r7, #0x58]
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #8
	bl sub_0802D5CC
_0807D4E0:
	movs r0, #0x71
	bl sub_0803B4DC
	b _0807D690
	.align 2, 0
_0807D4E8: .4byte gUnknown_030059C0
_0807D4EC: .4byte gUnknown_081D935C
_0807D4F0: .4byte gUnknown_03005938
_0807D4F4: .4byte gUnknown_081D9358
_0807D4F8: .4byte gUnknown_03005944
_0807D4FC: .4byte gUnknown_081D9360
_0807D500: .4byte gUnknown_03005948
_0807D504: .4byte gUnknown_030058E0
_0807D508:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0807D512
	b _0807D680
_0807D512:
	ldr r5, _0807D558 @ =gUnknown_086166A8
	adds r0, r5, #0
	bl Proc_Find
	cmp r0, #0
	bne _0807D524
	movs r0, #0x66
	bl sub_0803B4DC
_0807D524:
	adds r0, r7, #0
	adds r0, #0x64
	ldrh r2, [r0]
	movs r3, #0
	ldrsh r1, [r0, r3]
	mov r8, r0
	cmp r1, #0
	bne _0807D536
	b _0807D66C
_0807D536:
	subs r0, r2, #1
	mov r1, r8
	strh r0, [r1]
	ldr r2, [sp, #4]
	ldrh r0, [r2]
	subs r0, #1
	strh r0, [r2]
	adds r0, r7, #0
	adds r0, #0x4c
	strh r4, [r0]
	ldr r1, [r7, #0x40]
	adds r6, r0, #0
	cmp r1, #0
	ble _0807D55C
	str r4, [r7, #0x40]
	b _0807D690
	.align 2, 0
_0807D558: .4byte gUnknown_086166A8
_0807D55C:
	ldr r1, _0807D5B0 @ =gUnknown_030059C0
	mov r3, r8
	movs r4, #0
	ldrsh r2, [r3, r4]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r5, [r0]
	cmp r5, #0
	beq _0807D5C4
	ldr r1, _0807D5B4 @ =gUnknown_03005910
	ldr r0, _0807D5B8 @ =gUnknown_0300599C
	adds r0, r2, r0
	ldrb r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	ldr r4, _0807D5BC @ =gUnknown_030058E0
	adds r0, r7, #0
	adds r0, #0x52
	ldrh r0, [r0]
	ldr r2, _0807D5C0 @ =gUnknown_03005948
	ldr r1, [r7, #0x58]
	adds r1, r1, r2
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	mov r1, r8
	movs r3, #0
	ldrsh r2, [r1, r3]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	movs r4, #0xf0
	lsls r4, r4, #2
	adds r1, r1, r4
	bl sub_08043B14
	b _0807D690
	.align 2, 0
_0807D5B0: .4byte gUnknown_030059C0
_0807D5B4: .4byte gUnknown_03005910
_0807D5B8: .4byte gUnknown_0300599C
_0807D5BC: .4byte gUnknown_030058E0
_0807D5C0: .4byte gUnknown_03005948
_0807D5C4:
	ldr r2, _0807D658 @ =gUnknown_03005938
	adds r3, r7, #0
	adds r3, #0x52
	ldrh r4, [r3]
	strh r4, [r2]
	ldr r1, [r7, #0x58]
	strh r1, [r2, #2]
	ldr r0, [r7, #0x5c]
	strh r0, [r2, #4]
	ldr r2, _0807D65C @ =gUnknown_03005950
	adds r1, r1, r2
	strb r4, [r1]
	mov r1, r8
	movs r4, #0
	ldrsh r0, [r1, r4]
	str r0, [r7, #0x58]
	str r5, [r7, #0x5c]
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r3]
	strh r5, [r6]
	movs r2, #0
	ldr r4, [r7, #0x58]
	mov sb, r3
	ldr r0, _0807D660 @ =gUnknown_081D9360
	mov sl, r0
	cmp r2, r4
	bge _0807D60E
	ldr r3, _0807D664 @ =gUnknown_03005948
_0807D5FE:
	adds r0, r2, r3
	ldrb r1, [r0]
	ldr r0, [r7, #0x5c]
	adds r0, r0, r1
	str r0, [r7, #0x5c]
	adds r2, #1
	cmp r2, r4
	blt _0807D5FE
_0807D60E:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x60]
	ldr r4, _0807D668 @ =gUnknown_030058E0
	mov r1, sb
	ldrh r0, [r1]
	ldr r2, _0807D664 @ =gUnknown_03005948
	ldr r1, [r7, #0x58]
	adds r1, r1, r2
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	mov r3, r8
	movs r4, #0
	ldrsh r2, [r3, r4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	movs r2, #0xf0
	lsls r2, r2, #2
	adds r1, r1, r2
	bl sub_08043B14
	mov r3, sl
	ldr r1, [r3]
	ldr r0, [r7, #0x58]
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #8
	bl sub_0802D5CC
	b _0807D690
	.align 2, 0
_0807D658: .4byte gUnknown_03005938
_0807D65C: .4byte gUnknown_03005950
_0807D660: .4byte gUnknown_081D9360
_0807D664: .4byte gUnknown_03005948
_0807D668: .4byte gUnknown_030058E0
_0807D66C:
	ldr r0, [r7, #0x40]
	subs r0, #1
	str r0, [r7, #0x40]
	adds r0, r5, #0
	adds r1, r7, #0
	bl Proc_Start
	bl sub_0803BD60
	b _0807D690
_0807D680:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0807D690
	adds r0, r7, #0
	bl sub_0807F630
_0807D690:
	adds r0, r7, #0
	adds r0, #0x4e
	movs r4, #0
	ldrsh r1, [r0, r4]
	adds r5, r0, #0
	cmp r1, #0
	bne _0807D6A4
	ldr r0, [r7, #0x60]
	cmp r0, #0
	beq _0807D6AC
_0807D6A4:
	adds r1, r7, #0
	adds r1, #0x68
	movs r0, #0
	b _0807D6C6
_0807D6AC:
	adds r1, r7, #0
	adds r1, #0x68
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #3
	bgt _0807D6BE
	adds r0, r2, #1
	b _0807D6C6
_0807D6BE:
	adds r1, r7, #0
	adds r1, #0x48
	ldrh r0, [r1]
	adds r0, #1
_0807D6C6:
	strh r0, [r1]
	movs r4, #0
	ldrsh r0, [r5, r4]
	adds r6, r7, #0
	adds r6, #0x4c
	cmp r0, #0
	beq _0807D770
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #7
	bgt _0807D714
	adds r3, r0, #0
	movs r4, #8
	str r4, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0x78
	bl sub_08074234
	str r0, [r7, #0x34]
	movs r0, #0
	ldrsh r3, [r6, r0]
	str r4, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0xc
	bl sub_08074234
	movs r2, #0
	ldrsh r1, [r5, r2]
	muls r0, r1, r0
	str r0, [r7, #0x38]
	movs r0, #0
	ldrsh r3, [r6, r0]
	str r4, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0xf
	b _0807D752
_0807D714:
	movs r4, #0
	ldrsh r3, [r6, r4]
	subs r3, #8
	movs r4, #8
	str r4, [sp]
	movs r0, #4
	movs r1, #0x78
	movs r2, #0
	bl sub_08074234
	str r0, [r7, #0x34]
	movs r0, #0
	ldrsh r3, [r6, r0]
	subs r3, #8
	str r4, [sp]
	movs r0, #4
	movs r1, #0xc
	movs r2, #0x18
	bl sub_08074234
	movs r2, #0
	ldrsh r1, [r5, r2]
	muls r0, r1, r0
	str r0, [r7, #0x38]
	movs r0, #0
	ldrsh r3, [r6, r0]
	subs r3, #8
	str r4, [sp]
	movs r0, #4
	movs r1, #0xf
	movs r2, #0x1d
_0807D752:
	bl sub_08074234
	movs r2, #0
	ldrsh r1, [r5, r2]
	muls r0, r1, r0
	str r0, [r7, #0x2c]
	adds r0, r7, #0
	bl sub_0807D860
	movs r3, #0
	ldrsh r0, [r6, r3]
	cmp r0, #0x10
	bne _0807D770
	movs r0, #0
	strh r0, [r5]
_0807D770:
	ldr r0, [r7, #0x60]
	cmp r0, #0
	beq _0807D7DE
	movs r4, #0
	ldrsh r0, [r6, r4]
	cmp r0, #0xb
	bgt _0807D79E
	adds r3, r0, #0
	movs r4, #0xc
	str r4, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0x78
	bl sub_08074234
	str r0, [r7, #0x34]
	movs r1, #0
	ldrsh r3, [r6, r1]
	str r4, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0x80
	b _0807D7C2
_0807D79E:
	movs r2, #0
	ldrsh r3, [r6, r2]
	subs r3, #0xc
	movs r4, #0xc
	str r4, [sp]
	movs r0, #4
	movs r1, #0x78
	movs r2, #0
	bl sub_08074234
	str r0, [r7, #0x34]
	movs r0, #0
	ldrsh r3, [r6, r0]
	subs r3, #0xc
	str r4, [sp]
	movs r0, #4
	movs r1, #0x78
	movs r2, #0xff
_0807D7C2:
	bl sub_08074234
	ldr r1, [r7, #0x60]
	muls r0, r1, r0
	str r0, [r7, #0x30]
	adds r0, r7, #0
	bl sub_0807D918
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0x18
	bne _0807D7DE
	movs r0, #0
	str r0, [r7, #0x60]
_0807D7DE:
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
	adds r0, r7, #0
	bl sub_0807DA98
	ldr r0, [r7, #0x3c]
	subs r0, #1
	str r0, [r7, #0x3c]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

