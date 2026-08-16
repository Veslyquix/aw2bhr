	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08084600
sub_08084600: @ 0x08084600
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	bl sub_08013C00
	adds r4, r6, #0
	adds r4, #0x52
	ldrh r0, [r4]
	movs r1, #6
	bl DivRem
	adds r5, r0, #0
	movs r0, #0x28
	bl sub_0803CBD8
	cmp r0, #0
	beq _08084632
	ldrh r0, [r4]
	adds r0, #2
	movs r1, #6
	bl DivRem
	cmp r0, #2
	bne _08084632
	movs r5, #6
_08084632:
	movs r0, #0x20
	bl sub_0803CBD8
	cmp r0, #0
	beq _08084650
	adds r0, r6, #0
	adds r0, #0x52
	ldrh r0, [r0]
	adds r0, #2
	movs r1, #6
	bl DivRem
	cmp r0, #0
	bne _08084650
	movs r5, #7
_08084650:
	ldr r0, _08084678 @ =gUnknown_0300591C
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _08084684
	ldr r0, _0808467C @ =gUnknown_08499578
	ldr r2, [r0]
	ldr r1, _08084680 @ =gUnknown_08616FA4
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #0x40
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #0x12
	bl sub_08014668
	b _080846B4
	.align 2, 0
_08084678: .4byte gUnknown_0300591C
_0808467C: .4byte gUnknown_08499578
_08084680: .4byte gUnknown_08616FA4
_08084684:
	ldr r4, _080846C0 @ =gUnknown_08616FB4
	adds r0, r6, #0
	adds r0, #0x66
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #2
	bl DivRem
	lsls r1, r5, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r1, r1, r4
	ldrh r3, [r1]
	ldr r0, _080846C4 @ =gUnknown_08499578
	ldr r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #0x40
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #0x12
	bl sub_08014668
_080846B4:
	bl sub_08013AEC
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080846C0: .4byte gUnknown_08616FB4
_080846C4: .4byte gUnknown_08499578

