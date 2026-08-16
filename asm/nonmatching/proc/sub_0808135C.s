	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808135C
sub_0808135C: @ 0x0808135C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r6, r0, #0
	ldr r2, _080814A8 @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0
	ldr r1, _080814AC @ =gUnknown_03002020
	strh r0, [r1]
	ldr r1, _080814B0 @ =gUnknown_03002B28
	movs r0, #0x10
	strh r0, [r1]
	ldr r1, _080814B4 @ =gUnknown_03001FFC
	ldrh r0, [r1]
	strh r0, [r1]
	ldrh r1, [r2]
	ldr r0, _080814B8 @ =0x0000FFE0
	ands r0, r1
	movs r3, #4
	mov sl, r3
	mov r1, sl
	orrs r0, r1
	strh r0, [r2]
	ldrb r1, [r2]
	movs r4, #0x21
	rsbs r4, r4, #0
	adds r0, r4, #0
	ands r0, r1
	strb r0, [r2]
	ldrh r1, [r2]
	ldr r0, _080814BC @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xc0
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldrb r1, [r2, #1]
	adds r0, r4, #0
	ands r0, r1
	strb r0, [r2, #1]
	ldr r3, _080814C0 @ =gUnknown_03002B6C
	ldrb r1, [r3]
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r3]
	ldr r3, _080814C4 @ =gUnknown_03001FE8
	ldrb r0, [r3]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3]
	ldr r3, _080814C8 @ =gUnknown_030030B4
	ldrb r1, [r3]
	adds r0, r2, #0
	ands r0, r1
	movs r5, #1
	orrs r0, r5
	strb r0, [r3]
	ldr r1, _080814CC @ =gUnknown_0300251C
	ldrb r0, [r1]
	ands r2, r0
	movs r3, #2
	orrs r2, r3
	strb r2, [r1]
	ldr r2, _080814D0 @ =gUnknown_030030DC
	ldrb r0, [r2]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080814D4 @ =gUnknown_030030A4
	ldrb r0, [r1]
	ands r4, r0
	strb r4, [r1]
	ldr r2, _080814D8 @ =gDispIo
	ldrb r0, [r2, #1]
	orrs r0, r5
	orrs r0, r3
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	bl sub_0801F114
	ldr r1, _080814DC @ =0x06010000
	movs r2, #0xc0
	lsls r2, r2, #2
	movs r0, #2
	movs r3, #0x19
	bl sub_0801F150
	movs r0, #0x50
	bl sub_0801F234
	adds r7, r6, #0
	adds r7, #0x4c
	movs r0, #0
	mov sb, r0
	mov r1, sb
	strh r1, [r7]
	ldr r0, _080814E0 @ =gUnknown_03005934
	ldr r0, [r0]
	adds r4, r6, #0
	adds r4, #0x52
	strh r0, [r4]
	adds r0, r6, #0
	adds r0, #0x4e
	strh r1, [r0]
	ldr r3, _080814E4 @ =gUnknown_030058FC
	mov r8, r3
	ldr r5, [r3]
	cmp r5, #0
	beq _080814FC
	ldr r0, _080814E8 @ =gUnknown_085802D8
	ldr r1, _080814EC @ =gUnknown_0200FC50
	movs r2, #0xa0
	lsls r2, r2, #1
	movs r5, #1
	str r5, [sp]
	str r5, [sp, #4]
	str r6, [sp, #8]
	movs r3, #0
	bl sub_08073304
	mov r1, sl
	ldr r0, _080814AC @ =gUnknown_03002020
	strh r1, [r0]
	movs r0, #0x20
	strh r0, [r7]
	ldr r7, _080814F0 @ =gUnknown_0861696C
	ldrh r0, [r4]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #2
	beq _0808149C
	ldrh r0, [r4]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #4
	bne _080814F4
_0808149C:
	adds r0, r6, #0
	adds r0, #0x64
	mov r3, sb
	strh r3, [r0]
	b _0808151C
	.align 2, 0
_080814A8: .4byte gUnknown_030030E0
_080814AC: .4byte gUnknown_03002020
_080814B0: .4byte gUnknown_03002B28
_080814B4: .4byte gUnknown_03001FFC
_080814B8: .4byte 0x0000FFE0
_080814BC: .4byte 0x0000E0FF
_080814C0: .4byte gUnknown_03002B6C
_080814C4: .4byte gUnknown_03001FE8
_080814C8: .4byte gUnknown_030030B4
_080814CC: .4byte gUnknown_0300251C
_080814D0: .4byte gUnknown_030030DC
_080814D4: .4byte gUnknown_030030A4
_080814D8: .4byte gDispIo
_080814DC: .4byte 0x06010000
_080814E0: .4byte gUnknown_03005934
_080814E4: .4byte gUnknown_030058FC
_080814E8: .4byte gUnknown_085802D8
_080814EC: .4byte gUnknown_0200FC50
_080814F0: .4byte gUnknown_0861696C
_080814F4:
	adds r0, r6, #0
	adds r0, #0x64
	strh r5, [r0]
	b _0808151C
_080814FC:
	ldr r0, _0808157C @ =gUnknown_085802D8
	ldr r1, _08081580 @ =gUnknown_0200FC50
	movs r2, #0xa0
	lsls r2, r2, #1
	movs r4, #1
	str r4, [sp]
	str r5, [sp, #4]
	str r6, [sp, #8]
	movs r3, #0
	bl sub_08073304
	adds r0, r6, #0
	adds r0, #0x64
	strh r5, [r0]
	mov r1, r8
	str r4, [r1]
_0808151C:
	adds r2, r0, #0
	ldr r0, _08081584 @ =gUnknown_03005924
	ldr r0, [r0]
	adds r5, r6, #0
	adds r5, #0x66
	movs r1, #0
	strh r0, [r5]
	adds r0, r6, #0
	adds r0, #0x68
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	str r1, [r6, #0x58]
	str r1, [r6, #0x5c]
	str r1, [r6, #0x60]
	subs r0, #0x20
	strh r1, [r0]
	ldr r1, _08081588 @ =gUnknown_0300591C
	adds r7, r6, #0
	adds r7, #0x52
	ldrh r0, [r7]
	strb r0, [r1]
	ldrh r0, [r2]
	strb r0, [r1, #1]
	ldrh r0, [r5]
	strb r0, [r1, #2]
	adds r0, r6, #0
	bl sub_08084600
	movs r3, #0
	ldrsh r0, [r5, r3]
	cmp r0, #6
	bne _080815B0
	ldr r4, _0808158C @ =gUnknown_0861696C
	ldrh r0, [r7]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #1
	beq _0808159C
	cmp r0, #1
	bgt _08081590
	cmp r0, #0
	beq _08081596
	b _080815B0
	.align 2, 0
_0808157C: .4byte gUnknown_085802D8
_08081580: .4byte gUnknown_0200FC50
_08081584: .4byte gUnknown_03005924
_08081588: .4byte gUnknown_0300591C
_0808158C: .4byte gUnknown_0861696C
_08081590:
	cmp r0, #5
	beq _080815A2
	b _080815B0
_08081596:
	bl sub_0803BC7C
	b _080815A6
_0808159C:
	bl sub_0803BC88
	b _080815A6
_080815A2:
	bl sub_0803BC94
_080815A6:
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080815B0
	movs r0, #7
	strh r0, [r5]
_080815B0:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

