	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08010664
sub_08010664: @ 0x08010664
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	adds r7, r1, #0
	movs r0, #0
	mov sb, r0
	mov sl, r0
_0801067A:
	ldr r0, _08010700 @ =gUnknown_0848896C
	mov r1, sl
	adds r6, r1, r0
	movs r2, #0
	ldrsh r0, [r6, r2]
	adds r1, r5, r0
	cmp r1, #0
	blt _08010770
	ldr r0, _08010704 @ =gUnknown_08499590
	ldr r2, [r0]
	ldrh r3, [r2]
	cmp r1, r3
	bge _08010770
	ldr r0, _08010708 @ =gUnknown_08488974
	mov r1, sl
	adds r4, r1, r0
	movs r3, #0
	ldrsh r0, [r4, r3]
	adds r0, r7, r0
	ldr r1, _0801070C @ =gUnknown_0808D89C
	mov r8, r1
	cmp r0, #0
	blt _08010770
	ldrh r2, [r2, #2]
	cmp r0, r2
	bge _08010770
	adds r0, r5, #0
	adds r1, r7, #0
	mov r2, sb
	bl sub_0800F564
	cmp r0, #0
	beq _08010710
	adds r0, r5, #0
	adds r1, r7, #0
	mov r2, sb
	bl sub_0800F564
	cmp r0, #2
	beq _080106D8
	adds r0, r5, #0
	adds r1, r7, #0
	mov r2, sb
	bl sub_0800F564
	cmp r0, #3
	bne _08010710
_080106D8:
	movs r2, #0
	ldrsh r0, [r6, r2]
	adds r0, r5, r0
	movs r3, #0
	ldrsh r1, [r4, r3]
	adds r1, r7, r1
	movs r2, #0
	bl sub_0800FD44
	adds r2, r0, #0
	movs r1, #0
	ldrsh r0, [r6, r1]
	adds r0, r5, r0
	movs r3, #0
	ldrsh r1, [r4, r3]
	adds r1, r7, r1
	bl MakeTileSimple
	b _08010770
	.align 2, 0
_08010700: .4byte gUnknown_0848896C
_08010704: .4byte gUnknown_08499590
_08010708: .4byte gUnknown_08488974
_0801070C: .4byte gUnknown_0808D89C
_08010710:
	ldr r0, _08010890 @ =gUnknown_08499590
	ldr r2, [r0]
	mov r4, r8
	ldr r0, [r4]
	add r0, sl
	mov r8, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r6, r7, r0
	lsls r1, r6, #1
	ldr r3, _08010894 @ =0x0000417A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r0, _08010898 @ =gUnknown_0848896C
	mov r3, sl
	adds r4, r3, r0
	movs r3, #0
	ldrsh r0, [r4, r3]
	adds r3, r5, r0
	adds r1, r1, r3
	lsls r1, r1, #1
	ldr r0, _0801089C @ =0x00000A22
	adds r2, r2, r0
	adds r2, r2, r1
	ldr r1, _080108A0 @ =0xFFFFFE9E
	adds r0, r1, #0
	ldrh r2, [r2]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _08010770
	adds r0, r3, #0
	adds r1, r6, #0
	movs r2, #0
	bl sub_0800FD44
	adds r2, r0, #0
	movs r3, #0
	ldrsh r0, [r4, r3]
	adds r0, r5, r0
	mov r4, r8
	movs r3, #0
	ldrsh r1, [r4, r3]
	adds r1, r7, r1
	bl MakeTileSimple
_08010770:
	movs r4, #2
	add sl, r4
	movs r0, #1
	add sb, r0
	mov r1, sb
	cmp r1, #3
	bgt _08010780
	b _0801067A
_08010780:
	ldr r0, _08010890 @ =gUnknown_08499590
	ldr r1, [r0]
	lsls r2, r7, #1
	ldr r3, _08010894 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r4, _0801089C @ =0x00000A22
	adds r1, r1, r4
	adds r1, r1, r0
	ldrh r1, [r1]
	ldr r3, _080108A4 @ =0xFFFFFEBE
	adds r0, r1, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r2, [sp]
	cmp r0, #1
	bls _080107F2
	movs r0, #0xa0
	lsls r0, r0, #1
	cmp r1, r0
	beq _080107F2
	adds r0, #1
	cmp r1, r0
	beq _080107F2
	adds r0, #0x1f
	cmp r1, r0
	beq _080107F2
	adds r0, #1
	cmp r1, r0
	beq _080107F2
	adds r0, #1
	cmp r1, r0
	beq _080107F2
	adds r0, #1
	cmp r1, r0
	beq _080107F2
	subs r0, #0x41
	cmp r1, r0
	beq _080107F2
	adds r0, #1
	cmp r1, r0
	beq _080107F2
	subs r0, #2
	cmp r1, r0
	beq _080107F2
	subs r0, #1
	cmp r1, r0
	beq _080107F2
	subs r0, #0x1d
	cmp r1, r0
	beq _080107F2
	subs r0, #1
	cmp r1, r0
	bne _08010806
_080107F2:
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #0
	bl sub_0800FD44
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	bl MakeTileSimple
_08010806:
	movs r4, #0
	mov sb, r4
	mov sl, r4
_0801080C:
	ldr r0, _08010898 @ =gUnknown_0848896C
	mov r1, sl
	adds r6, r1, r0
	movs r2, #0
	ldrsh r0, [r6, r2]
	adds r1, r5, r0
	cmp r1, #0
	blt _08010910
	ldr r0, _08010890 @ =gUnknown_08499590
	ldr r2, [r0]
	ldrh r3, [r2]
	cmp r1, r3
	bge _08010910
	ldr r0, _080108A8 @ =gUnknown_08488974
	mov r1, sl
	adds r4, r1, r0
	movs r3, #0
	ldrsh r0, [r4, r3]
	adds r0, r7, r0
	ldr r1, _080108AC @ =gUnknown_0808D89C
	mov r8, r1
	cmp r0, #0
	blt _08010910
	ldrh r2, [r2, #2]
	cmp r0, r2
	bge _08010910
	adds r0, r5, #0
	adds r1, r7, #0
	mov r2, sb
	bl sub_0800F564
	cmp r0, #0
	beq _080108B0
	adds r0, r5, #0
	adds r1, r7, #0
	mov r2, sb
	bl sub_0800F564
	cmp r0, #2
	beq _0801086A
	adds r0, r5, #0
	adds r1, r7, #0
	mov r2, sb
	bl sub_0800F564
	cmp r0, #3
	bne _080108B0
_0801086A:
	movs r2, #0
	ldrsh r0, [r6, r2]
	adds r0, r5, r0
	movs r3, #0
	ldrsh r1, [r4, r3]
	adds r1, r7, r1
	movs r2, #0
	bl sub_0800FD44
	adds r2, r0, #0
	movs r1, #0
	ldrsh r0, [r6, r1]
	adds r0, r5, r0
	movs r3, #0
	ldrsh r1, [r4, r3]
	adds r1, r7, r1
	bl MakeTileSimple
	b _08010910
	.align 2, 0
_08010890: .4byte gUnknown_08499590
_08010894: .4byte 0x0000417A
_08010898: .4byte gUnknown_0848896C
_0801089C: .4byte 0x00000A22
_080108A0: .4byte 0xFFFFFE9E
_080108A4: .4byte 0xFFFFFEBE
_080108A8: .4byte gUnknown_08488974
_080108AC: .4byte gUnknown_0808D89C
_080108B0:
	ldr r0, _08010A28 @ =gUnknown_08499590
	ldr r2, [r0]
	mov r4, r8
	ldr r0, [r4]
	add r0, sl
	mov r8, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r6, r7, r0
	lsls r1, r6, #1
	ldr r3, _08010A2C @ =0x0000417A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r0, _08010A30 @ =gUnknown_0848896C
	mov r3, sl
	adds r4, r3, r0
	movs r3, #0
	ldrsh r0, [r4, r3]
	adds r3, r5, r0
	adds r1, r1, r3
	lsls r1, r1, #1
	ldr r0, _08010A34 @ =0x00000A22
	adds r2, r2, r0
	adds r2, r2, r1
	ldr r1, _08010A38 @ =0xFFFFFE9E
	adds r0, r1, #0
	ldrh r2, [r2]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _08010910
	adds r0, r3, #0
	adds r1, r6, #0
	movs r2, #0
	bl sub_0800FD44
	adds r2, r0, #0
	movs r3, #0
	ldrsh r0, [r4, r3]
	adds r0, r5, r0
	mov r4, r8
	movs r3, #0
	ldrsh r1, [r4, r3]
	adds r1, r7, r1
	bl MakeTileSimple
_08010910:
	movs r4, #2
	add sl, r4
	movs r0, #1
	add sb, r0
	mov r1, sb
	cmp r1, #3
	bgt _08010920
	b _0801080C
_08010920:
	ldr r0, _08010A28 @ =gUnknown_08499590
	ldr r1, [r0]
	ldr r2, _08010A2C @ =0x0000417A
	adds r0, r1, r2
	ldr r3, [sp]
	adds r0, r0, r3
	ldrh r0, [r0]
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r4, _08010A34 @ =0x00000A22
	adds r1, r1, r4
	adds r1, r1, r0
	ldrh r1, [r1]
	ldr r2, _08010A3C @ =0xFFFFFEBE
	adds r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _08010990
	movs r0, #0xa0
	lsls r0, r0, #1
	cmp r1, r0
	beq _08010990
	adds r0, #1
	cmp r1, r0
	beq _08010990
	adds r0, #0x1f
	cmp r1, r0
	beq _08010990
	adds r0, #1
	cmp r1, r0
	beq _08010990
	adds r0, #1
	cmp r1, r0
	beq _08010990
	adds r0, #1
	cmp r1, r0
	beq _08010990
	subs r0, #0x41
	cmp r1, r0
	beq _08010990
	adds r0, #1
	cmp r1, r0
	beq _08010990
	subs r0, #2
	cmp r1, r0
	beq _08010990
	subs r0, #1
	cmp r1, r0
	beq _08010990
	subs r0, #0x1d
	cmp r1, r0
	beq _08010990
	subs r0, #1
	cmp r1, r0
	bne _080109A2
_08010990:
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_08010B34
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	bl MakeTileSimple
_080109A2:
	movs r3, #0
	mov sb, r3
	mov sl, r3
_080109A8:
	ldr r0, _08010A30 @ =gUnknown_0848896C
	mov r4, sl
	adds r6, r4, r0
	movs r1, #0
	ldrsh r0, [r6, r1]
	adds r1, r5, r0
	cmp r1, #0
	blt _08010AA6
	ldr r0, _08010A28 @ =gUnknown_08499590
	ldr r2, [r0]
	ldrh r3, [r2]
	cmp r1, r3
	bge _08010AA6
	ldr r0, _08010A40 @ =gUnknown_08488974
	adds r4, r4, r0
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r0, r7, r0
	ldr r3, _08010A44 @ =gUnknown_0808D89C
	mov r8, r3
	cmp r0, #0
	blt _08010AA6
	ldrh r2, [r2, #2]
	cmp r0, r2
	bge _08010AA6
	adds r0, r5, #0
	adds r1, r7, #0
	mov r2, sb
	bl sub_0800F564
	cmp r0, #0
	beq _08010A48
	adds r0, r5, #0
	adds r1, r7, #0
	mov r2, sb
	bl sub_0800F564
	cmp r0, #2
	beq _08010A04
	adds r0, r5, #0
	adds r1, r7, #0
	mov r2, sb
	bl sub_0800F564
	cmp r0, #3
	bne _08010A48
_08010A04:
	movs r1, #0
	ldrsh r0, [r6, r1]
	adds r0, r5, r0
	movs r2, #0
	ldrsh r1, [r4, r2]
	adds r1, r7, r1
	bl sub_08010B34
	adds r2, r0, #0
	movs r3, #0
	ldrsh r0, [r6, r3]
	adds r0, r5, r0
	movs r3, #0
	ldrsh r1, [r4, r3]
	adds r1, r7, r1
	bl MakeTileSimple
	b _08010AA6
	.align 2, 0
_08010A28: .4byte gUnknown_08499590
_08010A2C: .4byte 0x0000417A
_08010A30: .4byte gUnknown_0848896C
_08010A34: .4byte 0x00000A22
_08010A38: .4byte 0xFFFFFE9E
_08010A3C: .4byte 0xFFFFFEBE
_08010A40: .4byte gUnknown_08488974
_08010A44: .4byte gUnknown_0808D89C
_08010A48:
	ldr r0, _08010AC8 @ =gUnknown_08499590
	ldr r2, [r0]
	mov r4, r8
	ldr r0, [r4]
	add r0, sl
	mov r8, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r6, r7, r0
	lsls r1, r6, #1
	ldr r3, _08010ACC @ =0x0000417A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r0, _08010AD0 @ =gUnknown_0848896C
	mov r3, sl
	adds r4, r3, r0
	movs r3, #0
	ldrsh r0, [r4, r3]
	adds r3, r5, r0
	adds r1, r1, r3
	lsls r1, r1, #1
	ldr r0, _08010AD4 @ =0x00000A22
	adds r2, r2, r0
	adds r2, r2, r1
	ldr r1, _08010AD8 @ =0xFFFFFE9E
	adds r0, r1, #0
	ldrh r2, [r2]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _08010AA6
	adds r0, r3, #0
	adds r1, r6, #0
	bl sub_08010B34
	adds r2, r0, #0
	movs r3, #0
	ldrsh r0, [r4, r3]
	adds r0, r5, r0
	mov r4, r8
	movs r3, #0
	ldrsh r1, [r4, r3]
	adds r1, r7, r1
	bl MakeTileSimple
_08010AA6:
	movs r4, #2
	add sl, r4
	movs r0, #1
	add sb, r0
	mov r1, sb
	cmp r1, #3
	bgt _08010AB6
	b _080109A8
_08010AB6:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010AC8: .4byte gUnknown_08499590
_08010ACC: .4byte 0x0000417A
_08010AD0: .4byte gUnknown_0848896C
_08010AD4: .4byte 0x00000A22
_08010AD8: .4byte 0xFFFFFE9E

