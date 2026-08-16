	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804A760
sub_0804A760: @ 0x0804A760
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r0, #0
	mov r8, r0
	ldr r4, _0804A7A4 @ =gUnknown_0812A284
	ldr r5, [r4]
	ldr r2, [r5]
	movs r3, #0x20
	ldrsh r1, [r2, r3]
	lsls r0, r1, #4
	subs r0, r0, r1
	ldrb r2, [r2, #0x1e]
	adds r0, r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_0804A18C
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, [r5]
	adds r2, r1, #0
	adds r2, #0x63
	ldrb r0, [r2]
	adds r7, r4, #0
	cmp r0, #2
	beq _0804A7B4
	cmp r0, #2
	bgt _0804A7A8
	cmp r0, #1
	beq _0804A7AE
	b _0804A81C
	.align 2, 0
_0804A7A4: .4byte gUnknown_0812A284
_0804A7A8:
	cmp r0, #3
	beq _0804A7FE
	b _0804A81C
_0804A7AE:
	mov r0, r8
	strb r0, [r2]
	b _0804A81C
_0804A7B4:
	ldr r0, _0804A7C4 @ =gUnknown_03002EE4
	ldrh r0, [r0]
	cmp r0, #1
	bne _0804A7C8
	mov r1, r8
	strb r1, [r2]
	b _0804A81C
	.align 2, 0
_0804A7C4: .4byte gUnknown_03002EE4
_0804A7C8:
	ldr r4, [r1, #0x58]
	adds r0, r1, #0
	adds r0, #0x2c
	bl sub_08013034
	movs r3, #0
	ldr r0, [r5]
	adds r0, #0x5f
	ldrb r0, [r0]
	cmp r3, r0
	bhs _0804A806
	adds r2, r5, #0
_0804A7E0:
	adds r1, r4, r3
	ldr r0, [r2]
	adds r0, #0x2c
	adds r0, r0, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, [r2]
	adds r0, #0x5f
	ldrb r0, [r0]
	cmp r3, r0
	blo _0804A7E0
	b _0804A806
_0804A7FE:
	ldr r0, _0804A810 @ =gUnknown_03002EE4
	ldrh r0, [r0]
	cmp r0, #1
	beq _0804A818
_0804A806:
	ldr r0, _0804A814 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
	b _0804AAE8
	.align 2, 0
_0804A810: .4byte gUnknown_03002EE4
_0804A814: .4byte gUnknown_03001FBC
_0804A818:
	mov r3, r8
	strb r3, [r2]
_0804A81C:
	ldr r1, _0804A838 @ =gUnknown_0812A288
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0, #4]
	movs r2, #0xf
	ands r2, r0
	mov sb, r1
	cmp r2, #2
	beq _0804A90E
	cmp r2, #2
	bgt _0804A83C
	cmp r2, #1
	beq _0804A852
	b _0804A934
	.align 2, 0
_0804A838: .4byte gUnknown_0812A288
_0804A83C:
	cmp r2, #8
	bne _0804A934
	ldr r0, [r7]
	ldr r1, [r0]
	movs r0, #0xe
	strh r0, [r1, #0x1e]
	movs r0, #5
	strh r0, [r1, #0x20]
_0804A84C:
	bl sub_0804A6D8
	b _0804AAE8
_0804A852:
	cmp r6, #0x24
	beq _0804A8D6
	cmp r6, #0x24
	bgt _0804A860
	cmp r6, #0x23
	beq _0804A84C
	b _0804A868
_0804A860:
	cmp r6, #0x25
	beq _0804A8F8
	cmp r6, #0x40
	beq _0804A8B8
_0804A868:
	ldr r4, [r7]
	ldr r2, [r4]
	adds r1, r2, #0
	adds r1, #0x65
	ldr r0, _0804A8B4 @ =gUnknown_084C36E4
	adds r0, r6, r0
	ldrb r0, [r0]
	adds r0, #1
	ldrb r1, [r1]
	adds r0, r0, r1
	adds r1, r2, #0
	adds r1, #0x60
	ldrb r1, [r1]
	cmp r0, r1
	bgt _0804A906
	adds r0, r2, #0
	adds r0, #0x5d
	ldrb r1, [r0]
	adds r0, #2
	ldrb r0, [r0]
	subs r0, #1
	cmp r1, r0
	bgt _0804A906
	movs r0, #0x65
	bl sub_0803B4DC
	bl sub_0804A64C
	movs r0, #0
	bl sub_0804A1E4
	ldr r1, [r4]
	adds r1, #0x5d
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0804AAE8
	.align 2, 0
_0804A8B4: .4byte gUnknown_084C36E4
_0804A8B8:
	ldr r3, [r7]
	ldr r2, [r3]
	adds r2, #0x66
	ldrb r0, [r2]
	adds r0, #1
	movs r4, #0
	movs r1, #0xff
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r0, [r3]
	adds r0, #0x67
	strb r4, [r0]
	b _0804AAE8
_0804A8D6:
	movs r0, #0x65
	bl sub_0803B4DC
	ldr r0, [r7]
	ldr r0, [r0]
	adds r0, #0x63
	movs r1, #3
	strb r1, [r0]
	movs r0, #0
	bl sub_0804A1E4
	ldr r0, _0804A8F4 @ =gUnknown_084C3A5C
	bl sub_080193B0
	b _0804AAE8
	.align 2, 0
_0804A8F4: .4byte gUnknown_084C3A5C
_0804A8F8:
	ldr r0, [r7]
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x5d
	ldrb r0, [r1]
	cmp r0, #0
	bne _0804A91E
_0804A906:
	movs r0, #0x68
	bl sub_0803B4DC
	b _0804AAE8
_0804A90E:
	ldr r0, [r7]
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x5d
	ldrb r0, [r1]
	cmp r0, #0
	bne _0804A91E
	b _0804AAE8
_0804A91E:
	subs r0, #1
	strb r0, [r1]
	bl sub_0804A68C
	movs r0, #0
	bl sub_0804A1E4
	movs r0, #0x66
	bl sub_0803B4DC
	b _0804AAE8
_0804A934:
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _0804A946
	b _0804AAE8
_0804A946:
	mov r3, sb
	ldr r0, [r3]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	beq _0804AA28
	ldr r0, [r7]
	ldr r2, [r0]
	movs r0, #0x20
	ldrsh r1, [r2, r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	ldrb r2, [r2, #0x1e]
	adds r0, r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_0804A18C
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x23
	blt _0804A97E
	cmp r4, #0x25
	ble _0804A980
	cmp r4, #0x40
	beq _0804A980
_0804A97E:
	movs r4, #0
_0804A980:
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0804A9A6
	ldr r0, [r7]
	ldr r1, [r0]
	ldrh r2, [r1, #0x1e]
	movs r3, #0x1e
	ldrsh r0, [r1, r3]
	cmp r0, #0xd
	bgt _0804A9A2
	adds r0, r2, #1
	b _0804A9BA
_0804A9A2:
	movs r0, #0
	b _0804A9BA
_0804A9A6:
	ldr r0, [r7]
	ldr r1, [r0]
	ldrh r2, [r1, #0x1e]
	movs r3, #0x1e
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bne _0804A9B8
	movs r0, #0xe
	b _0804A9BA
_0804A9B8:
	subs r0, r2, #1
_0804A9BA:
	strh r0, [r1, #0x1e]
	ldr r5, [r7]
	ldr r2, [r5]
	movs r0, #0x20
	ldrsh r1, [r2, r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	ldrb r2, [r2, #0x1e]
	adds r0, r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_0804A18C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r4
	beq _0804A980
	ldr r2, [r5]
	movs r3, #0x20
	ldrsh r1, [r2, r3]
	lsls r0, r1, #4
	subs r0, r0, r1
	ldrb r2, [r2, #0x1e]
	adds r0, r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_0804A18C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x24
	beq _0804AA12
	cmp r0, #0x24
	bgt _0804AA04
	cmp r0, #0x23
	beq _0804AA1E
	b _0804AA24
_0804AA04:
	cmp r0, #0x25
	beq _0804AA18
	cmp r0, #0x40
	bne _0804AA24
	ldr r1, [r5]
	movs r0, #2
	b _0804AA22
_0804AA12:
	ldr r1, [r5]
	movs r0, #5
	b _0804AA22
_0804AA18:
	ldr r1, [r5]
	movs r0, #9
	b _0804AA22
_0804AA1E:
	ldr r1, [r5]
	movs r0, #0xd
_0804AA22:
	strh r0, [r1, #0x1e]
_0804AA24:
	movs r0, #1
	mov r8, r0
_0804AA28:
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _0804AA70
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0804AA56
	ldr r0, [r7]
	ldr r1, [r0]
	ldrh r2, [r1, #0x20]
	movs r3, #0x20
	ldrsh r0, [r1, r3]
	cmp r0, #4
	bgt _0804AA52
	adds r0, r2, #1
	b _0804AA6A
_0804AA52:
	movs r0, #0
	b _0804AA6A
_0804AA56:
	ldr r0, [r7]
	ldr r1, [r0]
	ldrh r2, [r1, #0x20]
	movs r3, #0x20
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bne _0804AA68
	movs r0, #5
	b _0804AA6A
_0804AA68:
	subs r0, r2, #1
_0804AA6A:
	strh r0, [r1, #0x20]
	movs r0, #1
	mov r8, r0
_0804AA70:
	ldr r0, [r7]
	ldr r2, [r0]
	adds r0, r2, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804AA9C
	movs r3, #0x20
	ldrsh r1, [r2, r3]
	lsls r0, r1, #4
	subs r0, r0, r1
	ldrb r2, [r2, #0x1e]
	adds r0, r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_0804A18C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x24
	bne _0804AA9C
	b _0804A946
_0804AA9C:
	mov r0, r8
	cmp r0, #1
	bne _0804AAE8
	cmp r6, #0x40
	beq _0804AAB2
	cmp r6, #0x24
	beq _0804AAB2
	cmp r6, #0x25
	beq _0804AAB2
	cmp r6, #0x23
	bne _0804AAD6
_0804AAB2:
	movs r3, #0
	cmp r6, #0x40
	beq _0804AAC6
	movs r3, #1
	cmp r6, #0x24
	beq _0804AAC6
	movs r3, #2
	cmp r6, #0x25
	beq _0804AAC6
	movs r3, #3
_0804AAC6:
	ldr r0, _0804AAF4 @ =gUnknown_0812B21C
	adds r1, r3, #0
	adds r1, #0x10
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x10
	movs r2, #0x20
	bl sub_08013618
_0804AAD6:
	ldr r0, [r7]
	ldr r1, [r0]
	movs r0, #0x1e
	strh r0, [r1, #0x22]
	movs r0, #7
	strh r0, [r1, #0x24]
	movs r0, #0x67
	bl sub_0803B4DC
_0804AAE8:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804AAF4: .4byte gUnknown_0812B21C

