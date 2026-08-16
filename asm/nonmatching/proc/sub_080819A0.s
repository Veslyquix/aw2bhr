	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080819A0
sub_080819A0: @ 0x080819A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	movs r5, #0
	ldr r0, _080819E8 @ =gUnknown_081D93A0
	mov sb, r0
	ldr r1, _080819EC @ =gUnknown_081D93A4
	mov sl, r1
	ldr r2, _080819F0 @ =gUnknown_08616972
	mov r8, r2
	adds r6, r7, #0
	adds r6, #0x52
_080819C0:
	cmp r5, #2
	bne _08081A00
	mov r3, r8
	ldrh r0, [r3, #6]
	ldr r5, _080819F4 @ =0x000001FF
	adds r1, r5, #0
	ands r1, r0
	mov r2, sb
	ldr r0, [r2]
	movs r3, #6
	ldrsh r2, [r0, r3]
	subs r2, #8
	ldr r0, _080819F8 @ =0x00008998
	str r0, [sp]
	movs r0, #2
	ldr r3, _080819FC @ =gUnknown_08615C76
	bl sub_0801BEBC
	movs r4, #3
	b _08081A56
	.align 2, 0
_080819E8: .4byte gUnknown_081D93A0
_080819EC: .4byte gUnknown_081D93A4
_080819F0: .4byte gUnknown_08616972
_080819F4: .4byte 0x000001FF
_080819F8: .4byte 0x00008998
_080819FC: .4byte gUnknown_08615C76
_08081A00:
	ldrh r0, [r6]
	adds r0, r0, r5
	movs r1, #6
	bl DivRem
	adds r4, r0, #0
	ldrh r0, [r6]
	adds r0, r0, r5
	movs r1, #6
	bl DivRem
	mov r2, sl
	ldr r1, [r2]
	adds r4, r4, r1
	ldrb r3, [r4]
	adds r3, #2
	lsls r3, r3, #0xc
	adds r0, r0, r1
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
	mov r5, r8
	adds r0, r2, r5
	movs r5, #0
	ldrsh r1, [r0, r5]
	mov r5, sb
	ldr r0, [r5]
	adds r2, r2, r0
	movs r0, #0
	ldrsh r2, [r2, r0]
	str r3, [sp]
	movs r0, #2
	ldr r3, _08081AB0 @ =gUnknown_08615C84
	bl sub_0801BEBC
_08081A56:
	adds r5, r4, #0
	cmp r5, #4
	ble _080819C0
	adds r4, r7, #0
	adds r4, #0x4c
	movs r1, #0
	ldrsh r3, [r4, r1]
	movs r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0x30
	bl sub_08074234
	str r0, [r7, #0x34]
	mov r2, sl
	ldr r6, [r2]
	ldr r5, _08081AB4 @ =gUnknown_03005934
	ldr r0, [r5]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r6
	ldrb r0, [r0]
	mov r8, r4
	cmp r0, #0
	bne _08081B08
	bl sub_0803BC7C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08081AC0
	ldr r1, [r7, #0x34]
	adds r1, #0x60
	ldr r4, _08081AB8 @ =gUnknown_081D93A8
	ldr r3, [r4]
	ldr r0, _08081ABC @ =0x0000AA98
	str r0, [sp]
	movs r0, #3
	movs r2, #0x48
	bl sub_0801BEBC
	b _08081AE8
	.align 2, 0
_08081AB0: .4byte gUnknown_08615C84
_08081AB4: .4byte gUnknown_03005934
_08081AB8: .4byte gUnknown_081D93A8
_08081ABC: .4byte 0x0000AA98
_08081AC0:
	ldr r0, [r5]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r6
	ldrb r0, [r0]
	adds r0, #2
	lsls r0, r0, #0xc
	ldr r1, _08081AFC @ =0x00000A98
	orrs r0, r1
	ldr r1, [r7, #0x34]
	adds r1, #0x60
	ldr r4, _08081B00 @ =gUnknown_081D93A8
	ldr r3, [r4]
	str r0, [sp]
	movs r0, #3
	movs r2, #0x48
	bl sub_0801BEBC
_08081AE8:
	ldr r0, _08081B04 @ =gUnknown_03005934
	ldr r0, [r0]
	adds r0, #2
	movs r1, #6
	bl DivRem
	mov r3, sl
	ldr r1, [r3]
	b _08081C00
	.align 2, 0
_08081AFC: .4byte 0x00000A98
_08081B00: .4byte gUnknown_081D93A8
_08081B04: .4byte gUnknown_03005934
_08081B08:
	ldr r0, [r5]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #1
	bne _08081B8C
	bl sub_0803BC88
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08081B44
	ldr r1, [r7, #0x34]
	adds r1, #0x60
	ldr r4, _08081B3C @ =gUnknown_081D93A8
	ldr r3, [r4]
	ldr r0, _08081B40 @ =0x0000BA98
	str r0, [sp]
	movs r0, #3
	movs r2, #0x48
	bl sub_0801BEBC
	b _08081B6C
	.align 2, 0
_08081B3C: .4byte gUnknown_081D93A8
_08081B40: .4byte 0x0000BA98
_08081B44:
	ldr r0, [r5]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r6
	ldrb r0, [r0]
	adds r0, #2
	lsls r0, r0, #0xc
	ldr r1, _08081B80 @ =0x00000A98
	orrs r0, r1
	ldr r1, [r7, #0x34]
	adds r1, #0x60
	ldr r4, _08081B84 @ =gUnknown_081D93A8
	ldr r3, [r4]
	str r0, [sp]
	movs r0, #3
	movs r2, #0x48
	bl sub_0801BEBC
_08081B6C:
	ldr r0, _08081B88 @ =gUnknown_03005934
	ldr r0, [r0]
	adds r0, #2
	movs r1, #6
	bl DivRem
	mov r5, sl
	ldr r1, [r5]
	b _08081C00
	.align 2, 0
_08081B80: .4byte 0x00000A98
_08081B84: .4byte gUnknown_081D93A8
_08081B88: .4byte gUnknown_03005934
_08081B8C:
	ldr r0, [r5]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #5
	bne _08081C30
	bl sub_0803BC94
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08081BC8
	ldr r1, [r7, #0x34]
	adds r1, #0x60
	ldr r4, _08081BC0 @ =gUnknown_081D93A8
	ldr r3, [r4]
	ldr r0, _08081BC4 @ =0x0000CA98
	str r0, [sp]
	movs r0, #3
	movs r2, #0x48
	bl sub_0801BEBC
	b _08081BF0
	.align 2, 0
_08081BC0: .4byte gUnknown_081D93A8
_08081BC4: .4byte 0x0000CA98
_08081BC8:
	ldr r0, [r5]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r6
	ldrb r0, [r0]
	adds r0, #2
	lsls r0, r0, #0xc
	ldr r1, _08081C20 @ =0x00000A98
	orrs r0, r1
	ldr r1, [r7, #0x34]
	adds r1, #0x60
	ldr r4, _08081C24 @ =gUnknown_081D93A8
	ldr r3, [r4]
	str r0, [sp]
	movs r0, #3
	movs r2, #0x48
	bl sub_0801BEBC
_08081BF0:
	ldr r0, _08081C28 @ =gUnknown_03005934
	ldr r0, [r0]
	adds r0, #2
	movs r1, #6
	bl DivRem
	mov r2, sl
	ldr r1, [r2]
_08081C00:
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r0, #2
	lsls r0, r0, #0xc
	ldr r1, _08081C2C @ =0x00000AA4
	orrs r0, r1
	ldr r1, [r7, #0x34]
	adds r1, #0x60
	ldr r3, [r4]
	str r0, [sp]
	movs r0, #3
	movs r2, #0x58
	bl sub_0801BEBC
	b _08081C92
	.align 2, 0
_08081C20: .4byte 0x00000A98
_08081C24: .4byte gUnknown_081D93A8
_08081C28: .4byte gUnknown_03005934
_08081C2C: .4byte 0x00000AA4
_08081C30:
	ldr r0, [r5]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #3
	bne _08081C92
	ldr r0, [r5]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r6
	ldrb r0, [r0]
	adds r0, #2
	lsls r0, r0, #0xc
	movs r1, #0xab
	lsls r1, r1, #4
	orrs r0, r1
	ldr r1, [r7, #0x34]
	adds r1, #0x60
	ldr r4, _08081CFC @ =gUnknown_08615C04
	str r0, [sp]
	movs r0, #3
	movs r2, #0x48
	adds r3, r4, #0
	bl sub_0801BEBC
	ldr r0, [r5]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r6
	ldrb r0, [r0]
	adds r0, #2
	lsls r0, r0, #0xc
	ldr r1, _08081D00 @ =0x00000ABC
	orrs r0, r1
	ldr r1, [r7, #0x34]
	adds r1, #0x60
	str r0, [sp]
	movs r0, #3
	movs r2, #0x58
	adds r3, r4, #0
	bl sub_0801BEBC
_08081C92:
	mov r3, sl
	ldr r4, [r3]
	ldr r0, _08081D04 @ =gUnknown_03005934
	ldr r0, [r0]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r4
	ldrb r0, [r0]
	bl sub_08084864
	movs r1, #0xc0
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_08013618
	mov r4, r8
	movs r5, #0
	ldrsh r3, [r4, r5]
	movs r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0x78
	movs r2, #0
	bl sub_08074234
	adds r0, #0xb0
	movs r2, #0xc0
	lsls r2, r2, #5
	movs r1, #1
	str r1, [sp]
	movs r1, #0xa0
	movs r3, #4
	bl sub_08043C28
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #3
	bgt _08081CEA
	ldr r1, _08081D08 @ =gUnknown_03002020
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_08081CEA:
	ldrh r1, [r4]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #7
	bgt _08081D0C
	adds r0, r1, #1
	strh r0, [r4]
	b _08081D18
	.align 2, 0
_08081CFC: .4byte gUnknown_08615C04
_08081D00: .4byte 0x00000ABC
_08081D04: .4byte gUnknown_03005934
_08081D08: .4byte gUnknown_03002020
_08081D0C:
	movs r0, #0x20
	mov r3, r8
	strh r0, [r3]
	adds r0, r7, #0
	bl Proc_Break
_08081D18:
	adds r0, r7, #0
	bl sub_08084700
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

