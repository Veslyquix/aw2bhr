	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08053FBC
sub_08053FBC: @ 0x08053FBC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r1, _08054064 @ =gUnknown_020296B0
	ldr r0, _08054068 @ =gUnknown_02029C00
	lsls r2, r6, #1
	mov r8, r2
	adds r5, r2, r0
	ldrh r0, [r5]
	lsls r2, r0, #1
	lsls r0, r6, #2
	adds r7, r0, r6
	lsls r0, r7, #3
	adds r0, r2, r0
	adds r1, #0xc
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0xff
	beq _080540E0
	ldr r0, _0805406C @ =gUnknown_03004508
	ldr r1, _08054070 @ =gUnknown_08551E12
	adds r1, r2, r1
	ldrh r0, [r0]
	ldrh r1, [r1]
	cmp r0, r1
	bne _080540E0
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_080540F0
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	ldr r1, _08054074 @ =gUnknown_02029BEC
	adds r0, r7, r4
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #1
	strh r1, [r0]
	ldr r2, _08054078 @ =gUnknown_08136128
	ldr r0, [r2]
	mov ip, r0
	lsls r1, r6, #4
	adds r0, #2
	adds r3, r1, r0
	ldrh r0, [r3]
	adds r7, r1, #0
	cmp r0, #0
	beq _080540E0
	cmp r0, #1
	beq _080540E0
	ldrh r1, [r5]
	cmp r1, #1
	bne _080540E0
	ldr r5, _0805407C @ =gUnknown_0813612C
	ldr r2, [r5]
	mov sb, r2
	ldr r2, _08054080 @ =gUnknown_08136130
	ldr r0, [r2]
	add r0, r8
	ldrh r0, [r0]
	ands r1, r0
	lsls r4, r1, #1
	ldrh r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r1, r0, #3
	mov r0, ip
	adds r0, #6
	adds r0, r7, r0
	ldrh r0, [r0]
	adds r3, r5, #0
	mov sl, r2
	cmp r0, #2
	bne _08054084
	adds r0, r1, #4
	adds r0, r4, r0
	b _08054086
	.align 2, 0
_08054064: .4byte gUnknown_020296B0
_08054068: .4byte gUnknown_02029C00
_0805406C: .4byte gUnknown_03004508
_08054070: .4byte gUnknown_08551E12
_08054074: .4byte gUnknown_02029BEC
_08054078: .4byte gUnknown_08136128
_0805407C: .4byte gUnknown_0813612C
_08054080: .4byte gUnknown_08136130
_08054084:
	adds r0, r4, r1
_08054086:
	add r0, sb
	ldrh r0, [r0]
	cmp r0, #0
	beq _080540E0
	ldr r3, [r3]
	mov r8, r3
	mov r1, sl
	ldr r0, [r1]
	lsls r6, r6, #1
	str r6, [sp]
	adds r0, r6, r0
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	lsls r4, r0, #1
	ldr r1, _080540C4 @ =gUnknown_03004580
	adds r0, r1, #2
	adds r0, r7, r0
	ldrh r2, [r0]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r2, r0, #3
	adds r1, #6
	adds r1, r7, r1
	ldrh r0, [r1]
	adds r5, r6, #0
	cmp r0, #2
	bne _080540C8
	adds r0, r2, #4
	adds r0, r4, r0
	b _080540CA
	.align 2, 0
_080540C4: .4byte gUnknown_03004580
_080540C8:
	adds r0, r4, r2
_080540CA:
	add r0, r8
	movs r2, #0
	ldrsh r0, [r0, r2]
	bl sub_0803B48C
	mov r0, sl
	ldr r1, [r0]
	adds r1, r5, r1
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_080540E0:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

