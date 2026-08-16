	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080505A4
sub_080505A4: @ 0x080505A4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mov sl, r4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, _08050688 @ =gUnknown_0300453C
	strh r4, [r0]
	ldr r0, _0805068C @ =gUnknown_0300451C
	strh r1, [r0]
	ldr r3, _08050690 @ =gUnknown_08552178
	lsls r7, r1, #1
	lsls r2, r4, #2
	adds r2, r2, r4
	lsls r0, r2, #1
	adds r0, r7, r0
	adds r0, r0, r3
	mov sb, r0
	ldrh r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	adds r0, #2
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _08050694 @ =gUnknown_020296B0
	mov r8, r0
	lsls r6, r2, #3
	adds r0, r6, r0
	ldrh r0, [r0]
	cmp r0, #0
	beq _08050616
	ldr r0, _08050698 @ =gUnknown_08553628
	ldr r1, _0805069C @ =gUnknown_02029700
	lsls r3, r4, #3
	adds r2, r3, r1
	ldr r2, [r2]
	adds r1, #4
	adds r3, r3, r1
	ldr r3, [r3]
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp]
	movs r1, #1
	bl sub_08015410
	adds r2, r7, r6
	mov r1, r8
	adds r1, #2
	adds r2, r2, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r2]
_08050616:
	ldr r2, _080506A0 @ =gUnknown_085D6A48
	ldr r4, _080506A4 @ =gUnknown_03004580
	mov r1, sl
	lsls r3, r1, #4
	adds r0, r4, #2
	adds r0, r3, r0
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #0x14]
	cmp r0, #0
	beq _08050676
	adds r0, r4, #4
	adds r0, r3, r0
	ldrh r0, [r0]
	cmp r0, #1
	bne _08050676
	mov r1, sb
	ldrh r0, [r1]
	lsls r4, r0, #3
	subs r4, r4, r0
	adds r4, #5
	ldr r0, _080506A8 @ =gUnknown_08553610
	ldr r6, _080506AC @ =gUnknown_02029710
	movs r1, #0x58
	mov r5, sl
	muls r5, r1, r5
	adds r1, r6, #4
	adds r1, r5, r1
	ldr r2, [r1]
	adds r1, r6, #0
	adds r1, #8
	adds r1, r5, r1
	ldr r3, [r1]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp]
	movs r1, #1
	bl sub_08015410
	adds r5, r7, r5
	adds r6, #0xc
	adds r5, r5, r6
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r5]
_08050676:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050688: .4byte gUnknown_0300453C
_0805068C: .4byte gUnknown_0300451C
_08050690: .4byte gUnknown_08552178
_08050694: .4byte gUnknown_020296B0
_08050698: .4byte gUnknown_08553628
_0805069C: .4byte gUnknown_02029700
_080506A0: .4byte gUnknown_085D6A48
_080506A4: .4byte gUnknown_03004580
_080506A8: .4byte gUnknown_08553610
_080506AC: .4byte gUnknown_02029710

