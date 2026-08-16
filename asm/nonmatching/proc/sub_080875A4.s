	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080875A4
sub_080875A4: @ 0x080875A4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	movs r6, #2
	str r6, [sp]
	movs r0, #0x52
	movs r1, #0xd0
	movs r2, #0x88
	movs r3, #0
	bl sub_0801F34C
	str r6, [sp]
	movs r0, #0x53
	movs r1, #0
	movs r2, #0x88
	movs r3, #0
	bl sub_0801F34C
	str r6, [sp]
	movs r0, #0x60
	movs r1, #0x4e
	movs r2, #0x94
	movs r3, #0
	bl sub_0801F34C
	ldr r2, _08087664 @ =gUnknown_0200C078
	ldr r0, _08087668 @ =gUnknown_02027F74
	adds r0, #4
	adds r4, r4, r0
	ldrb r1, [r4]
	subs r1, #0x6c
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x14
	cmp r0, #0
	beq _08087660
	cmp r5, #0x63
	ble _0808761A
	movs r1, #0xfa
	lsls r1, r1, #2
	adds r0, r5, #0
	bl DivRem
	movs r1, #0x64
	bl Div
	adds r0, #0x55
	str r6, [sp]
	movs r1, #0x36
	movs r2, #0x94
	movs r3, #0
	bl sub_0801F34C
_0808761A:
	cmp r5, #9
	ble _0808763A
	adds r0, r5, #0
	movs r1, #0x64
	bl DivRem
	movs r1, #0xa
	bl Div
	adds r0, #0x55
	str r6, [sp]
	movs r1, #0x3e
	movs r2, #0x94
	movs r3, #0
	bl sub_0801F34C
_0808763A:
	cmp r5, #0
	blt _08087654
	adds r0, r5, #0
	movs r1, #0xa
	bl DivRem
	adds r0, #0x55
	str r6, [sp]
	movs r1, #0x46
	movs r2, #0x94
	movs r3, #0
	bl sub_0801F34C
_08087654:
	ldr r2, _0808766C @ =0x00007490
	movs r0, #0x18
	movs r1, #0xa0
	movs r3, #6
	bl sub_0804402C
_08087660:
	movs r4, #0
	b _080876A0
	.align 2, 0
_08087664: .4byte gUnknown_0200C078
_08087668: .4byte gUnknown_02027F74
_0808766C: .4byte 0x00007490
_08087670:
	lsls r0, r4, #5
	adds r0, #0xd8
	subs r1, #2
	lsls r1, r1, #5
	subs r0, r0, r1
	movs r1, #0x80
	lsls r1, r1, #5
	orrs r0, r1
	adds r2, r4, #0
	adds r2, #8
	lsls r2, r2, #0xc
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, #0x90
	movs r3, #0x80
	lsls r3, r3, #3
	orrs r1, r3
	orrs r2, r1
	movs r1, #0xa0
	movs r3, #6
	bl sub_0804402C
_080876A0:
	ldr r1, [r7, #0x38]
	subs r0, r1, #1
	cmp r4, r0
	blt _08087670
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

