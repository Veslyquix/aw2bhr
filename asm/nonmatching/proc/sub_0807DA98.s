	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807DA98
sub_0807DA98: @ 0x0807DA98
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	mov sb, r0
	mov r7, sb
	adds r7, #0x4e
	movs r1, #0
	ldrsh r0, [r7, r1]
	cmp r0, #0
	bne _0807DAB4
	b _0807DF80
_0807DAB4:
	mov r2, sb
	ldr r1, [r2, #0x38]
	lsls r2, r1, #1
	adds r2, r2, r1
	movs r0, #0x88
	subs r0, r0, r2
	ldr r4, _0807DB38 @ =0x000001FF
	ands r0, r4
	adds r1, #0x3c
	movs r5, #0xff
	ands r1, r5
	movs r6, #0x80
	lsls r6, r6, #3
	orrs r1, r6
	ldr r2, _0807DB3C @ =0x00007A34
	movs r3, #5
	bl sub_08043FD8
	mov r3, sb
	ldr r1, [r3, #0x38]
	lsls r2, r1, #1
	adds r2, r2, r1
	movs r0, #0xd0
	subs r0, r0, r2
	ands r0, r4
	adds r1, #0x24
	ands r1, r5
	orrs r1, r6
	ldr r2, _0807DB40 @ =0x00008A58
	movs r3, #5
	bl sub_08043FD8
	movs r1, #0
	ldrsh r0, [r7, r1]
	cmp r0, #0
	ble _0807DB4C
	mov r2, sb
	ldr r1, [r2, #0x2c]
	lsls r2, r1, #1
	adds r2, r2, r1
	movs r0, #0x40
	subs r0, r0, r2
	ands r0, r4
	adds r1, #0x54
	ands r1, r5
	orrs r1, r6
	ldr r2, _0807DB44 @ =0x00006A10
	movs r3, #5
	bl sub_08043FD8
	mov r3, sb
	ldr r1, [r3, #0x38]
	lsls r2, r1, #1
	adds r2, r2, r1
	movs r0, #0x8c
	lsls r0, r0, #1
	subs r0, r0, r2
	ands r0, r4
	adds r1, #0xc
	ands r1, r5
	orrs r1, r6
	ldr r2, _0807DB48 @ =0x000059EC
	movs r3, #5
	bl sub_08043FD8
	b _0807DB8C
	.align 2, 0
_0807DB38: .4byte 0x000001FF
_0807DB3C: .4byte 0x00007A34
_0807DB40: .4byte 0x00008A58
_0807DB44: .4byte 0x00006A10
_0807DB48: .4byte 0x000059EC
_0807DB4C:
	cmp r0, #0
	bge _0807DB8C
	mov r0, sb
	ldr r1, [r0, #0x38]
	lsls r2, r1, #1
	adds r2, r2, r1
	movs r0, #0x40
	subs r0, r0, r2
	ands r0, r4
	adds r1, #0x54
	ands r1, r5
	orrs r1, r6
	ldr r2, _0807DD00 @ =0x00006A10
	movs r3, #5
	bl sub_08043FD8
	mov r2, sb
	ldr r1, [r2, #0x2c]
	adds r0, r1, #5
	lsls r2, r0, #1
	adds r2, r2, r0
	movs r0, #8
	rsbs r0, r0, #0
	subs r0, r0, r2
	ands r0, r4
	adds r1, #0x71
	ands r1, r5
	orrs r1, r6
	ldr r2, _0807DD04 @ =0x000059EC
	movs r3, #5
	bl sub_08043FD8
_0807DB8C:
	movs r6, #0
	mov r0, sb
	adds r0, #0x64
	movs r3, #0
	ldrsh r1, [r0, r3]
	mov r2, sb
	adds r2, #0x4e
	str r2, [sp, #0xc]
	str r0, [sp, #0x10]
	mov r3, sb
	adds r3, #0x48
	str r3, [sp, #4]
	subs r0, #0x18
	str r0, [sp, #8]
	adds r2, #0x18
	str r2, [sp, #0x14]
	cmp r6, r1
	bge _0807DC30
	movs r3, #0x52
	add r3, sb
	mov sl, r3
_0807DBB6:
	movs r4, #1
	ldr r0, _0807DD08 @ =gUnknown_030058D4
	adds r0, r0, r6
	mov r8, r0
	movs r7, #0x18
	movs r5, #0x48
_0807DBC2:
	mov r1, sl
	ldrh r0, [r1]
	adds r0, r0, r4
	ldr r2, [sp, #0xc]
	movs r3, #0
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	ldr r2, _0807DD0C @ =gUnknown_03005948
	mov r3, sb
	ldr r1, [r3, #0x58]
	adds r1, r1, r2
	ldrb r1, [r1]
	bl DivRem
	mov r2, sb
	ldr r1, [r2, #0x5c]
	adds r0, r0, r1
	ldr r3, _0807DD10 @ =gUnknown_030058E0
	adds r0, r0, r3
	mov r2, r8
	ldrb r1, [r2]
	ldrb r0, [r0]
	cmp r1, r0
	bne _0807DC1A
	mov r3, sb
	ldr r2, [r3, #0x38]
	lsls r1, r2, #1
	adds r1, r1, r2
	subs r1, #0x25
	subs r1, r5, r1
	ldr r0, _0807DD14 @ =0x000001FF
	ands r1, r0
	adds r2, #0x43
	subs r2, r2, r7
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
	movs r0, #0
	str r0, [sp]
	adds r0, r6, #0
	adds r0, #0x4a
	movs r3, #0
	bl sub_0801F34C
_0807DC1A:
	adds r7, #0x18
	adds r5, #0x48
	adds r4, #1
	cmp r4, #2
	ble _0807DBC2
	adds r6, #1
	ldr r1, [sp, #0x10]
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r6, r0
	blt _0807DBB6
_0807DC30:
	ldr r3, [sp, #0xc]
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r0, #0
	ble _0807DD18
	movs r6, #0
	ldr r2, [sp, #0x10]
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r6, r0
	blt _0807DC48
	b _0807DDE2
_0807DC48:
	movs r0, #0x52
	add r0, sb
	mov r8, r0
	ldr r7, [sp, #0xc]
	ldr r1, _0807DD0C @ =gUnknown_03005948
	mov sl, r1
	movs r5, #0x4a
_0807DC56:
	ldr r0, _0807DD08 @ =gUnknown_030058D4
	adds r4, r6, r0
	mov r2, r8
	ldrh r0, [r2]
	movs r3, #0
	ldrsh r1, [r7, r3]
	subs r0, r0, r1
	mov r2, sb
	ldr r1, [r2, #0x58]
	add r1, sl
	ldrb r1, [r1]
	bl DivRem
	mov r3, sb
	ldr r1, [r3, #0x5c]
	adds r0, r0, r1
	ldr r1, _0807DD10 @ =gUnknown_030058E0
	adds r0, r0, r1
	ldrb r1, [r4]
	ldrb r0, [r0]
	cmp r1, r0
	bne _0807DCA4
	ldr r2, [r3, #0x2c]
	lsls r0, r2, #1
	adds r0, r0, r2
	movs r1, #0x25
	subs r1, r1, r0
	ldr r0, _0807DD14 @ =0x000001FF
	ands r1, r0
	adds r2, #0x43
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	movs r3, #0
	bl sub_0801F34C
_0807DCA4:
	mov r2, r8
	ldrh r0, [r2]
	movs r3, #0
	ldrsh r1, [r7, r3]
	subs r1, #3
	subs r0, r0, r1
	mov r2, sb
	ldr r1, [r2, #0x58]
	add r1, sl
	ldrb r1, [r1]
	bl DivRem
	mov r3, sb
	ldr r1, [r3, #0x5c]
	adds r0, r0, r1
	ldr r1, _0807DD10 @ =gUnknown_030058E0
	adds r0, r0, r1
	ldrb r1, [r4]
	ldrb r0, [r0]
	cmp r1, r0
	bne _0807DCF0
	ldr r2, [r3, #0x38]
	lsls r0, r2, #1
	adds r0, r0, r2
	movs r1, #0xfd
	subs r1, r1, r0
	ldr r0, _0807DD14 @ =0x000001FF
	ands r1, r0
	subs r2, #5
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	movs r3, #0
	bl sub_0801F34C
_0807DCF0:
	adds r5, #1
	adds r6, #1
	ldr r2, [sp, #0x10]
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r6, r0
	blt _0807DC56
	b _0807DDE2
	.align 2, 0
_0807DD00: .4byte 0x00006A10
_0807DD04: .4byte 0x000059EC
_0807DD08: .4byte gUnknown_030058D4
_0807DD0C: .4byte gUnknown_03005948
_0807DD10: .4byte gUnknown_030058E0
_0807DD14: .4byte 0x000001FF
_0807DD18:
	cmp r0, #0
	bge _0807DDE2
	movs r6, #0
	ldr r1, [sp, #0x10]
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r6, r0
	bge _0807DDE2
	movs r3, #0x52
	add r3, sb
	mov r8, r3
	ldr r7, [sp, #0xc]
	ldr r0, _0807DEB8 @ =gUnknown_03005948
	mov sl, r0
	movs r5, #0x4a
_0807DD36:
	ldr r0, _0807DEBC @ =gUnknown_030058D4
	adds r4, r6, r0
	mov r1, r8
	ldrh r0, [r1]
	movs r2, #0
	ldrsh r1, [r7, r2]
	subs r0, r0, r1
	mov r3, sb
	ldr r1, [r3, #0x58]
	add r1, sl
	ldrb r1, [r1]
	bl DivRem
	mov r2, sb
	ldr r1, [r2, #0x5c]
	adds r0, r0, r1
	ldr r3, _0807DEC0 @ =gUnknown_030058E0
	adds r0, r0, r3
	ldrb r1, [r4]
	ldrb r0, [r0]
	cmp r1, r0
	bne _0807DD84
	ldr r2, [r2, #0x38]
	lsls r0, r2, #1
	adds r0, r0, r2
	movs r1, #0x25
	subs r1, r1, r0
	ldr r0, _0807DEC4 @ =0x000001FF
	ands r1, r0
	adds r2, #0x43
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	movs r3, #0
	bl sub_0801F34C
_0807DD84:
	movs r1, #0
	ldrsh r0, [r7, r1]
	mvns r0, r0
	mov r2, r8
	ldrh r2, [r2]
	adds r0, r0, r2
	mov r3, sb
	ldr r1, [r3, #0x58]
	add r1, sl
	ldrb r1, [r1]
	bl DivRem
	mov r2, sb
	ldr r1, [r2, #0x5c]
	adds r0, r0, r1
	ldr r3, _0807DEC0 @ =gUnknown_030058E0
	adds r0, r0, r3
	ldrb r1, [r4]
	ldrb r0, [r0]
	cmp r1, r0
	bne _0807DDD4
	ldr r2, [r2, #0x2c]
	adds r1, r2, #5
	lsls r0, r1, #1
	adds r0, r0, r1
	movs r1, #0x23
	rsbs r1, r1, #0
	subs r1, r1, r0
	ldr r0, _0807DEC4 @ =0x000001FF
	ands r1, r0
	adds r2, #0x60
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	movs r3, #0
	bl sub_0801F34C
_0807DDD4:
	adds r5, #1
	adds r6, #1
	ldr r1, [sp, #0x10]
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r6, r0
	blt _0807DD36
_0807DDE2:
	ldr r5, _0807DEC8 @ =gUnknown_03002F18
	mov r3, sb
	ldr r0, [r3, #0x3c]
	movs r1, #4
	bl DivRem
	movs r1, #0x24
	subs r1, r1, r0
	strh r1, [r5]
	ldr r4, _0807DECC @ =gUnknown_03002B34
	mov r1, sb
	ldr r0, [r1, #0x3c]
	movs r1, #4
	bl DivRem
	lsls r1, r0, #1
	adds r1, r1, r0
	strh r1, [r4]
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0807DE1A
	ldrh r0, [r5]
	subs r0, #4
	strh r0, [r5]
	ldrh r0, [r4]
	adds r0, #0xc
	strh r0, [r4]
_0807DE1A:
	ldr r2, [sp, #0xc]
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bge _0807DED0
	ldr r1, [sp, #4]
	ldrh r0, [r1]
	movs r1, #0x20
	bl DivRem
	adds r3, r0, #0
	movs r5, #0x20
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #8
	bl Interpolate
	adds r1, r0, #0
	ldr r2, [sp, #8]
	movs r0, #0
	ldrsh r3, [r2, r0]
	movs r6, #0x10
	str r6, [sp]
	movs r0, #4
	movs r2, #0x10
	bl Interpolate
	movs r4, #0x18
	subs r4, r4, r0
	ldr r1, [sp, #4]
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r1, #0x20
	bl DivRem
	adds r3, r0, #0
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #4
	bl Interpolate
	adds r1, r0, #0
	ldr r0, [sp, #8]
	movs r2, #0
	ldrsh r3, [r0, r2]
	str r6, [sp]
	movs r0, #4
	movs r2, #8
	bl Interpolate
	adds r2, r0, #0
	adds r2, #0x3c
	movs r6, #0
	str r6, [sp]
	movs r0, #0x48
	adds r1, r4, #0
	movs r3, #0
	bl sub_0801F34C
	ldr r3, [sp, #4]
	ldrh r0, [r3]
	movs r1, #0x20
	bl DivRem
	adds r3, r0, #0
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #8
	bl Interpolate
	adds r4, r0, #0
	adds r4, #0x58
	ldr r1, [sp, #4]
	movs r2, #0
	ldrsh r0, [r1, r2]
	b _0807E188
	.align 2, 0
_0807DEB8: .4byte gUnknown_03005948
_0807DEBC: .4byte gUnknown_030058D4
_0807DEC0: .4byte gUnknown_030058E0
_0807DEC4: .4byte 0x000001FF
_0807DEC8: .4byte gUnknown_03002F18
_0807DECC: .4byte gUnknown_03002B34
_0807DED0:
	ldr r3, [sp, #4]
	ldrh r0, [r3]
	movs r1, #0x20
	bl DivRem
	adds r3, r0, #0
	movs r5, #0x20
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #8
	bl Interpolate
	movs r4, #0x18
	subs r4, r4, r0
	ldr r1, [sp, #4]
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r1, #0x20
	bl DivRem
	adds r3, r0, #0
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #4
	bl Interpolate
	adds r2, r0, #0
	adds r2, #0x3c
	movs r3, #0
	mov r8, r3
	str r3, [sp]
	movs r0, #0x48
	adds r1, r4, #0
	bl sub_0801F34C
	ldr r1, [sp, #4]
	ldrh r0, [r1]
	movs r1, #0x20
	bl DivRem
	adds r3, r0, #0
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #8
	bl Interpolate
	adds r1, r0, #0
	ldr r2, [sp, #8]
	movs r0, #0
	ldrsh r3, [r2, r0]
	movs r6, #0x10
	str r6, [sp]
	movs r0, #4
	movs r2, #0x10
	bl Interpolate
	adds r4, r0, #0
	adds r4, #0x58
	ldr r1, [sp, #4]
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r1, #0x20
	bl DivRem
	adds r3, r0, #0
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #4
	bl Interpolate
	adds r1, r0, #0
	ldr r0, [sp, #8]
	movs r2, #0
	ldrsh r3, [r0, r2]
	str r6, [sp]
	movs r0, #4
	movs r2, #8
	bl Interpolate
	movs r2, #0x2c
	subs r2, r2, r0
	mov r3, r8
	str r3, [sp]
	b _0807E1A2
_0807DF80:
	mov r1, sb
	ldr r0, [r1, #0x60]
	cmp r0, #0
	bne _0807DF8A
	b _0807E1C0
_0807DF8A:
	ldr r0, [r1, #0x30]
	movs r1, #0x54
	subs r1, r1, r0
	movs r5, #0xff
	ands r1, r5
	movs r4, #0x80
	lsls r4, r4, #3
	orrs r1, r4
	movs r2, #0xa6
	lsls r2, r2, #6
	movs r0, #0x40
	movs r3, #5
	bl sub_08043FD8
	mov r2, sb
	ldr r0, [r2, #0x30]
	movs r1, #0x3c
	subs r1, r1, r0
	ands r1, r5
	orrs r1, r4
	ldr r2, _0807E058 @ =0x000039A4
	movs r0, #0x88
	movs r3, #5
	bl sub_08043FD8
	mov r3, sb
	ldr r0, [r3, #0x30]
	movs r1, #0x24
	subs r1, r1, r0
	ands r1, r5
	orrs r1, r4
	ldr r2, _0807E05C @ =0x000049C8
	movs r0, #0xd0
	movs r3, #5
	bl sub_08043FD8
	movs r6, #0
	mov r0, sb
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	str r0, [sp, #0x10]
	mov r3, sb
	adds r3, #0x48
	str r3, [sp, #4]
	adds r0, #2
	str r0, [sp, #0x14]
	cmp r6, r1
	bge _0807E0D2
	mov r1, sb
	adds r1, #0x4c
	str r1, [sp, #8]
	ldr r2, _0807E060 @ =gUnknown_03005938
	mov sl, r2
_0807DFF6:
	movs r4, #0
	ldr r0, _0807E064 @ =gUnknown_030058D4
	adds r5, r6, r0
	mov r8, r4
	movs r7, #0x25
_0807E000:
	ldr r3, [sp, #8]
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r0, #0xd
	ble _0807E070
	mov r0, sb
	adds r0, #0x52
	ldrh r0, [r0]
	adds r0, r0, r4
	mov r2, sb
	ldr r1, [r2, #0x58]
	ldr r3, _0807E068 @ =gUnknown_03005948
	adds r1, r1, r3
	ldrb r1, [r1]
	bl DivRem
	mov r2, sb
	ldr r1, [r2, #0x5c]
	adds r0, r0, r1
	ldr r3, _0807E06C @ =gUnknown_030058E0
	adds r0, r0, r3
	ldrb r1, [r5]
	ldrb r0, [r0]
	cmp r1, r0
	bne _0807E0BA
	ldr r0, [r2, #0x30]
	movs r2, #0x43
	subs r2, r2, r0
	mov r0, r8
	subs r2, r2, r0
	movs r0, #0xff
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
	movs r0, #0
	str r0, [sp]
	adds r0, r6, #0
	adds r0, #0x4a
	adds r1, r7, #0
	movs r3, #0
	bl sub_0801F34C
	b _0807E0BA
	.align 2, 0
_0807E058: .4byte 0x000039A4
_0807E05C: .4byte 0x000049C8
_0807E060: .4byte gUnknown_03005938
_0807E064: .4byte gUnknown_030058D4
_0807E068: .4byte gUnknown_03005948
_0807E06C: .4byte gUnknown_030058E0
_0807E070:
	mov r1, sl
	ldrh r0, [r1]
	adds r0, r0, r4
	ldrh r1, [r1, #2]
	ldr r2, _0807E1B0 @ =gUnknown_03005948
	adds r1, r1, r2
	ldrb r1, [r1]
	bl DivRem
	mov r3, sl
	ldrh r1, [r3, #4]
	adds r0, r0, r1
	ldr r1, _0807E1B4 @ =gUnknown_030058E0
	adds r0, r0, r1
	ldrb r1, [r5]
	ldrb r0, [r0]
	cmp r1, r0
	bne _0807E0BA
	mov r2, sb
	ldr r0, [r2, #0x30]
	movs r2, #0x43
	subs r2, r2, r0
	mov r3, r8
	subs r2, r2, r3
	movs r0, #0xff
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
	movs r0, #0
	str r0, [sp]
	adds r0, r6, #0
	adds r0, #0x4a
	adds r1, r7, #0
	movs r3, #0
	bl sub_0801F34C
_0807E0BA:
	movs r0, #0x18
	add r8, r0
	adds r7, #0x48
	adds r4, #1
	cmp r4, #2
	ble _0807E000
	adds r6, #1
	ldr r1, [sp, #0x10]
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r6, r0
	blt _0807DFF6
_0807E0D2:
	ldr r5, _0807E1B8 @ =gUnknown_03002F18
	mov r3, sb
	ldr r0, [r3, #0x3c]
	movs r1, #4
	bl Div
	movs r1, #4
	bl DivRem
	mov r2, sb
	ldr r1, [r2, #0x30]
	adds r1, #0x24
	subs r1, r1, r0
	strh r1, [r5]
	ldr r4, _0807E1BC @ =gUnknown_03002B34
	ldr r0, [r2, #0x3c]
	movs r1, #4
	bl Div
	movs r1, #4
	bl DivRem
	lsls r1, r0, #1
	adds r1, r1, r0
	strh r1, [r4]
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0807E118
	ldrh r0, [r5]
	subs r0, #4
	strh r0, [r5]
	ldrh r0, [r4]
	adds r0, #0xc
	strh r0, [r4]
_0807E118:
	mov r3, sb
	ldr r0, [r3, #0x60]
	ldr r1, [sp, #4]
	ldrh r0, [r1]
	movs r1, #0x20
	bl DivRem
	adds r3, r0, #0
	movs r5, #0x20
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #8
	bl Interpolate
	movs r4, #0x18
	subs r4, r4, r0
	ldr r2, [sp, #4]
	movs r3, #0
	ldrsh r0, [r2, r3]
	movs r1, #0x20
	bl DivRem
	adds r3, r0, #0
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #4
	bl Interpolate
	adds r2, r0, #0
	adds r2, #0x3c
	movs r6, #0
	str r6, [sp]
	movs r0, #0x48
	adds r1, r4, #0
	movs r3, #0
	bl sub_0801F34C
	ldr r1, [sp, #4]
	ldrh r0, [r1]
	movs r1, #0x20
	bl DivRem
	adds r3, r0, #0
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #8
	bl Interpolate
	adds r4, r0, #0
	adds r4, #0x58
	ldr r2, [sp, #4]
	movs r3, #0
	ldrsh r0, [r2, r3]
_0807E188:
	movs r1, #0x20
	bl DivRem
	adds r3, r0, #0
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #4
	bl Interpolate
	movs r2, #0x2c
	subs r2, r2, r0
	str r6, [sp]
_0807E1A2:
	movs r0, #0x49
	adds r1, r4, #0
	movs r3, #0
	bl sub_0801F34C
	b _0807E33A
	.align 2, 0
_0807E1B0: .4byte gUnknown_03005948
_0807E1B4: .4byte gUnknown_030058E0
_0807E1B8: .4byte gUnknown_03002F18
_0807E1BC: .4byte gUnknown_03002B34
_0807E1C0:
	movs r2, #0xa6
	lsls r2, r2, #6
	movs r0, #0x40
	movs r1, #0x54
	movs r3, #5
	bl sub_08043FD8
	ldr r1, _0807E490 @ =0x0000043C
	ldr r2, _0807E494 @ =0x000039A4
	movs r0, #0x88
	movs r3, #5
	bl sub_08043FD8
	ldr r1, _0807E498 @ =0x00000424
	ldr r2, _0807E49C @ =0x000049C8
	movs r0, #0xd0
	movs r3, #5
	bl sub_08043FD8
	movs r6, #0
	mov r0, sb
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	str r0, [sp, #0x10]
	mov r3, sb
	adds r3, #0x48
	str r3, [sp, #4]
	adds r0, #2
	str r0, [sp, #0x14]
	cmp r6, r1
	bge _0807E26A
	movs r1, #0x52
	add r1, sb
	mov sl, r1
_0807E206:
	movs r4, #0
	ldr r0, _0807E4A0 @ =gUnknown_030058D4
	adds r0, r0, r6
	mov r8, r0
	movs r7, #0
	movs r5, #0x25
_0807E212:
	mov r2, sl
	ldrh r0, [r2]
	adds r0, r0, r4
	ldr r2, _0807E4A4 @ =gUnknown_03005948
	mov r3, sb
	ldr r1, [r3, #0x58]
	adds r1, r1, r2
	ldrb r1, [r1]
	bl DivRem
	mov r2, sb
	ldr r1, [r2, #0x5c]
	adds r0, r0, r1
	ldr r3, _0807E4A8 @ =gUnknown_030058E0
	adds r0, r0, r3
	mov r2, r8
	ldrb r1, [r2]
	ldrb r0, [r0]
	cmp r1, r0
	bne _0807E254
	movs r2, #0x43
	subs r2, r2, r7
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
	movs r0, #0
	str r0, [sp]
	adds r0, r6, #0
	adds r0, #0x4a
	adds r1, r5, #0
	movs r3, #0
	bl sub_0801F34C
_0807E254:
	adds r7, #0x18
	adds r5, #0x48
	adds r4, #1
	cmp r4, #2
	ble _0807E212
	adds r6, #1
	ldr r3, [sp, #0x10]
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r6, r0
	blt _0807E206
_0807E26A:
	ldr r5, _0807E4AC @ =gUnknown_03002F18
	mov r2, sb
	ldr r0, [r2, #0x3c]
	movs r1, #3
	bl Div
	movs r1, #4
	bl DivRem
	movs r1, #0x24
	subs r1, r1, r0
	strh r1, [r5]
	ldr r4, _0807E4B0 @ =gUnknown_03002B34
	mov r3, sb
	ldr r0, [r3, #0x3c]
	movs r1, #3
	bl Div
	movs r1, #4
	bl DivRem
	lsls r1, r0, #1
	adds r1, r1, r0
	strh r1, [r4]
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0807E2AE
	ldrh r0, [r5]
	subs r0, #4
	strh r0, [r5]
	ldrh r0, [r4]
	adds r0, #0xc
	strh r0, [r4]
_0807E2AE:
	ldr r1, [sp, #4]
	ldrh r0, [r1]
	movs r1, #0x20
	bl DivRem
	adds r3, r0, #0
	movs r5, #0x20
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #8
	bl Interpolate
	movs r4, #0x18
	subs r4, r4, r0
	ldr r2, [sp, #4]
	ldrh r0, [r2]
	movs r1, #0x20
	bl DivRem
	adds r3, r0, #0
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #4
	bl Interpolate
	adds r2, r0, #0
	adds r2, #0x3c
	movs r6, #0
	str r6, [sp]
	movs r0, #0x48
	adds r1, r4, #0
	movs r3, #0
	bl sub_0801F34C
	ldr r3, [sp, #4]
	ldrh r0, [r3]
	movs r1, #0x20
	bl DivRem
	adds r3, r0, #0
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #8
	bl Interpolate
	adds r4, r0, #0
	adds r4, #0x58
	ldr r1, [sp, #4]
	ldrh r0, [r1]
	movs r1, #0x20
	bl DivRem
	adds r3, r0, #0
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #4
	bl Interpolate
	movs r2, #0x2c
	subs r2, r2, r0
	str r6, [sp]
	movs r0, #0x49
	adds r1, r4, #0
	movs r3, #0
	bl sub_0801F34C
_0807E33A:
	ldr r0, _0807E4B4 @ =gUnknown_03005944
	ldr r0, [r0]
	cmp r0, #1
	ble _0807E372
	ldr r0, _0807E4B8 @ =gUnknown_030059C0
	ldr r2, [sp, #0x10]
	movs r3, #0
	ldrsh r1, [r2, r3]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	beq _0807E372
	movs r4, #2
	str r4, [sp]
	movs r0, #0x43
	movs r1, #0x38
	movs r2, #0x1c
	movs r3, #0
	bl sub_0801F34C
	str r4, [sp]
	movs r0, #0x44
	movs r1, #0x38
	movs r2, #0x54
	movs r3, #0
	bl sub_0801F34C
_0807E372:
	mov r1, sb
	ldr r0, [r1, #0x34]
	adds r0, #0xb0
	movs r2, #0x82
	lsls r2, r2, #5
	movs r1, #1
	str r1, [sp]
	movs r1, #0xa0
	movs r3, #0
	bl sub_08043C28
	mov r0, sb
	bl sub_0807D800
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807E3A8
	mov r0, sb
	adds r0, #0x4e
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _0807E3A8
	mov r3, sb
	ldr r0, [r3, #0x60]
	cmp r0, #0
	beq _0807E3BE
_0807E3A8:
	ldr r1, [sp, #0x10]
	movs r2, #0
	ldrsh r0, [r1, r2]
	adds r0, #0x4a
	movs r1, #0
	str r1, [sp]
	movs r1, #0x25
	movs r2, #0x43
	movs r3, #0
	bl sub_0801F34C
_0807E3BE:
	ldr r3, _0807E4BC @ =gUnknown_0848B6A0
	movs r4, #0
	str r4, [sp]
	movs r0, #1
	movs r1, #0x20
	movs r2, #0x1c
	bl PutSprite
	str r4, [sp]
	movs r0, #0x67
	movs r1, #0xb9
	movs r2, #0x86
	movs r3, #0
	bl sub_0801F34C
	str r4, [sp]
	movs r0, #0x62
	movs r1, #0xb9
	movs r2, #0x8e
	movs r3, #0
	bl sub_0801F34C
	str r4, [sp]
	movs r0, #0x65
	movs r1, #0xb9
	movs r2, #0x96
	movs r3, #0
	bl sub_0801F34C
	movs r6, #0
	ldr r3, [sp, #0x10]
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r6, r0
	bge _0807E42A
	movs r5, #0xf0
	lsls r5, r5, #2
	movs r4, #0x68
_0807E40A:
	movs r2, #0x90
	lsls r2, r2, #8
	orrs r2, r5
	movs r0, #0x2a
	adds r1, r4, #0
	movs r3, #0
	bl sub_08043B60
	adds r5, #0xc
	adds r4, #0x10
	adds r6, #1
	ldr r2, [sp, #0x10]
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r6, r0
	blt _0807E40A
_0807E42A:
	bl sub_0803BD14
	cmp r6, r0
	blt _0807E434
	b _0807E59A
_0807E434:
	ldr r1, [sp, #0x14]
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bgt _0807E440
	b _0807E57C
_0807E440:
	mov r0, sb
	adds r0, #0x4c
	movs r3, #0
	ldrsh r1, [r0, r3]
	str r0, [sp, #8]
	cmp r1, #8
	ble _0807E450
	b _0807E57C
_0807E450:
	ldr r4, _0807E4C0 @ =gUnknown_081D9364
	ldr r0, [r4]
	adds r0, #0x80
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	mov r8, r0
	movs r7, #0x80
	lsls r7, r7, #1
	ldr r2, [sp, #8]
	movs r0, #0
	ldrsh r3, [r2, r0]
	movs r5, #8
	str r5, [sp]
	movs r0, #0
	movs r1, #0x10
	adds r2, r7, #0
	bl Interpolate
	cmp r0, #0
	beq _0807E4C4
	ldr r1, [sp, #8]
	movs r2, #0
	ldrsh r3, [r1, r2]
	str r5, [sp]
	movs r0, #0
	movs r1, #0x10
	adds r2, r7, #0
	bl Interpolate
	adds r1, r0, #0
	b _0807E4C6
	.align 2, 0
_0807E490: .4byte 0x0000043C
_0807E494: .4byte 0x000039A4
_0807E498: .4byte 0x00000424
_0807E49C: .4byte 0x000049C8
_0807E4A0: .4byte gUnknown_030058D4
_0807E4A4: .4byte gUnknown_03005948
_0807E4A8: .4byte gUnknown_030058E0
_0807E4AC: .4byte gUnknown_03002F18
_0807E4B0: .4byte gUnknown_03002B34
_0807E4B4: .4byte gUnknown_03005944
_0807E4B8: .4byte gUnknown_030059C0
_0807E4BC: .4byte gUnknown_0848B6A0
_0807E4C0: .4byte gUnknown_081D9364
_0807E4C4:
	movs r1, #2
_0807E4C6:
	mov r0, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
	ldr r0, _0807E51C @ =gSinLut
	movs r3, #0
	ldrsh r4, [r0, r3]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r5, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	lsls r4, r4, #4
	ldr r0, [sp, #8]
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r7, #8
	str r7, [sp]
	movs r0, #0
	movs r1, #0x10
	adds r2, r5, #0
	bl Interpolate
	cmp r0, #0
	beq _0807E520
	ldr r2, [sp, #8]
	movs r0, #0
	ldrsh r3, [r2, r0]
	str r7, [sp]
	movs r0, #0
	movs r1, #0x10
	adds r2, r5, #0
	bl Interpolate
	adds r1, r0, #0
	b _0807E522
	.align 2, 0
_0807E51C: .4byte gSinLut
_0807E520:
	movs r1, #2
_0807E522:
	adds r0, r4, #0
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r0, _0807E578 @ =gSinLut
	adds r0, #0x80
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r5, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	mov r1, sl
	mov r2, r8
	adds r3, r4, #0
	bl SetObjAffine
	lsls r1, r6, #4
	adds r1, #0x68
	orrs r1, r5
	lsls r2, r6, #1
	adds r2, r2, r6
	lsls r2, r2, #2
	movs r3, #0xf0
	lsls r3, r3, #2
	adds r2, r2, r3
	movs r0, #0x90
	lsls r0, r0, #8
	orrs r2, r0
	movs r0, #0x2a
	movs r3, #0
	bl sub_08043B60
	b _0807E59A
	.align 2, 0
_0807E578: .4byte gSinLut
_0807E57C:
	lsls r1, r6, #4
	adds r1, #0x68
	lsls r2, r6, #1
	adds r2, r2, r6
	lsls r2, r2, #2
	movs r0, #0xf0
	lsls r0, r0, #2
	adds r2, r2, r0
	movs r0, #0x90
	lsls r0, r0, #8
	orrs r2, r0
	movs r0, #0x2a
	movs r3, #0
	bl sub_08043B60
_0807E59A:
	adds r4, r6, #1
	bl sub_0803BD14
	adds r7, r4, #0
	cmp r7, r0
	blt _0807E5A8
	b _0807E6D0
_0807E5A8:
	ldr r1, [sp, #0x14]
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	blt _0807E5B4
	b _0807E6D0
_0807E5B4:
	mov r0, sb
	adds r0, #0x4c
	movs r3, #0
	ldrsh r1, [r0, r3]
	str r0, [sp, #8]
	cmp r1, #8
	ble _0807E5C4
	b _0807E6D0
_0807E5C4:
	ldr r0, _0807E618 @ =gUnknown_030059C0
	ldr r2, [sp, #0x10]
	movs r3, #0
	ldrsh r1, [r2, r3]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	beq _0807E5D8
	b _0807E6D0
_0807E5D8:
	ldr r4, _0807E61C @ =gUnknown_081D9364
	ldr r0, [r4]
	adds r0, #0x80
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	mov r8, r0
	movs r6, #0x80
	lsls r6, r6, #1
	ldr r2, [sp, #8]
	movs r0, #0
	ldrsh r3, [r2, r0]
	movs r5, #8
	str r5, [sp]
	movs r0, #0
	adds r1, r6, #0
	movs r2, #0x10
	bl Interpolate
	cmp r0, #0
	beq _0807E620
	ldr r1, [sp, #8]
	movs r2, #0
	ldrsh r3, [r1, r2]
	str r5, [sp]
	movs r0, #0
	adds r1, r6, #0
	movs r2, #0x10
	bl Interpolate
	adds r1, r0, #0
	b _0807E622
	.align 2, 0
_0807E618: .4byte gUnknown_030059C0
_0807E61C: .4byte gUnknown_081D9364
_0807E620:
	movs r1, #2
_0807E622:
	mov r0, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
	ldr r0, _0807E678 @ =gSinLut
	movs r3, #0
	ldrsh r4, [r0, r3]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r5, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	lsls r4, r4, #4
	ldr r0, [sp, #8]
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r6, #8
	str r6, [sp]
	movs r0, #0
	adds r1, r5, #0
	movs r2, #0x10
	bl Interpolate
	cmp r0, #0
	beq _0807E67C
	ldr r2, [sp, #8]
	movs r0, #0
	ldrsh r3, [r2, r0]
	str r6, [sp]
	movs r0, #0
	adds r1, r5, #0
	movs r2, #0x10
	bl Interpolate
	adds r1, r0, #0
	b _0807E67E
	.align 2, 0
_0807E678: .4byte gSinLut
_0807E67C:
	movs r1, #2
_0807E67E:
	adds r0, r4, #0
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r0, _0807E754 @ =gSinLut
	adds r0, #0x80
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r5, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	mov r1, sl
	mov r2, r8
	adds r3, r4, #0
	bl SetObjAffine
	lsls r1, r7, #4
	adds r1, #0x68
	orrs r1, r5
	lsls r2, r7, #1
	adds r2, r2, r7
	lsls r2, r2, #2
	movs r3, #0xf0
	lsls r3, r3, #2
	adds r2, r2, r3
	movs r0, #0x90
	lsls r0, r0, #8
	orrs r2, r0
	movs r0, #0x2a
	movs r3, #0
	bl sub_08043B60
_0807E6D0:
	ldr r1, [sp, #0x14]
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _0807E6EA
	mov r0, sb
	adds r0, #0x4c
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #8
	bne _0807E6EA
	movs r0, #0
	strh r0, [r1]
_0807E6EA:
	ldr r0, _0807E758 @ =gUnknown_030059C0
	ldr r1, [sp, #0x10]
	movs r3, #0
	ldrsh r2, [r1, r3]
	lsls r1, r2, #2
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	beq _0807E764
	movs r6, #0
	cmp r6, r2
	bge _0807E72E
	ldr r5, _0807E75C @ =gUnknown_03005958
	movs r4, #0x68
_0807E706:
	ldr r0, _0807E760 @ =gUnknown_0300599C
	adds r0, r6, r0
	ldrb r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	adds r0, #0x3e
	movs r1, #2
	str r1, [sp]
	movs r1, #0x14
	adds r2, r4, #0
	movs r3, #0
	bl sub_0801F34C
	adds r4, #0x10
	adds r6, #1
	ldr r1, [sp, #0x10]
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r6, r0
	blt _0807E706
_0807E72E:
	bl sub_0803BD14
	cmp r6, r0
	bge _0807E78C
	ldr r1, _0807E75C @ =gUnknown_03005958
	mov r3, sb
	ldr r0, [r3, #0x58]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r0, #0x3e
	lsls r2, r6, #4
	adds r2, #0x68
	movs r1, #2
	str r1, [sp]
	movs r1, #0x14
	movs r3, #0
	bl sub_0801F34C
	b _0807E78C
	.align 2, 0
_0807E754: .4byte gSinLut
_0807E758: .4byte gUnknown_030059C0
_0807E75C: .4byte gUnknown_03005958
_0807E760: .4byte gUnknown_0300599C
_0807E764:
	movs r6, #0
	movs r4, #0x68
	b _0807E784
_0807E76A:
	ldr r0, _0807E7F8 @ =gUnknown_03005958
	adds r0, r6, r0
	ldrb r0, [r0]
	adds r0, #0x3e
	movs r1, #2
	str r1, [sp]
	movs r1, #0x14
	adds r2, r4, #0
	movs r3, #0
	bl sub_0801F34C
	adds r4, #0x10
	adds r6, #1
_0807E784:
	bl sub_0803BD14
	cmp r6, r0
	blt _0807E76A
_0807E78C:
	mov r1, sb
	ldr r0, [r1, #0x40]
	cmp r0, #0
	bgt _0807E796
	b _0807E936
_0807E796:
	mov r0, sb
	adds r0, #0x4c
	movs r2, #0
	ldrsh r1, [r0, r2]
	str r0, [sp, #8]
	cmp r1, #7
	ble _0807E7A6
	b _0807E924
_0807E7A6:
	adds r0, #0x1e
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	bne _0807E7B2
	b _0807E924
_0807E7B2:
	ldr r4, _0807E7FC @ =gUnknown_081D9364
	ldr r0, [r4]
	adds r0, #0x80
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	mov r8, r0
	movs r6, #0x80
	lsls r6, r6, #2
	movs r7, #0x80
	lsls r7, r7, #1
	ldr r2, [sp, #8]
	movs r0, #0
	ldrsh r3, [r2, r0]
	movs r5, #7
	str r5, [sp]
	movs r0, #1
	adds r1, r6, #0
	adds r2, r7, #0
	bl Interpolate
	cmp r0, #0
	beq _0807E800
	ldr r1, [sp, #8]
	movs r2, #0
	ldrsh r3, [r1, r2]
	str r5, [sp]
	movs r0, #1
	adds r1, r6, #0
	adds r2, r7, #0
	bl Interpolate
	adds r1, r0, #0
	b _0807E802
	.align 2, 0
_0807E7F8: .4byte gUnknown_03005958
_0807E7FC: .4byte gUnknown_081D9364
_0807E800:
	movs r1, #2
_0807E802:
	mov r0, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
	ldr r0, _0807E850 @ =gSinLut
	movs r3, #0
	ldrsh r0, [r0, r3]
	rsbs r0, r0, #0
	lsls r7, r0, #4
	movs r5, #0x80
	lsls r5, r5, #2
	movs r6, #0x80
	lsls r6, r6, #1
	ldr r0, [sp, #8]
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r4, #7
	str r4, [sp]
	movs r0, #1
	adds r1, r5, #0
	adds r2, r6, #0
	bl Interpolate
	cmp r0, #0
	beq _0807E854
	ldr r2, [sp, #8]
	movs r0, #0
	ldrsh r3, [r2, r0]
	str r4, [sp]
	movs r0, #1
	adds r1, r5, #0
	adds r2, r6, #0
	bl Interpolate
	adds r1, r0, #0
	b _0807E856
	.align 2, 0
_0807E850: .4byte gSinLut
_0807E854:
	movs r1, #2
_0807E856:
	adds r0, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sb, r0
	ldr r0, _0807E8A0 @ =gSinLut
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r7, r0, #4
	movs r5, #0x80
	lsls r5, r5, #2
	movs r6, #0x80
	lsls r6, r6, #1
	ldr r2, [sp, #8]
	movs r0, #0
	ldrsh r3, [r2, r0]
	movs r4, #7
	str r4, [sp]
	movs r0, #1
	adds r1, r5, #0
	adds r2, r6, #0
	bl Interpolate
	cmp r0, #0
	beq _0807E8A4
	ldr r1, [sp, #8]
	movs r2, #0
	ldrsh r3, [r1, r2]
	str r4, [sp]
	movs r0, #1
	adds r1, r5, #0
	adds r2, r6, #0
	bl Interpolate
	adds r1, r0, #0
	b _0807E8A6
	.align 2, 0
_0807E8A0: .4byte gSinLut
_0807E8A4:
	movs r1, #2
_0807E8A6:
	adds r0, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	ldr r0, _0807E8F4 @ =gSinLut
	adds r0, #0x80
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r4, r0, #4
	movs r6, #0x80
	lsls r6, r6, #2
	movs r7, #0x80
	lsls r7, r7, #1
	ldr r0, [sp, #8]
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r5, #7
	str r5, [sp]
	movs r0, #1
	adds r1, r6, #0
	adds r2, r7, #0
	bl Interpolate
	cmp r0, #0
	beq _0807E8F8
	ldr r2, [sp, #8]
	movs r0, #0
	ldrsh r3, [r2, r0]
	str r5, [sp]
	movs r0, #1
	adds r1, r6, #0
	adds r2, r7, #0
	bl Interpolate
	adds r1, r0, #0
	b _0807E8FA
	.align 2, 0
_0807E8F4: .4byte gSinLut
_0807E8F8:
	movs r1, #2
_0807E8FA:
	adds r0, r4, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #1
	mov r1, sl
	mov r2, sb
	mov r3, r8
	bl SetObjAffine
	ldr r1, _0807E920 @ =0x0000024A
	movs r2, #0xd8
	lsls r2, r2, #2
	movs r0, #0
	str r0, [sp]
	movs r0, #0x4f
	b _0807E92E
	.align 2, 0
_0807E920: .4byte 0x0000024A
_0807E924:
	movs r0, #0
	str r0, [sp]
	movs r0, #0x4f
	movs r1, #0x5a
	movs r2, #0x68
_0807E92E:
	movs r3, #0
	bl sub_0801F34C
	b _0807E96E
_0807E936:
	movs r4, #0
	str r4, [sp]
	movs r0, #0x54
	movs r1, #0x5c
	movs r2, #0x68
	movs r3, #0
	bl sub_0801F34C
	bl sub_0803BD14
	ldr r2, [sp, #0x10]
	movs r3, #0
	ldrsh r1, [r2, r3]
	subs r1, #0x55
	subs r0, r0, r1
	str r4, [sp]
	movs r1, #0x65
	movs r2, #0x70
	movs r3, #0
	bl sub_0801F34C
	str r4, [sp]
	movs r0, #0x5f
	movs r1, #0x6d
	movs r2, #0x70
	movs r3, #0
	bl sub_0801F34C
_0807E96E:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

