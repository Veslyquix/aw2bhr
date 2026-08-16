	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080506B0
sub_080506B0: @ 0x080506B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r4, _08050908 @ =gUnknown_03001FBC
	movs r1, #0
	ldrsh r0, [r4, r1]
	mov r7, sp
	mov r1, sp
	bl sub_0801566C
	ldr r2, _0805090C @ =gUnknown_03001470
	movs r3, #0
	ldrsh r1, [r4, r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r1, r2, #0
	adds r1, #0x2c
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
	movs r5, #0
	ldrsh r1, [r4, r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r1, r2, #0
	adds r1, #0x30
	adds r0, r0, r1
	ldr r3, _08050910 @ =gUnknown_0300453C
	ldrh r1, [r3]
	str r1, [r0]
	movs r0, #0
	ldrsh r1, [r4, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r1, r2, #0
	adds r1, #0x34
	adds r0, r0, r1
	ldr r1, _08050914 @ =gUnknown_0300451C
	ldrh r1, [r1]
	str r1, [r0]
	ldrh r0, [r3]
	movs r1, #1
	eors r1, r0
	movs r0, #1
	ands r1, r0
	lsls r1, r1, #4
	ldrb r2, [r7, #3]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r7, #3]
	ldrb r1, [r7, #5]
	movs r0, #0xf
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r7, #5]
	ldr r1, _08050918 @ =gUnknown_081360CC
	ldr r2, [r1]
	ldrh r1, [r3]
	movs r0, #0x58
	muls r0, r1, r0
	adds r0, r0, r2
	ldrh r1, [r0]
	ldr r2, _0805091C @ =0x000003FF
	adds r0, r2, #0
	ands r1, r0
	ldrh r2, [r7, #4]
	ldr r0, _08050920 @ =0xFFFFFC00
	ands r0, r2
	orrs r0, r1
	strh r0, [r7, #4]
	ldrb r1, [r7, #1]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r7, #1]
	ldr r5, _08050924 @ =gUnknown_081360D0
	ldr r2, [r5]
	ldr r4, _08050928 @ =gUnknown_081360D4
	ldr r1, [r4]
	ldrh r0, [r3]
	lsls r0, r0, #4
	adds r1, #2
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #2]
	cmp r0, #2
	bne _080507BC
	adds r0, r1, #0
	cmp r0, #0x17
	beq _08050782
	cmp r0, #0x11
	bne _080507BC
_08050782:
	bl sub_08012358
	ldr r2, _0805092C @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r2, #1]
	movs r1, #0x10
	orrs r0, r1
	movs r3, #4
	orrs r0, r3
	movs r1, #8
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r0, _08050930 @ =gUnknown_03002020
	movs r4, #0xf
	strh r4, [r0]
	ldr r1, _08050934 @ =gUnknown_03002B28
	movs r0, #0xa
	strh r0, [r1]
	ldrb r1, [r7, #1]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	orrs r0, r3
	strb r0, [r7, #1]
_080507BC:
	mov r2, sp
	ldrb r0, [r2, #5]
	movs r1, #0xc
	orrs r0, r1
	strb r0, [r2, #5]
	ldr r5, _08050908 @ =gUnknown_03001FBC
	movs r1, #0
	ldrsh r0, [r5, r1]
	ldr r1, [sp]
	ldr r2, [sp, #4]
	bl sub_08015608
	ldr r5, _08050938 @ =gUnknown_085D81E8
	ldr r2, _08050910 @ =gUnknown_0300453C
	ldrh r4, [r2]
	lsls r3, r4, #1
	mov sb, r3
	ldr r1, _0805093C @ =gUnknown_020296B0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #0x18]
	lsls r3, r0, #3
	mov r0, sb
	adds r1, r0, r3
	lsls r0, r4, #4
	ldr r2, _08050940 @ =gUnknown_03004582
	adds r0, r0, r2
	ldrh r7, [r0]
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r2, r0, #3
	adds r1, r1, r2
	adds r1, r1, r5
	ldrh r6, [r1]
	cmp r4, #0
	beq _0805080E
	lsls r0, r6, #0x10
	rsbs r0, r0, #0
	lsrs r6, r0, #0x10
_0805080E:
	adds r0, r3, r2
	adds r0, r0, r5
	ldrh r5, [r0, #4]
	ldr r3, _08050914 @ =gUnknown_0300451C
	mov sl, r3
	ldrh r1, [r3]
	lsls r3, r1, #1
	movs r2, #0x58
	adds r0, r4, #0
	muls r0, r2, r0
	adds r3, r3, r0
	ldr r0, _08050944 @ =gUnknown_0202972C
	adds r3, r3, r0
	lsls r2, r1, #3
	adds r2, r2, r1
	lsls r2, r2, #2
	movs r1, #0xb4
	mov r8, r1
	mov r0, r8
	muls r0, r4, r0
	adds r2, r2, r0
	ldr r4, _08050948 @ =gUnknown_02029A10
	adds r2, r2, r4
	ldr r0, _0805094C @ =gUnknown_085D6A48
	mov ip, r0
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #3
	add r0, ip
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r1, [r0, #0x14]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sb
	ldr r1, _08050950 @ =gUnknown_08553C18
	adds r1, #8
	adds r0, r0, r1
	ldrh r1, [r0]
	ldrh r2, [r2, #8]
	adds r1, r1, r2
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	strh r0, [r3]
	mov r1, sl
	ldrh r3, [r1]
	lsls r4, r3, #1
	ldr r2, _08050910 @ =gUnknown_0300453C
	ldrh r1, [r2]
	movs r2, #0x58
	adds r0, r1, #0
	muls r0, r2, r0
	adds r4, r4, r0
	ldr r7, _08050954 @ =gUnknown_02029710
	adds r7, #0x3a
	adds r4, r4, r7
	lsls r2, r3, #3
	adds r2, r2, r3
	lsls r2, r2, #2
	mov r0, r8
	muls r0, r1, r0
	adds r2, r2, r0
	ldr r3, _08050948 @ =gUnknown_02029A10
	adds r2, r2, r3
	lsls r1, r1, #4
	ldr r0, _08050940 @ =gUnknown_03004582
	adds r1, r1, r0
	ldrh r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r1, [r0, #0x14]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08050950 @ =gUnknown_08553C18
	adds r0, r0, r1
	ldrh r0, [r0, #0x10]
	ldrh r2, [r2, #0xa]
	adds r0, r0, r2
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r5, r5, r0
	strh r5, [r4]
	ldr r2, _08050910 @ =gUnknown_0300453C
	ldrh r0, [r2]
	ldr r3, _08050908 @ =gUnknown_03001FBC
	movs r4, #0
	ldrsh r1, [r3, r4]
	mov r5, sl
	ldrh r3, [r5]
	lsls r3, r3, #1
	movs r4, #0x58
	adds r2, r0, #0
	muls r2, r4, r2
	adds r3, r3, r2
	ldr r5, _08050944 @ =gUnknown_0202972C
	adds r5, r3, r5
	str r5, [sp, #8]
	movs r4, #0
	ldrsh r2, [r5, r4]
	adds r3, r3, r7
	movs r5, #0
	ldrsh r3, [r3, r5]
	bl sub_08050528
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050908: .4byte gUnknown_03001FBC
_0805090C: .4byte gUnknown_03001470
_08050910: .4byte gUnknown_0300453C
_08050914: .4byte gUnknown_0300451C
_08050918: .4byte gUnknown_081360CC
_0805091C: .4byte 0x000003FF
_08050920: .4byte 0xFFFFFC00
_08050924: .4byte gUnknown_081360D0
_08050928: .4byte gUnknown_081360D4
_0805092C: .4byte gUnknown_030030E0
_08050930: .4byte gUnknown_03002020
_08050934: .4byte gUnknown_03002B28
_08050938: .4byte gUnknown_085D81E8
_0805093C: .4byte gUnknown_020296B0
_08050940: .4byte gUnknown_03004582
_08050944: .4byte gUnknown_0202972C
_08050948: .4byte gUnknown_02029A10
_0805094C: .4byte gUnknown_085D6A48
_08050950: .4byte gUnknown_08553C18
_08050954: .4byte gUnknown_02029710

