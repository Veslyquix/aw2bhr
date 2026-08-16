	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08051454
sub_08051454: @ 0x08051454
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r5, _080516B0 @ =gUnknown_03001FBC
	movs r1, #0
	ldrsh r0, [r5, r1]
	mov r7, sp
	mov r1, sp
	bl sub_0801566C
	ldr r3, _080516B4 @ =gUnknown_081360F0
	ldr r0, [r3]
	mov sl, r0
	ldrh r0, [r0]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #4
	ldr r2, _080516B8 @ =gUnknown_020298E0
	adds r0, r1, r2
	ldrh r0, [r0, #0x16]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	adds r1, r2, #0
	adds r1, #0x80
	adds r0, r0, r1
	movs r6, #0
	strh r6, [r0]
	mov r3, sl
	ldrh r0, [r3]
	lsls r4, r0, #3
	adds r4, r4, r0
	lsls r4, r4, #4
	adds r4, r4, r2
	ldr r0, _080516BC @ =gUnknown_08553660
	ldr r1, _080516C0 @ =gUnknown_08553664
	ldrh r0, [r0, #2]
	ldrh r1, [r1, #2]
	bl __udivsi3
	adds r4, #0x8a
	strh r0, [r4]
	ldr r2, _080516C4 @ =gUnknown_03001470
	movs r0, #0
	ldrsh r1, [r5, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r1, r2, #0
	adds r1, #0x28
	adds r0, r0, r1
	str r6, [r0]
	movs r3, #0
	ldrsh r1, [r5, r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r1, r2, #0
	adds r1, #0x30
	adds r0, r0, r1
	mov r3, sl
	ldrh r1, [r3]
	str r1, [r0]
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r0, r2, #0
	adds r0, #0x34
	adds r1, r1, r0
	ldrh r2, [r3]
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #4
	ldr r2, _080516B8 @ =gUnknown_020298E0
	adds r0, r0, r2
	ldrh r0, [r0, #0x16]
	subs r0, #1
	str r0, [r1]
	ldrb r2, [r7, #5]
	movs r0, #0xc
	orrs r2, r0
	ldrh r1, [r3]
	movs r0, #1
	ands r1, r0
	lsls r1, r1, #4
	ldrb r3, [r7, #3]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r7, #3]
	movs r6, #0xf
	ands r2, r6
	movs r0, #0x80
	orrs r2, r0
	strb r2, [r7, #5]
	ldr r1, _080516C8 @ =gUnknown_02029710
	mov r3, sl
	ldrh r0, [r3]
	movs r5, #1
	adds r3, r5, #0
	eors r3, r0
	movs r0, #0x58
	muls r0, r3, r0
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r2, _080516CC @ =0x000003FF
	adds r0, r2, #0
	ands r1, r0
	ldrh r2, [r7, #4]
	ldr r0, _080516D0 @ =0xFFFFFC00
	ands r0, r2
	orrs r0, r1
	strh r0, [r7, #4]
	ldr r1, _080516D4 @ =gUnknown_081360F4
	ldr r0, [r1]
	lsls r3, r3, #4
	adds r4, r0, #2
	adds r3, r3, r4
	ldrh r0, [r3]
	subs r0, #0xe
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r1
	cmp r0, #1
	bhi _0805157E
	ldr r2, _080516D8 @ =gUnknown_085643A8
	mov r3, sl
	ldrh r1, [r3]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #4
	ldr r1, _080516B8 @ =gUnknown_020298E0
	adds r0, r0, r1
	adds r0, #0x8c
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r0, [r0, r2]
	bl sub_0803B48C
_0805157E:
	ldr r1, _080516DC @ =gUnknown_081360F8
	ldr r2, [r1]
	mov r3, sl
	ldrh r0, [r3]
	eors r0, r5
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrh r3, [r0]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #2]
	adds r4, r1, #0
	cmp r0, #2
	bne _080515E0
	adds r0, r3, #0
	cmp r0, #0x17
	beq _080515A8
	cmp r0, #0x11
	bne _080515E0
_080515A8:
	bl sub_08012358
	ldr r2, _080516E0 @ =gUnknown_030030E0
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
	ldr r0, _080516E4 @ =gUnknown_03002020
	strh r6, [r0]
	ldr r1, _080516E8 @ =gUnknown_03002B28
	movs r0, #0xa
	strh r0, [r1]
	ldrb r1, [r7, #1]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	orrs r0, r3
	strb r0, [r7, #1]
_080515E0:
	ldr r0, _080516B0 @ =gUnknown_03001FBC
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r1, [sp]
	ldr r2, [sp, #4]
	bl sub_08015608
	ldr r3, _080516EC @ =gUnknown_08553C18
	ldr r6, [r4]
	mov r2, r8
	ldr r1, [r2]
	ldr r0, _080516F0 @ =gUnknown_0300453C
	mov sl, r0
	ldrh r2, [r0]
	movs r0, #1
	eors r0, r2
	lsls r0, r0, #4
	adds r7, r1, #2
	adds r0, r0, r7
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrh r1, [r0, #0x14]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r5, [r0, #0x16]
	ldrh r0, [r0, #0x1c]
	mov sb, r0
	mov r3, sb
	cmp r2, #0
	bne _08051636
	lsls r0, r5, #0x10
	rsbs r0, r0, #0
	lsrs r5, r0, #0x10
_08051636:
	mov r1, sl
	ldrh r4, [r1]
	lsls r0, r4, #4
	adds r0, r0, r7
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrh r0, [r0, #4]
	mov r8, r0
	cmp r0, #0
	bne _08051700
	ldr r1, _080516F4 @ =gUnknown_02029A10
	ldr r0, _080516F8 @ =gUnknown_0300451C
	ldrh r0, [r0]
	lsls r3, r0, #3
	adds r3, r3, r0
	lsls r3, r3, #2
	movs r0, #0xb4
	muls r0, r4, r0
	adds r3, r3, r0
	adds r3, r3, r1
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r3, #8]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r1, _080516FC @ =gUnknown_08553BFC
	ldr r5, _080516B8 @ =gUnknown_020298E0
	lsls r2, r4, #3
	adds r2, r2, r4
	lsls r2, r2, #4
	adds r2, r2, r5
	ldrh r4, [r2, #0x18]
	lsls r0, r4, #3
	adds r0, r0, r1
	ldrh r1, [r0, #4]
	ldrh r3, [r3, #0xa]
	adds r1, r1, r3
	mov r3, sb
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r4, #1
	strh r4, [r2, #0x18]
	mov r0, sl
	ldrh r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r2, r0, r5
	ldrh r0, [r2, #0x18]
	cmp r0, #3
	bne _0805174A
	mov r1, r8
	strh r1, [r2, #0x18]
	b _0805174A
	.align 2, 0
_080516B0: .4byte gUnknown_03001FBC
_080516B4: .4byte gUnknown_081360F0
_080516B8: .4byte gUnknown_020298E0
_080516BC: .4byte gUnknown_08553660
_080516C0: .4byte gUnknown_08553664
_080516C4: .4byte gUnknown_03001470
_080516C8: .4byte gUnknown_02029710
_080516CC: .4byte 0x000003FF
_080516D0: .4byte 0xFFFFFC00
_080516D4: .4byte gUnknown_081360F4
_080516D8: .4byte gUnknown_085643A8
_080516DC: .4byte gUnknown_081360F8
_080516E0: .4byte gUnknown_030030E0
_080516E4: .4byte gUnknown_03002020
_080516E8: .4byte gUnknown_03002B28
_080516EC: .4byte gUnknown_08553C18
_080516F0: .4byte gUnknown_0300453C
_080516F4: .4byte gUnknown_02029A10
_080516F8: .4byte gUnknown_0300451C
_080516FC: .4byte gUnknown_08553BFC
_08051700:
	ldr r2, _080517A4 @ =gUnknown_02029A10
	ldr r0, _080517A8 @ =gUnknown_0300451C
	ldrh r0, [r0]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	movs r0, #0xb4
	muls r0, r4, r0
	adds r1, r1, r0
	adds r1, r1, r2
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r1, #8]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r2, r3, #0x10
	asrs r2, r2, #0x10
	ldrh r1, [r1, #0xa]
	adds r2, r2, r1
	ldr r3, _080517AC @ =gUnknown_08553668
	ldr r0, _080517B0 @ =gUnknown_020298E0
	lsls r1, r4, #3
	adds r1, r1, r4
	lsls r1, r1, #4
	adds r1, r1, r0
	ldrh r0, [r1, #0x16]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldrh r0, [r1, #0x18]
	adds r0, #1
	strh r0, [r1, #0x18]
_0805174A:
	ldr r2, _080517B0 @ =gUnknown_020298E0
	ldr r3, _080517B4 @ =gUnknown_0300453C
	ldrh r0, [r3]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #4
	adds r0, r1, r2
	ldrh r0, [r0, #0x16]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	adds r1, r2, #0
	adds r1, #0x44
	adds r0, r0, r1
	strh r7, [r0]
	ldrh r0, [r3]
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #4
	adds r0, r1, r2
	ldrh r0, [r0, #0x16]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	adds r2, #0x4e
	adds r0, r0, r2
	strh r6, [r0]
	ldrh r0, [r3]
	ldr r1, _080517B8 @ =gUnknown_03001FBC
	movs r3, #0
	ldrsh r1, [r1, r3]
	lsls r2, r7, #0x10
	asrs r2, r2, #0x10
	lsls r3, r6, #0x10
	asrs r3, r3, #0x10
	bl sub_08050528
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080517A4: .4byte gUnknown_02029A10
_080517A8: .4byte gUnknown_0300451C
_080517AC: .4byte gUnknown_08553668
_080517B0: .4byte gUnknown_020298E0
_080517B4: .4byte gUnknown_0300453C
_080517B8: .4byte gUnknown_03001FBC

