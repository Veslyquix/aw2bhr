	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080831FC
sub_080831FC: @ 0x080831FC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r5, r0, #0
	mov r8, r1
	movs r1, #0x30
	rsbs r1, r1, #0
	movs r0, #4
	str r0, [sp]
	movs r2, #0
	mov r3, r8
	bl Interpolate
	str r0, [r5, #0x34]
	ldr r4, _08083258 @ =gUnknown_081D93BC
	ldr r7, [r4]
	adds r6, r5, #0
	adds r6, #0x52
	ldrh r0, [r6]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r7
	ldrb r0, [r0]
	mov sb, r4
	cmp r0, #0
	bne _08083290
	bl sub_0803BC7C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08083264
	ldr r1, [r5, #0x34]
	adds r1, #0x90
	ldr r4, _0808325C @ =gUnknown_081D93C0
	ldr r3, [r4]
	ldr r0, _08083260 @ =0x0000AA98
	str r0, [sp]
	movs r0, #3
	movs r2, #0x48
	bl PutSprite
	b _08083278
	.align 2, 0
_08083258: .4byte gUnknown_081D93BC
_0808325C: .4byte gUnknown_081D93C0
_08083260: .4byte 0x0000AA98
_08083264:
	ldr r1, [r5, #0x34]
	adds r1, #0x90
	ldr r4, _08083284 @ =gUnknown_081D93C0
	ldr r3, [r4]
	ldr r0, _08083288 @ =0x00002A98
	str r0, [sp]
	movs r0, #3
	movs r2, #0x48
	bl PutSprite
_08083278:
	ldr r1, [r5, #0x34]
	adds r1, #0x90
	ldr r3, [r4]
	ldr r0, _0808328C @ =0x00002AA4
	b _08083350
	.align 2, 0
_08083284: .4byte gUnknown_081D93C0
_08083288: .4byte 0x00002A98
_0808328C: .4byte 0x00002AA4
_08083290:
	ldrh r0, [r6]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #1
	bne _080832F8
	bl sub_0803BC88
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080832CC
	ldr r1, [r5, #0x34]
	adds r1, #0x90
	ldr r4, _080832C4 @ =gUnknown_081D93C0
	ldr r3, [r4]
	ldr r0, _080832C8 @ =0x0000BA98
	str r0, [sp]
	movs r0, #3
	movs r2, #0x48
	bl PutSprite
	b _080832E0
	.align 2, 0
_080832C4: .4byte gUnknown_081D93C0
_080832C8: .4byte 0x0000BA98
_080832CC:
	ldr r1, [r5, #0x34]
	adds r1, #0x90
	ldr r4, _080832EC @ =gUnknown_081D93C0
	ldr r3, [r4]
	ldr r0, _080832F0 @ =0x00003A98
	str r0, [sp]
	movs r0, #3
	movs r2, #0x48
	bl PutSprite
_080832E0:
	ldr r1, [r5, #0x34]
	adds r1, #0x90
	ldr r3, [r4]
	ldr r0, _080832F4 @ =0x00003AA4
	b _08083350
	.align 2, 0
_080832EC: .4byte gUnknown_081D93C0
_080832F0: .4byte 0x00003A98
_080832F4: .4byte 0x00003AA4
_080832F8:
	ldrh r0, [r6]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #5
	bne _08083368
	bl sub_0803BC94
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08083334
	ldr r1, [r5, #0x34]
	adds r1, #0x90
	ldr r4, _0808332C @ =gUnknown_081D93C0
	ldr r3, [r4]
	ldr r0, _08083330 @ =0x0000CA98
	str r0, [sp]
	movs r0, #3
	movs r2, #0x48
	bl PutSprite
	b _08083348
	.align 2, 0
_0808332C: .4byte gUnknown_081D93C0
_08083330: .4byte 0x0000CA98
_08083334:
	ldr r1, [r5, #0x34]
	adds r1, #0x90
	ldr r4, _0808335C @ =gUnknown_081D93C0
	ldr r3, [r4]
	ldr r0, _08083360 @ =0x00007A98
	str r0, [sp]
	movs r0, #3
	movs r2, #0x48
	bl PutSprite
_08083348:
	ldr r1, [r5, #0x34]
	adds r1, #0x90
	ldr r3, [r4]
	ldr r0, _08083364 @ =0x00007AA4
_08083350:
	str r0, [sp]
	movs r0, #3
	movs r2, #0x58
	bl PutSprite
	b _080833A0
	.align 2, 0
_0808335C: .4byte gUnknown_081D93C0
_08083360: .4byte 0x00007A98
_08083364: .4byte 0x00007AA4
_08083368:
	ldrh r0, [r6]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #3
	bne _080833A0
	ldr r1, [r5, #0x34]
	adds r1, #0x90
	ldr r4, _08083460 @ =gUnknown_08615C04
	ldr r0, _08083464 @ =0x00005AB0
	str r0, [sp]
	movs r0, #3
	movs r2, #0x48
	adds r3, r4, #0
	bl PutSprite
	ldr r1, [r5, #0x34]
	adds r1, #0x90
	ldr r0, _08083468 @ =0x00005ABC
	str r0, [sp]
	movs r0, #3
	movs r2, #0x58
	adds r3, r4, #0
	bl PutSprite
_080833A0:
	ldr r0, _0808346C @ =gUnknown_03005968
	ldr r0, [r0]
	cmp r0, #0
	beq _08083450
	movs r0, #0x20
	bl sub_0803CBD8
	cmp r0, #0
	beq _08083450
	mov r0, sb
	ldr r4, [r0]
	adds r0, r5, #0
	adds r0, #0x52
	ldrh r0, [r0]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _08083450
	movs r6, #0x80
	lsls r6, r6, #1
	movs r0, #4
	str r0, [sp]
	movs r1, #0x10
	adds r2, r6, #0
	mov r3, r8
	bl Interpolate
	str r0, [r5, #0x34]
	ldr r4, _08083470 @ =gSinLut
	adds r0, r4, #0
	adds r0, #0x80
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r7, r0, #4
	adds r0, r7, #0
	adds r1, r6, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sb, r0
	movs r0, #0
	ldrsh r4, [r4, r0]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	ldr r1, [r5, #0x34]
	cmp r1, #0
	bne _0808340A
	movs r1, #2
_0808340A:
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r4, #4
	adds r1, r6, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	ldr r1, [r5, #0x34]
	cmp r1, #0
	bne _08083428
	movs r1, #2
_08083428:
	adds r0, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #1
	mov r1, sb
	mov r2, r8
	adds r3, r4, #0
	bl SetObjAffine
	ldr r1, _08083474 @ =0x0000025B
	ldr r2, _08083478 @ =0x00000153
	ldr r3, _0808347C @ =gUnknown_0848B6CE
	ldr r0, _08083480 @ =0x0000D2C8
	str r0, [sp]
	movs r0, #1
	bl PutSpriteExt
_08083450:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08083460: .4byte gUnknown_08615C04
_08083464: .4byte 0x00005AB0
_08083468: .4byte 0x00005ABC
_0808346C: .4byte gUnknown_03005968
_08083470: .4byte gSinLut
_08083474: .4byte 0x0000025B
_08083478: .4byte 0x00000153
_0808347C: .4byte gUnknown_0848B6CE
_08083480: .4byte 0x0000D2C8

