	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08083484
sub_08083484: @ 0x08083484
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	mov sb, r1
	movs r2, #0x30
	rsbs r2, r2, #0
	movs r0, #4
	str r0, [sp]
	movs r0, #1
	movs r1, #0
	mov r3, sb
	bl Interpolate
	str r0, [r5, #0x34]
	ldr r4, _080834F0 @ =gUnknown_081D93C4
	ldr r0, [r4]
	mov r8, r0
	adds r7, r5, #0
	adds r7, #0x52
	adds r6, r5, #0
	adds r6, #0x4e
	movs r1, #0
	ldrsh r0, [r6, r1]
	adds r0, #2
	ldrh r2, [r7]
	adds r0, r0, r2
	movs r1, #6
	bl DivRem
	add r0, r8
	ldrb r0, [r0]
	mov sl, r4
	cmp r0, #0
	bne _08083528
	bl sub_0803BC7C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080834FC
	ldr r1, [r5, #0x34]
	adds r1, #0x90
	ldr r4, _080834F4 @ =gUnknown_081D93C8
	ldr r3, [r4]
	ldr r0, _080834F8 @ =0x0000AA98
	str r0, [sp]
	movs r0, #3
	movs r2, #0x48
	bl PutSprite
	b _08083510
	.align 2, 0
_080834F0: .4byte gUnknown_081D93C4
_080834F4: .4byte gUnknown_081D93C8
_080834F8: .4byte 0x0000AA98
_080834FC:
	ldr r1, [r5, #0x34]
	adds r1, #0x90
	ldr r4, _0808351C @ =gUnknown_081D93C8
	ldr r3, [r4]
	ldr r0, _08083520 @ =0x00002A98
	str r0, [sp]
	movs r0, #3
	movs r2, #0x48
	bl PutSprite
_08083510:
	ldr r1, [r5, #0x34]
	adds r1, #0x90
	ldr r3, [r4]
	ldr r0, _08083524 @ =0x00002AA4
	b _080835F0
	.align 2, 0
_0808351C: .4byte gUnknown_081D93C8
_08083520: .4byte 0x00002A98
_08083524: .4byte 0x00002AA4
_08083528:
	movs r1, #0
	ldrsh r0, [r6, r1]
	adds r0, #2
	ldrh r2, [r7]
	adds r0, r0, r2
	movs r1, #6
	bl DivRem
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #1
	bne _08083594
	bl sub_0803BC88
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08083568
	ldr r1, [r5, #0x34]
	adds r1, #0x90
	ldr r4, _08083560 @ =gUnknown_081D93C8
	ldr r3, [r4]
	ldr r0, _08083564 @ =0x0000BA98
	str r0, [sp]
	movs r0, #3
	movs r2, #0x48
	bl PutSprite
	b _0808357C
	.align 2, 0
_08083560: .4byte gUnknown_081D93C8
_08083564: .4byte 0x0000BA98
_08083568:
	ldr r1, [r5, #0x34]
	adds r1, #0x90
	ldr r4, _08083588 @ =gUnknown_081D93C8
	ldr r3, [r4]
	ldr r0, _0808358C @ =0x00003A98
	str r0, [sp]
	movs r0, #3
	movs r2, #0x48
	bl PutSprite
_0808357C:
	ldr r1, [r5, #0x34]
	adds r1, #0x90
	ldr r3, [r4]
	ldr r0, _08083590 @ =0x00003AA4
	b _080835F0
	.align 2, 0
_08083588: .4byte gUnknown_081D93C8
_0808358C: .4byte 0x00003A98
_08083590: .4byte 0x00003AA4
_08083594:
	movs r1, #0
	ldrsh r0, [r6, r1]
	adds r0, #2
	ldrh r2, [r7]
	adds r0, r0, r2
	movs r1, #6
	bl DivRem
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #5
	bne _08083608
	bl sub_0803BC94
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080835D4
	ldr r1, [r5, #0x34]
	adds r1, #0x90
	ldr r4, _080835CC @ =gUnknown_081D93C8
	ldr r3, [r4]
	ldr r0, _080835D0 @ =0x0000CA98
	str r0, [sp]
	movs r0, #3
	movs r2, #0x48
	bl PutSprite
	b _080835E8
	.align 2, 0
_080835CC: .4byte gUnknown_081D93C8
_080835D0: .4byte 0x0000CA98
_080835D4:
	ldr r1, [r5, #0x34]
	adds r1, #0x90
	ldr r4, _080835FC @ =gUnknown_081D93C8
	ldr r3, [r4]
	ldr r0, _08083600 @ =0x00007A98
	str r0, [sp]
	movs r0, #3
	movs r2, #0x48
	bl PutSprite
_080835E8:
	ldr r1, [r5, #0x34]
	adds r1, #0x90
	ldr r3, [r4]
	ldr r0, _08083604 @ =0x00007AA4
_080835F0:
	str r0, [sp]
	movs r0, #3
	movs r2, #0x58
	bl PutSprite
	b _08083646
	.align 2, 0
_080835FC: .4byte gUnknown_081D93C8
_08083600: .4byte 0x00007A98
_08083604: .4byte 0x00007AA4
_08083608:
	movs r1, #0
	ldrsh r0, [r6, r1]
	adds r0, #2
	ldrh r7, [r7]
	adds r0, r0, r7
	movs r1, #6
	bl DivRem
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #3
	bne _08083646
	ldr r1, [r5, #0x34]
	adds r1, #0x90
	ldr r4, _08083714 @ =gUnknown_08615C04
	ldr r0, _08083718 @ =0x00005AB0
	str r0, [sp]
	movs r0, #3
	movs r2, #0x48
	adds r3, r4, #0
	bl PutSprite
	ldr r1, [r5, #0x34]
	adds r1, #0x90
	ldr r0, _0808371C @ =0x00005ABC
	str r0, [sp]
	movs r0, #3
	movs r2, #0x58
	adds r3, r4, #0
	bl PutSprite
_08083646:
	ldr r0, _08083720 @ =gUnknown_03005968
	ldr r0, [r0]
	cmp r0, #0
	beq _08083702
	movs r0, #0x20
	bl sub_0803CBD8
	cmp r0, #0
	beq _08083702
	mov r2, sl
	ldr r4, [r2]
	adds r1, r5, #0
	adds r1, #0x52
	adds r0, r5, #0
	adds r0, #0x4e
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, #2
	ldrh r1, [r1]
	adds r0, r0, r1
	movs r1, #6
	bl DivRem
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _08083702
	movs r6, #0x80
	lsls r6, r6, #1
	movs r0, #4
	str r0, [sp]
	movs r0, #1
	adds r1, r6, #0
	movs r2, #0x10
	mov r3, sb
	bl Interpolate
	str r0, [r5, #0x34]
	ldr r4, _08083724 @ =gSinLut
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
	movs r2, #0
	ldrsh r4, [r4, r2]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	ldr r1, [r5, #0x34]
	cmp r1, #0
	bne _080836BC
	movs r1, #2
_080836BC:
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
	bne _080836DA
	movs r1, #2
_080836DA:
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
	ldr r1, _08083728 @ =0x0000025B
	ldr r2, _0808372C @ =0x00000153
	ldr r3, _08083730 @ =gUnknown_0848B6CE
	ldr r0, _08083734 @ =0x0000D2C8
	str r0, [sp]
	movs r0, #1
	bl PutSpriteExt
_08083702:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08083714: .4byte gUnknown_08615C04
_08083718: .4byte 0x00005AB0
_0808371C: .4byte 0x00005ABC
_08083720: .4byte gUnknown_03005968
_08083724: .4byte gSinLut
_08083728: .4byte 0x0000025B
_0808372C: .4byte 0x00000153
_08083730: .4byte gUnknown_0848B6CE
_08083734: .4byte 0x0000D2C8

