	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08059050
sub_08059050: @ 0x08059050
	push {r4, r5, r6, r7, lr}
	adds r6, r1, #0
	adds r7, r2, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080590CE
	adds r0, r4, #0
	bl sub_08026D44
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080590CE
	ldr r3, _080590D4 @ =gUnknown_03003340
	ldr r0, _080590D8 @ =gUnknown_08499598
	mov ip, r0
	ldr r1, [r0]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r5, r0, #2
	adds r1, r5, r1
	adds r0, r1, #0
	adds r0, #0x2e
	ldrb r2, [r0]
	movs r4, #0x7f
	adds r0, r4, #0
	ands r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r1, #0x2d
	ldrb r2, [r1]
	adds r1, r4, #0
	ands r1, r2
	ldr r0, [r0]
	adds r1, r0, r1
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _080590CE
	adds r1, r0, #0
	movs r2, #0
	ldrsh r0, [r6, r2]
	cmp r1, r0
	bge _080590CE
	strh r1, [r6]
	mov r0, ip
	ldr r1, [r0]
	adds r1, r5, r1
	adds r0, r1, #0
	adds r0, #0x2d
	ldrb r2, [r0]
	adds r0, r4, #0
	ands r0, r2
	strh r0, [r7]
	adds r1, #0x2e
	ldrb r1, [r1]
	adds r0, r4, #0
	ands r0, r1
	strh r0, [r7, #2]
_080590CE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080590D4: .4byte gUnknown_03003340
_080590D8: .4byte gUnknown_08499598

