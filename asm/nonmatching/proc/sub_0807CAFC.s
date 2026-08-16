	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807CAFC
sub_0807CAFC: @ 0x0807CAFC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x4c
	movs r1, #0
	ldrsh r0, [r7, r1]
	cmp r0, #0x18
	bgt _0807CBD0
	movs r1, #0xcc
	rsbs r1, r1, #0
	adds r3, r0, #0
	movs r0, #0x18
	mov r8, r0
	str r0, [sp]
	movs r0, #5
	movs r2, #0x24
	bl sub_08074234
	str r0, [r6, #0x30]
	ldr r5, _0807CBC4 @ =gUnknown_03002F18
	ldr r0, [r6, #0x3c]
	movs r1, #3
	bl Div
	movs r1, #4
	bl DivRem
	ldr r1, [r6, #0x30]
	subs r1, r1, r0
	strh r1, [r5]
	ldr r4, _0807CBC8 @ =gUnknown_03002B34
	ldr r0, [r6, #0x3c]
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
	bge _0807CB6C
	ldrh r0, [r5]
	subs r0, #4
	strh r0, [r5]
	ldrh r0, [r4]
	adds r0, #0xc
	strh r0, [r4]
_0807CB6C:
	movs r1, #0
	ldrsh r3, [r7, r1]
	mov r2, r8
	str r2, [sp]
	movs r0, #5
	movs r1, #0x78
	movs r2, #0
	bl sub_08074234
	str r0, [r6, #0x34]
	ldrh r1, [r7]
	adds r0, r1, #0
	subs r0, #0xc
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #6
	bhi _0807CBE4
	movs r5, #0x13
	subs r5, r5, r1
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r0, #0
	ldrsh r4, [r7, r0]
	lsls r4, r4, #0x11
	ldr r1, _0807CBCC @ =0xFFEB0000
	adds r4, r4, r1
	asrs r4, r4, #0x10
	bl sub_0803BD14
	adds r3, r0, #0
	lsls r3, r3, #0x11
	movs r2, #0x80
	lsls r2, r2, #0xa
	adds r3, r3, r2
	asrs r3, r3, #0x10
	adds r0, r5, #0
	movs r1, #0xc
	adds r2, r4, #0
	bl sub_0801A444
	bl sub_0807F238
	b _0807CBE4
	.align 2, 0
_0807CBC4: .4byte gUnknown_03002F18
_0807CBC8: .4byte gUnknown_03002B34
_0807CBCC: .4byte 0xFFEB0000
_0807CBD0:
	adds r0, r6, #0
	bl Proc_Break
	ldr r2, _0807CC38 @ =gUnknown_03001FE8
	ldrb r1, [r2, #1]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2, #1]
_0807CBE4:
	adds r0, r6, #0
	adds r0, #0x4c
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov sl, r0
	cmp r1, #0x11
	bgt _0807CBF4
	b _0807CD92
_0807CBF4:
	ldr r4, _0807CC3C @ =gUnknown_081D9348
	ldr r0, [r4]
	adds r0, #0x80
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	mov r8, r0
	movs r7, #0x80
	lsls r7, r7, #1
	mov r2, sl
	movs r0, #0
	ldrsh r3, [r2, r0]
	subs r3, #0x11
	movs r5, #8
	str r5, [sp]
	movs r0, #0
	movs r1, #0x10
	adds r2, r7, #0
	bl sub_08074234
	cmp r0, #0
	beq _0807CC40
	mov r1, sl
	movs r2, #0
	ldrsh r3, [r1, r2]
	subs r3, #0x11
	str r5, [sp]
	movs r0, #0
	movs r1, #0x10
	adds r2, r7, #0
	bl sub_08074234
	adds r1, r0, #0
	b _0807CC42
	.align 2, 0
_0807CC38: .4byte gUnknown_03001FE8
_0807CC3C: .4byte gUnknown_081D9348
_0807CC40:
	movs r1, #2
_0807CC42:
	mov r0, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sb, r0
	ldr r0, _0807CC9C @ =gUnknown_0808F100
	movs r1, #0
	ldrsh r4, [r0, r1]
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
	mov r2, sl
	movs r0, #0
	ldrsh r3, [r2, r0]
	subs r3, #0x11
	movs r7, #8
	str r7, [sp]
	movs r0, #0
	movs r1, #0x10
	adds r2, r5, #0
	bl sub_08074234
	cmp r0, #0
	beq _0807CCA0
	mov r1, sl
	movs r2, #0
	ldrsh r3, [r1, r2]
	subs r3, #0x11
	str r7, [sp]
	movs r0, #0
	movs r1, #0x10
	adds r2, r5, #0
	bl sub_08074234
	adds r1, r0, #0
	b _0807CCA2
	.align 2, 0
_0807CC9C: .4byte gUnknown_0808F100
_0807CCA0:
	movs r1, #2
_0807CCA2:
	adds r0, r4, #0
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r0, _0807CD2C @ =gUnknown_0808F100
	adds r0, #0x80
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	mov r1, sb
	mov r2, r8
	adds r3, r4, #0
	bl sub_0801E108
	movs r4, #0
	adds r0, r6, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	str r0, [sp, #4]
	cmp r4, r1
	bge _0807CD62
	ldr r0, _0807CD30 @ =gUnknown_03005958
	mov sb, r0
	movs r7, #0xf0
	lsls r7, r7, #2
	movs r5, #0x68
	movs r1, #2
	mov r8, r1
_0807CCF0:
	movs r1, #0x80
	lsls r1, r1, #1
	orrs r1, r5
	movs r2, #0x90
	lsls r2, r2, #8
	orrs r2, r7
	movs r0, #0x2a
	movs r3, #0
	bl sub_08043B60
	ldr r1, _0807CD34 @ =gUnknown_030059C0
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _0807CD3C
	ldr r0, _0807CD38 @ =gUnknown_0300599C
	adds r0, r4, r0
	ldrb r0, [r0]
	add r0, sb
	ldrb r0, [r0]
	adds r0, #0x3e
	mov r2, r8
	str r2, [sp]
	movs r1, #0x14
	adds r2, r5, #0
	movs r3, #0
	bl sub_0801F34C
	b _0807CD52
	.align 2, 0
_0807CD2C: .4byte gUnknown_0808F100
_0807CD30: .4byte gUnknown_03005958
_0807CD34: .4byte gUnknown_030059C0
_0807CD38: .4byte gUnknown_0300599C
_0807CD3C:
	mov r1, sb
	adds r0, r4, r1
	ldrb r0, [r0]
	adds r0, #0x3e
	mov r2, r8
	str r2, [sp]
	movs r1, #0x14
	adds r2, r5, #0
	movs r3, #0
	bl sub_0801F34C
_0807CD52:
	adds r7, #0xc
	adds r5, #0x10
	adds r4, #1
	ldr r1, [sp, #4]
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r4, r0
	blt _0807CCF0
_0807CD62:
	movs r4, #0
	str r4, [sp]
	movs r0, #0x54
	movs r1, #0x5c
	movs r2, #0x68
	movs r3, #0
	bl sub_0801F34C
	bl sub_0803BD14
	adds r0, #0x55
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
_0807CD92:
	mov r1, sl
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r2, [r6, #0x30]
	movs r0, #0x78
	subs r0, r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xd0
	bgt _0807CDBC
	movs r1, #0x78
	subs r1, r1, r2
	movs r0, #0xff
	ands r1, r0
	movs r2, #0xa6
	lsls r2, r2, #6
	movs r0, #0x40
	movs r3, #5
	bl sub_08043FD8
_0807CDBC:
	ldr r2, [r6, #0x30]
	movs r0, #0x60
	subs r0, r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xd0
	bgt _0807CDE2
	movs r1, #0x60
	subs r1, r1, r2
	movs r0, #0xff
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r1, r0
	ldr r2, _0807CE50 @ =0x000039A4
	movs r0, #0x88
	movs r3, #5
	bl sub_08043FD8
_0807CDE2:
	ldr r2, [r6, #0x30]
	movs r0, #0x48
	subs r0, r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xd0
	bgt _0807CE08
	movs r1, #0x48
	subs r1, r1, r2
	movs r0, #0xff
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r1, r0
	ldr r2, _0807CE54 @ =0x000049C8
	movs r0, #0xd0
	movs r3, #5
	bl sub_08043FD8
_0807CE08:
	ldr r1, [r6, #0x30]
	movs r0, #0x40
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xd0
	bgt _0807CE26
	movs r2, #0x40
	subs r2, r2, r1
	ldr r3, _0807CE58 @ =gUnknown_0848B6A0
	movs r0, #0
	str r0, [sp]
	movs r1, #0x20
	bl sub_0801BEBC
_0807CE26:
	ldr r0, [r6, #0x34]
	adds r0, #0xb0
	movs r2, #0x82
	lsls r2, r2, #5
	movs r1, #1
	str r1, [sp]
	movs r1, #0xa0
	movs r3, #0
	bl sub_08043C28
	ldr r0, [r6, #0x3c]
	subs r0, #1
	str r0, [r6, #0x3c]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807CE50: .4byte 0x000039A4
_0807CE54: .4byte 0x000049C8
_0807CE58: .4byte gUnknown_0848B6A0

