	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807E980
sub_0807E980: @ 0x0807E980
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r0, _0807EAA8 @ =gUnknown_03001FFC
	ldrh r0, [r0]
	cmp r0, #8
	bls _0807E998
	b _0807EBD6
_0807E998:
	ldr r1, _0807EAAC @ =0x00000454
	movs r2, #0x86
	lsls r2, r2, #6
	movs r0, #0x40
	movs r3, #5
	bl sub_08043FD8
	ldr r1, _0807EAB0 @ =0x0000043C
	ldr r2, _0807EAB4 @ =0x000031A4
	movs r0, #0x88
	movs r3, #5
	bl sub_08043FD8
	ldr r1, _0807EAB8 @ =0x00000424
	ldr r2, _0807EABC @ =0x000041C8
	movs r0, #0xd0
	movs r3, #5
	bl sub_08043FD8
	ldr r2, _0807EAC0 @ =0x0000041C
	ldr r3, _0807EAC4 @ =gUnknown_0848B6A0
	movs r0, #0
	str r0, [sp]
	movs r1, #0x20
	bl sub_0801BEFC
	movs r5, #0
	adds r0, r7, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	str r0, [sp, #0xc]
	adds r3, r7, #0
	adds r3, #0x48
	str r3, [sp, #4]
	cmp r5, r1
	bge _0807EA62
	subs r0, #0x12
	str r0, [sp, #8]
_0807E9E6:
	movs r6, #0
	adds r1, r5, #1
	mov r8, r1
	ldr r2, _0807EAC8 @ =gUnknown_030058D4
	adds r2, r2, r5
	mov sl, r2
	mov sb, r6
	movs r4, #0x25
_0807E9F6:
	ldr r3, [sp, #8]
	ldrh r0, [r3]
	adds r0, r0, r6
	ldr r1, [r7, #0x58]
	ldr r2, [r7, #0x60]
	subs r1, r1, r2
	ldr r2, _0807EACC @ =gUnknown_03005948
	adds r1, r1, r2
	ldrb r1, [r1]
	bl DivRem
	ldr r1, [r7, #0x5c]
	adds r0, r0, r1
	ldr r1, [r7, #0x58]
	ldr r2, [r7, #0x60]
	subs r1, r1, r2
	ldr r3, _0807EACC @ =gUnknown_03005948
	adds r1, r1, r3
	ldrb r1, [r1]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r1, _0807EAD0 @ =gUnknown_030058E0
	adds r0, r0, r1
	mov r2, sl
	ldrb r1, [r2]
	ldrb r0, [r0]
	cmp r1, r0
	bne _0807EA4A
	movs r2, #0x43
	mov r3, sb
	subs r2, r2, r3
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	adds r0, #0x4a
	adds r1, r4, #0
	movs r3, #0
	bl sub_0801F34C
_0807EA4A:
	movs r0, #0x18
	add sb, r0
	adds r4, #0x48
	adds r6, #1
	cmp r6, #2
	ble _0807E9F6
	mov r5, r8
	ldr r1, [sp, #0xc]
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r5, r0
	blt _0807E9E6
_0807EA62:
	ldr r0, _0807EAD4 @ =gUnknown_030059C0
	ldr r3, [sp, #0xc]
	movs r1, #0
	ldrsh r2, [r3, r1]
	lsls r1, r2, #2
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	beq _0807EAE0
	movs r5, #0
	cmp r5, r2
	bge _0807EB08
	ldr r6, _0807EAD8 @ =gUnknown_03005958
	movs r4, #0x68
_0807EA7E:
	ldr r0, _0807EADC @ =gUnknown_0300599C
	adds r0, r5, r0
	ldrb r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	adds r0, #0x3e
	movs r1, #2
	str r1, [sp]
	movs r1, #0x14
	adds r2, r4, #0
	movs r3, #0
	bl sub_0801F34C
	adds r4, #0x10
	adds r5, #1
	ldr r2, [sp, #0xc]
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r5, r0
	blt _0807EA7E
	b _0807EB08
	.align 2, 0
_0807EAA8: .4byte gUnknown_03001FFC
_0807EAAC: .4byte 0x00000454
_0807EAB0: .4byte 0x0000043C
_0807EAB4: .4byte 0x000031A4
_0807EAB8: .4byte 0x00000424
_0807EABC: .4byte 0x000041C8
_0807EAC0: .4byte 0x0000041C
_0807EAC4: .4byte gUnknown_0848B6A0
_0807EAC8: .4byte gUnknown_030058D4
_0807EACC: .4byte gUnknown_03005948
_0807EAD0: .4byte gUnknown_030058E0
_0807EAD4: .4byte gUnknown_030059C0
_0807EAD8: .4byte gUnknown_03005958
_0807EADC: .4byte gUnknown_0300599C
_0807EAE0:
	movs r5, #0
	movs r4, #0x68
	b _0807EB00
_0807EAE6:
	ldr r0, _0807EC18 @ =gUnknown_03005958
	adds r0, r5, r0
	ldrb r0, [r0]
	adds r0, #0x3e
	movs r1, #2
	str r1, [sp]
	movs r1, #0x14
	adds r2, r4, #0
	movs r3, #0
	bl sub_0801F34C
	adds r4, #0x10
	adds r5, #1
_0807EB00:
	bl sub_0803BD14
	cmp r5, r0
	blt _0807EAE6
_0807EB08:
	ldr r1, [sp, #4]
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r1, #0x40
	bl DivRem
	cmp r0, #0x1f
	bgt _0807EBB8
	ldr r0, _0807EC1C @ =gUnknown_03005944
	ldr r0, [r0]
	cmp r0, #1
	ble _0807EB52
	ldr r1, _0807EC20 @ =gUnknown_030059C0
	adds r0, r7, #0
	adds r0, #0x64
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _0807EB52
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
_0807EB52:
	ldr r1, [sp, #4]
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r1, #0x40
	bl DivRem
	asrs r0, r0, #3
	lsls r0, r0, #1
	movs r4, #0x18
	subs r4, r4, r0
	ldr r3, [sp, #4]
	movs r1, #0
	ldrsh r0, [r3, r1]
	movs r1, #0x40
	bl DivRem
	adds r2, r0, #0
	asrs r2, r2, #3
	adds r2, #0x3c
	movs r5, #0
	str r5, [sp]
	movs r0, #0x48
	adds r1, r4, #0
	movs r3, #0
	bl sub_0801F34C
	ldr r2, [sp, #4]
	movs r3, #0
	ldrsh r0, [r2, r3]
	movs r1, #0x40
	bl DivRem
	adds r4, r0, #0
	asrs r4, r4, #3
	lsls r4, r4, #1
	adds r4, #0x58
	ldr r1, [sp, #4]
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r1, #0x40
	bl DivRem
	asrs r0, r0, #3
	movs r2, #0x2c
	subs r2, r2, r0
	str r5, [sp]
	movs r0, #0x49
	adds r1, r4, #0
	movs r3, #0
	bl sub_0801F34C
_0807EBB8:
	ldr r2, _0807EC24 @ =0x0000048E
	movs r4, #0
	str r4, [sp]
	movs r0, #0x62
	movs r1, #0xb9
	movs r3, #0
	bl sub_0801F34C
	ldr r2, _0807EC28 @ =0x00000496
	str r4, [sp]
	movs r0, #0x65
	movs r1, #0xb9
	movs r3, #0
	bl sub_0801F34C
_0807EBD6:
	bl sub_0803BD14
	movs r6, #3
	subs r0, r6, r0
	lsls r0, r0, #4
	adds r0, #7
	asrs r0, r0, #1
	adds r5, r0, #0
	adds r5, #0x68
	adds r0, r7, #0
	adds r0, #0x4c
	movs r3, #0
	ldrsh r1, [r0, r3]
	mov sb, r0
	cmp r1, #8
	bgt _0807EC2C
	adds r3, r1, #0
	movs r4, #8
	str r4, [sp]
	movs r0, #1
	movs r1, #0x2a
	movs r2, #0x75
	bl sub_08074234
	str r0, [r7, #0x2c]
	mov r2, sb
	movs r0, #0
	ldrsh r3, [r2, r0]
	str r4, [sp]
	movs r0, #1
	movs r1, #0x68
	adds r2, r5, #0
	b _0807EC5E
	.align 2, 0
_0807EC18: .4byte gUnknown_03005958
_0807EC1C: .4byte gUnknown_03005944
_0807EC20: .4byte gUnknown_030059C0
_0807EC24: .4byte 0x0000048E
_0807EC28: .4byte 0x00000496
_0807EC2C:
	mov r1, sb
	movs r2, #0
	ldrsh r3, [r1, r2]
	subs r3, #8
	movs r4, #8
	str r4, [sp]
	movs r0, #4
	movs r1, #0x75
	movs r2, #0xc0
	bl sub_08074234
	str r0, [r7, #0x2c]
	bl sub_0803BD14
	adds r2, r0, #0
	subs r2, r6, r2
	lsls r2, r2, #4
	adds r2, #0x6f
	mov r0, sb
	movs r1, #0
	ldrsh r3, [r0, r1]
	subs r3, #8
	str r4, [sp]
	movs r0, #4
	adds r1, r5, #0
_0807EC5E:
	bl sub_08074234
	str r0, [r7, #0x30]
	mov r2, sb
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #7
	bgt _0807EC9A
	adds r3, r0, #0
	movs r0, #8
	str r0, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0x78
	bl sub_08074234
	str r0, [r7, #0x34]
	adds r0, #0xb0
	movs r2, #0x82
	lsls r2, r2, #5
	movs r1, #1
	str r1, [sp]
	movs r1, #0xa0
	movs r3, #0
	bl sub_08043C28
	adds r1, r7, #0
	adds r1, #0x64
	str r1, [sp, #0xc]
	b _0807ED30
_0807EC9A:
	adds r2, r7, #0
	adds r2, #0x64
	str r2, [sp, #0xc]
	cmp r0, #0xf
	ble _0807ED30
	ldr r5, _0807ED7C @ =gUnknown_030058D4
	ldrb r4, [r5]
	movs r0, #0
	movs r1, #2
	bl DivRem
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #6
	adds r0, r4, #0
	movs r2, #1
	bl sub_08043BA4
	ldrb r4, [r5, #1]
	movs r0, #1
	movs r1, #2
	bl DivRem
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #6
	adds r0, r4, #0
	movs r2, #2
	bl sub_08043BA4
	ldr r0, _0807ED80 @ =gUnknown_08234B10
	ldr r4, _0807ED84 @ =gUnknown_0200FC50
	adds r1, r4, #0
	bl sub_08011CAC
	movs r5, #0
	mov sl, r4
_0807ECE4:
	adds r3, r5, #1
	mov r8, r3
	lsls r1, r5, #0xb
	lsls r0, r5, #8
	mov r2, sl
	adds r4, r0, r2
	movs r6, #7
	ldr r3, _0807ED88 @ =0x06015000
	adds r5, r1, r3
_0807ECF6:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x40
	bl CpuFastSet
	movs r0, #0x80
	lsls r0, r0, #1
	adds r5, r5, r0
	movs r1, #0x80
	lsls r1, r1, #3
	adds r4, r4, r1
	subs r6, #1
	cmp r6, #0
	bge _0807ECF6
	mov r5, r8
	cmp r5, #3
	ble _0807ECE4
	ldr r0, _0807ED8C @ =gUnknown_082352DC
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_08013618
	movs r0, #0
	mov r2, sb
	strh r0, [r2]
	adds r0, r7, #0
	bl Proc_Break
_0807ED30:
	movs r5, #0
	ldr r3, [sp, #0xc]
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r5, r0
	bge _0807ED62
	movs r4, #0xf0
	lsls r4, r4, #2
_0807ED40:
	ldr r0, [r7, #0x2c]
	lsls r2, r5, #4
	ldr r1, [r7, #0x30]
	adds r1, r1, r2
	movs r2, #0x90
	lsls r2, r2, #8
	orrs r2, r4
	movs r3, #0
	bl sub_08043B60
	adds r4, #0xc
	adds r5, #1
	ldr r2, [sp, #0xc]
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r5, r0
	blt _0807ED40
_0807ED62:
	mov r1, sb
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807ED7C: .4byte gUnknown_030058D4
_0807ED80: .4byte gUnknown_08234B10
_0807ED84: .4byte gUnknown_0200FC50
_0807ED88: .4byte 0x06015000
_0807ED8C: .4byte gUnknown_082352DC

