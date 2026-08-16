	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802FACC
sub_0802FACC: @ 0x0802FACC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	ldr r1, _0802FB0C @ =gUnknown_08090CA8
	ldr r5, [r1]
	ldr r4, [r5]
	ldrh r0, [r4, #4]
	mov sb, r1
	cmp r0, #4
	bhi _0802FAE6
	b _08030028
_0802FAE6:
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _0802FAEE
	b _08030028
_0802FAEE:
	ldrb r0, [r4, #0x1a]
	adds r0, #1
	ldrb r1, [r4, #0x1a]
	strb r0, [r4, #0x1a]
	ldr r1, [r5]
	ldrh r0, [r1, #4]
	cmp r0, #6
	bne _0802FB86
	ldrb r0, [r1, #0x1a]
	cmp r0, #0x3c
	bls _0802FB10
	ldrb r0, [r1, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0802FB5A
	.align 2, 0
_0802FB0C: .4byte gUnknown_08090CA8
_0802FB10:
	ldrb r0, [r1, #1]
	cmp r0, #0
	beq _0802FB34
	bl sub_0802F408
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0802FB34
	ldr r0, [r5]
	ldrb r1, [r0, #6]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0xa
	adds r0, r0, r1
	ldrb r1, [r0]
	strb r2, [r0]
	b _08030018
_0802FB34:
	mov r1, sb
	ldr r0, [r1]
	ldr r2, [r0]
	ldrb r0, [r2, #1]
	cmp r0, #2
	bne _0802FB6C
	ldrb r0, [r2, #0x1b]
	cmp r0, #0x78
	bhi _0802FB52
	ldr r0, _0802FB68 @ =gUnknown_0849B01C
	ldr r0, [r0]
	ldrb r1, [r0, #4]
	ldrb r0, [r0, #5]
	cmp r1, r0
	bne _0802FB6C
_0802FB52:
	ldrb r0, [r2, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r2, #0
_0802FB5A:
	adds r1, #0xa
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r0, #0
	strb r0, [r1]
	b _08030018
	.align 2, 0
_0802FB68: .4byte gUnknown_0849B01C
_0802FB6C:
	movs r7, #0
	ldr r0, _0802FBD8 @ =gUnknown_0849B018
	ldr r2, [r0]
	adds r1, r2, #0
	adds r1, #0x16
_0802FB76:
	adds r0, r1, r7
	ldrb r0, [r0]
	cmp r0, #0x3c
	bls _0802FB80
	b _0803000C
_0802FB80:
	adds r7, #1
	cmp r7, #3
	ble _0802FB76
_0802FB86:
	mov r2, sb
	ldr r0, [r2]
	ldr r2, [r0]
	ldrb r0, [r2, #1]
	adds r1, r0, #0
	cmp r1, #1
	beq _0802FB96
	b _0802FFDC
_0802FB96:
	ldrb r0, [r2, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r0
	ldrb r0, [r2, #0x1c]
	orrs r1, r0
	ldrb r0, [r2, #0x1c]
	strb r1, [r2, #0x1c]
	movs r7, #0
_0802FBA8:
	lsls r4, r7, #0x18
	asrs r0, r4, #0x18
	mov r1, sb
	ldr r5, [r1]
	ldr r1, [r5]
	adds r1, #0x2c
	bl sub_0802F6A0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r2, r7, #1
	mov r8, r2
	cmp r0, #0
	bgt _0802FBC6
	b _0802FED8
_0802FBC6:
	cmp r0, #0x1a
	beq _0802FBE8
	cmp r0, #0x1a
	bgt _0802FBDC
	cmp r0, #4
	bne _0802FBD4
	b _0802FD40
_0802FBD4:
	b _0802FED8
	.align 2, 0
_0802FBD8: .4byte gUnknown_0849B018
_0802FBDC:
	cmp r0, #0x84
	bne _0802FBE2
	b _0802FD0C
_0802FBE2:
	cmp r0, #0x86
	beq _0802FBE8
	b _0802FED8
_0802FBE8:
	mov r0, sb
	ldr r5, [r0]
	ldr r2, [r5]
	adds r6, r2, #0
	adds r6, #0x2c
	ldrb r0, [r6]
	cmp r0, #0xad
	beq _0802FC6C
	adds r1, r7, #1
	mov r8, r1
	cmp r0, #0xaf
	beq _0802FC02
	b _0802FED8
_0802FC02:
	adds r4, r2, #0
	adds r4, #0x2d
	ldrb r1, [r4]
	ldrb r0, [r2, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne _0802FC14
	b _0802FED8
_0802FC14:
	lsls r0, r1, #1
	adds r3, r2, #0
	adds r3, #0x24
	adds r0, r3, r0
	ldrh r1, [r0]
	ldrh r0, [r2, #0x2e]
	cmp r0, r1
	beq _0802FC44
	ldr r0, _0802FC40 @ =gUnknown_0202575C
	movs r1, #0xae
	strb r1, [r0]
	ldrb r1, [r2, #6]
	strb r1, [r0, #1]
	ldrb r1, [r4]
	lsls r1, r1, #1
	adds r1, r3, r1
	ldrh r1, [r1]
	strh r1, [r0, #2]
	movs r1, #4
	bl sub_0802F588
	b _0802FBA8
	.align 2, 0
_0802FC40: .4byte gUnknown_0202575C
_0802FC44:
	adds r0, r6, #0
	bl sub_08030838
	ldr r0, _0802FC68 @ =gUnknown_0202575C
	movs r1, #0xae
	strb r1, [r0]
	ldr r2, [r5]
	ldrb r1, [r2, #6]
	strb r1, [r0, #1]
	ldrb r1, [r4]
	lsls r1, r1, #1
	adds r2, #0x24
	adds r2, r2, r1
	ldrh r1, [r2]
	adds r1, #1
	strh r1, [r0, #2]
	b _0802FD00
	.align 2, 0
_0802FC68: .4byte gUnknown_0202575C
_0802FC6C:
	movs r3, #0
	adds r0, r7, #1
	mov r8, r0
	ldr r0, _0802FCD4 @ =gUnknown_020257E4
	adds r5, r2, #0
	adds r5, #0x32
	movs r1, #0xd
	muls r1, r7, r1
	adds r2, r1, r0
_0802FC7E:
	adds r0, r5, r3
	ldrb r0, [r0]
	ldrb r1, [r2]
	strb r0, [r2]
	adds r2, #1
	adds r3, #1
	cmp r3, #0xc
	ble _0802FC7E
	asrs r0, r4, #0x18
	bl sub_0802F460
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802FCAE
	mov r1, sb
	ldr r0, [r1]
	ldr r1, [r0]
	ldrb r0, [r1]
	ldrb r2, [r6, #2]
	cmp r0, r2
	bne _0802FCAE
	ldrh r0, [r1, #4]
	cmp r0, #5
	bls _0802FCBC
_0802FCAE:
	asrs r0, r4, #0x18
	bl sub_0802F460
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0802FCDC
_0802FCBC:
	mov r1, sb
	ldr r0, [r1]
	ldr r2, [r0]
	ldrb r0, [r2, #6]
	cmp r0, #0
	beq _0802FCCA
	b _0802FED8
_0802FCCA:
	ldr r0, _0802FCD8 @ =gUnknown_0202575C
	movs r1, #0xa6
	strb r1, [r0]
	ldrb r1, [r2, #6]
	b _0802FCFC
	.align 2, 0
_0802FCD4: .4byte gUnknown_020257E4
_0802FCD8: .4byte gUnknown_0202575C
_0802FCDC:
	mov r2, sb
	ldr r0, [r2]
	ldr r1, [r0]
	ldrb r0, [r1, #6]
	cmp r0, #0
	beq _0802FCEA
	b _0802FED8
_0802FCEA:
	ldrb r0, [r1]
	movs r2, #0xa5
	ldrb r6, [r6, #2]
	cmp r0, r6
	beq _0802FCF6
	movs r2, #0xa7
_0802FCF6:
	ldr r0, _0802FD08 @ =gUnknown_0202575C
	strb r2, [r0]
	ldrb r1, [r1, #6]
_0802FCFC:
	strb r1, [r0, #1]
	strh r7, [r0, #2]
_0802FD00:
	movs r1, #4
	bl sub_0802F588
	b _0802FED8
	.align 2, 0
_0802FD08: .4byte gUnknown_0202575C
_0802FD0C:
	ldr r4, [r5]
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	cmp r0, #0xab
	beq _0802FD1A
	b _0802FED8
_0802FD1A:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	adds r1, r4, #0
	adds r1, #0x30
	bl sub_08030038
	ldr r2, _0802FD3C @ =gUnknown_03003F1C
	adds r1, r4, #0
	adds r1, #0x2d
	movs r0, #1
	ldrb r1, [r1]
	lsls r0, r1
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	b _0802FED8
	.align 2, 0
_0802FD3C: .4byte gUnknown_03003F1C
_0802FD40:
	ldr r0, [r5]
	adds r5, r0, #0
	adds r5, #0x2c
	ldrb r0, [r5]
	subs r0, #0xa5
	cmp r0, #9
	bls _0802FD50
	b _0802FED8
_0802FD50:
	lsls r0, r0, #2
	ldr r1, _0802FD5C @ =_0802FD60
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802FD5C: .4byte _0802FD60
_0802FD60: @ jump table
	.4byte _0802FE76 @ case 0
	.4byte _0802FEA4 @ case 1
	.4byte _0802FE3C @ case 2
	.4byte _0802FE08 @ case 3
	.4byte _0802FD88 @ case 4
	.4byte _0802FDF4 @ case 5
	.4byte _0802FED8 @ case 6
	.4byte _0802FED8 @ case 7
	.4byte _0802FED8 @ case 8
	.4byte _0802FDA4 @ case 9
_0802FD88:
	ldr r0, _0802FDA0 @ =gUnknown_030032D8
	ldrh r0, [r0]
	adds r7, #1
	mov r8, r7
	cmp r0, #0xd
	beq _0802FD96
	b _0802FED8
_0802FD96:
	ldrb r0, [r5, #1]
	bl sub_0802FA9C
	b _0802FED8
	.align 2, 0
_0802FDA0: .4byte gUnknown_030032D8
_0802FDA4:
	ldr r0, _0802FDDC @ =gUnknown_030044D8
	ldrb r0, [r0]
	ldrb r3, [r5, #1]
	cmp r0, #0
	beq _0802FDE0
	mov r1, sb
	ldr r0, [r1]
	ldr r2, [r0]
	ldrb r0, [r2, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r3, r0
	beq _0802FDE0
	ldrh r0, [r2, #0x22]
	adds r0, #1
	ldrh r1, [r5, #2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bne _0802FDE0
	movs r0, #1
	lsls r0, r7
	ldrb r1, [r2, #0x1c]
	orrs r0, r1
	ldrb r1, [r2, #0x1c]
	strb r0, [r2, #0x1c]
	b _0802FED4
	.align 2, 0
_0802FDDC: .4byte gUnknown_030044D8
_0802FDE0:
	mov r2, sb
	ldr r0, [r2]
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r3, r0
	bne _0802FDF2
	b _0802FBA8
_0802FDF2:
	b _0802FED4
_0802FDF4:
	ldr r0, _0802FE04 @ =gUnknown_030044C4
	movs r1, #1
	lsls r1, r7
	ldrb r2, [r0]
	orrs r1, r2
	strb r1, [r0]
	b _0802FED4
	.align 2, 0
_0802FE04: .4byte gUnknown_030044C4
_0802FE08:
	ldr r1, _0802FE34 @ =gUnknown_0300410C
	ldr r0, _0802FE38 @ =gUnknown_030040CC
	ldrh r0, [r0]
	strh r0, [r1]
	mov r0, sb
	ldr r2, [r0]
	ldr r0, [r2]
	adds r0, #0xa
	ldrb r1, [r5, #1]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r1, #0
	strb r1, [r0]
	ldr r2, [r2]
	movs r0, #1
	ldrb r5, [r5, #1]
	lsls r0, r5
	ldrb r1, [r2, #9]
	bics r1, r0
	ldrb r0, [r2, #9]
	strb r1, [r2, #9]
	b _0802FED4
	.align 2, 0
_0802FE34: .4byte gUnknown_0300410C
_0802FE38: .4byte gUnknown_030040CC
_0802FE3C:
	movs r0, #2
	ldrsb r0, [r5, r0]
	bl sub_0802F460
	lsls r0, r0, #0x18
	adds r7, #1
	mov r8, r7
	cmp r0, #0
	bne _0802FED8
	mov r2, sb
	ldr r3, [r2]
	ldr r1, [r3]
	ldrh r2, [r1, #2]
	movs r0, #0x30
	ands r0, r2
	lsrs r0, r0, #4
	adds r1, #0xa
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r2, #2
	strb r2, [r1]
	ldr r0, [r3]
	adds r0, #0xa
	ldrh r5, [r5, #2]
	adds r0, r0, r5
	ldrb r1, [r0]
	strb r2, [r0]
	ldr r1, [r3]
	b _0802FE9C
_0802FE76:
	movs r0, #2
	ldrsb r0, [r5, r0]
	bl sub_0802F460
	lsls r0, r0, #0x18
	adds r7, #1
	mov r8, r7
	cmp r0, #0
	bne _0802FED8
	mov r0, sb
	ldr r2, [r0]
	ldr r0, [r2]
	adds r0, #0xa
	ldrh r5, [r5, #2]
	adds r0, r0, r5
	ldrb r1, [r0]
	movs r1, #2
	strb r1, [r0]
	ldr r1, [r2]
_0802FE9C:
	ldrh r0, [r1, #4]
	movs r0, #6
	strh r0, [r1, #4]
	b _0802FED8
_0802FEA4:
	mov r1, sb
	ldr r3, [r1]
	ldr r1, [r3]
	adds r1, #0xa
	ldrh r2, [r5, #2]
	adds r1, r1, r2
	ldrb r0, [r1]
	movs r4, #0
	movs r0, #5
	strb r0, [r1]
	ldr r2, [r3]
	movs r1, #1
	ldrh r0, [r5, #2]
	lsls r1, r0
	ldrb r0, [r2, #9]
	orrs r1, r0
	ldrb r0, [r2, #9]
	strb r1, [r2, #9]
	ldr r0, [r3]
	adds r0, #0x16
	ldrh r5, [r5, #2]
	adds r0, r0, r5
	ldrb r1, [r0]
	strb r4, [r0]
_0802FED4:
	adds r7, #1
	mov r8, r7
_0802FED8:
	mov r7, r8
	cmp r7, #3
	bgt _0802FEE0
	b _0802FBA8
_0802FEE0:
	mov r1, sb
	ldr r5, [r1]
	ldr r1, [r5]
	ldrb r0, [r1, #0x1d]
	adds r4, r0, #0
	cmp r4, #0
	bne _0802FF4C
	ldrb r0, [r1, #0x1e]
	cmp r0, #0x3c
	bls _0802FF02
	bl sub_0802EA24
	ldr r0, [r5]
	ldrh r1, [r0, #4]
	movs r1, #2
	strh r1, [r0, #4]
	b _08030028
_0802FF02:
	mov r0, sp
	bl sub_080307E0
	adds r6, r0, #0
	cmp r6, #0
	beq _0802FF4C
	ldr r1, [sp]
	adds r1, #6
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_0802F588
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _0802FF3C
	ldr r0, [r5]
	ldrb r1, [r0, #0x1d]
	strb r4, [r0, #0x1d]
	ldr r1, [r5]
	ldrb r0, [r1, #0x1e]
	adds r0, #1
	ldrb r2, [r1, #0x1e]
	strb r0, [r1, #0x1e]
	ldr r1, _0802FF38 @ =gUnknown_030044D8
	movs r0, #1
	strb r0, [r1]
	b _0802FF4C
	.align 2, 0
_0802FF38: .4byte gUnknown_030044D8
_0802FF3C:
	ldr r0, [r5]
	ldrb r1, [r0, #0x1d]
	strb r4, [r0, #0x1d]
	ldr r1, [r5]
	ldrb r0, [r1, #0x1e]
	adds r0, #1
	ldrb r2, [r1, #0x1e]
	strb r0, [r1, #0x1e]
_0802FF4C:
	ldr r6, _0802FFB8 @ =gUnknown_030044D8
	ldrb r0, [r6]
	cmp r0, #0
	beq _0802FFC0
	mov r2, sb
	ldr r5, [r2]
	ldr r4, [r5]
	ldrb r0, [r4, #0x1c]
	ldrb r1, [r4, #9]
	ldrb r2, [r4, #9]
	ands r0, r1
	cmp r0, r2
	bne _0802FFC0
	ldrh r0, [r4, #0x22]
	adds r0, #1
	ldrh r1, [r4, #0x22]
	movs r3, #0
	strh r0, [r4, #0x22]
	ldr r2, _0802FFBC @ =0x00001AAC
	adds r0, r4, r2
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r4, r0
	movs r1, #0x96
	lsls r1, r1, #1
	adds r0, r0, r1
	strb r3, [r0]
	ldr r1, [r5]
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #1
	ldrb r4, [r1]
	strb r0, [r1]
	ldr r1, [r5]
	adds r1, r1, r2
	ldrb r2, [r1]
	movs r0, #0x1f
	ands r0, r2
	ldrb r2, [r1]
	strb r0, [r1]
	strb r3, [r6]
	ldr r0, [r5]
	ldrb r1, [r0, #0x1c]
	strb r3, [r0, #0x1c]
	ldrb r1, [r0, #0x1c]
	ldrb r2, [r0, #0x1e]
	strb r1, [r0, #0x1e]
	ldrb r1, [r0, #0x1e]
	ldrb r2, [r0, #0x1d]
	strb r1, [r0, #0x1d]
	b _08030028
	.align 2, 0
_0802FFB8: .4byte gUnknown_030044D8
_0802FFBC: .4byte 0x00001AAC
_0802FFC0:
	mov r0, sb
	ldr r2, [r0]
	ldr r1, [r2]
	ldrb r0, [r1, #0x1d]
	adds r0, #1
	ldrb r3, [r1, #0x1d]
	strb r0, [r1, #0x1d]
	ldr r1, [r2]
	ldrb r2, [r1, #0x1d]
	movs r0, #0xf
	ands r0, r2
	ldrb r2, [r1, #0x1d]
	strb r0, [r1, #0x1d]
	b _08030028
_0802FFDC:
	ldrb r0, [r2, #1]
	cmp r0, #2
	beq _0802FFE8
	ldrb r0, [r2, #1]
	cmp r0, #3
	bne _08030028
_0802FFE8:
	ldrb r0, [r2, #6]
	cmp r0, #0
	bne _08030028
	ldr r4, _08030004 @ =gUnknown_0849B01C
	ldr r0, [r4]
	adds r0, #6
	movs r1, #1
	bl sub_0802F8FC
	ldr r1, [r4]
	ldrh r0, [r1, #6]
	ldr r0, _08030008 @ =0x00005FFF
	strh r0, [r1, #6]
	b _08030028
	.align 2, 0
_08030004: .4byte gUnknown_0849B01C
_08030008: .4byte 0x00005FFF
_0803000C:
	adds r0, r2, #0
	adds r0, #0xa
	adds r0, r0, r7
	ldrb r1, [r0]
	movs r1, #0
	strb r1, [r0]
_08030018:
	bl sub_0802EA24
	mov r1, sb
	ldr r0, [r1]
	ldr r1, [r0]
	ldrh r0, [r1, #4]
	movs r0, #2
	strh r0, [r1, #4]
_08030028:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

