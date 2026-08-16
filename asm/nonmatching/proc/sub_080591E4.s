	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080591E4
sub_080591E4: @ 0x080591E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp, #0xc]
	movs r1, #0
	str r1, [sp, #0x10]
	ldr r2, _08059278 @ =gUnknown_0816D950
	ldr r3, [r2]
	mov sb, r3
	ldr r0, [r3]
	ldr r6, _0805927C @ =0x00002D5A
	adds r0, r0, r6
	bl sub_0801F92C
	ldr r3, _08059280 @ =gUnknown_030013EC
	ldrh r0, [r4]
	ldrh r1, [r4, #2]
	ldr r6, _08059284 @ =gUnknown_0816D954
	ldr r7, [r6]
	ldr r2, [r7]
	ldrb r2, [r2]
	ldr r4, [sp, #0xc]
	str r4, [sp]
	ldr r4, [r3]
	movs r3, #0x78
	bl _call_via_r4
	ldr r5, _08059288 @ =gUnknown_0816D958
	ldr r0, [r5]
	mov sl, r0
	ldr r4, [r0]
	ldr r0, [r7]
	ldrb r0, [r0, #0xa]
	movs r1, #0x64
	bl __umodsi3
	ldrb r1, [r4, #1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	blo _08059254
	bl sub_08062474
	ldr r2, _0805928C @ =gUnknown_085D5ABC
	ldr r0, [r7]
	ldrb r1, [r0]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0, #0x1d]
	str r0, [sp, #0x10]
_08059254:
	mov r1, sb
	ldr r0, [r1]
	ldr r2, _08059290 @ =0x00002852
	adds r0, r0, r2
	bl sub_0801F92C
	ldr r0, [r7]
	bl sub_080202A4
	mov r3, sl
	ldr r0, [r3]
	ldrb r0, [r0, #1]
	cmp r0, #0x64
	bne _08059298
	ldr r4, _08059294 @ =0x00007FFF
	str r4, [sp, #4]
	b _080592BE
	.align 2, 0
_08059278: .4byte gUnknown_0816D950
_0805927C: .4byte 0x00002D5A
_08059280: .4byte gUnknown_030013EC
_08059284: .4byte gUnknown_0816D954
_08059288: .4byte gUnknown_0816D958
_0805928C: .4byte gUnknown_085D5ABC
_08059290: .4byte 0x00002852
_08059294: .4byte 0x00007FFF
_08059298:
	mov r6, sb
	ldr r2, [r6]
	ldr r3, [r7]
	ldrb r1, [r3, #3]
	lsls r1, r1, #1
	ldr r4, _08059434 @ =0x0000417A
	adds r0, r2, r4
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrb r1, [r3, #2]
	adds r0, r0, r1
	ldr r6, _08059438 @ =0x00002D5A
	adds r2, r2, r6
	adds r2, r2, r0
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
_080592BE:
	ldr r0, _0805943C @ =0x0000FFFF
	str r0, [sp, #8]
	movs r4, #0
	ldr r3, _08059440 @ =gUnknown_0816D950
	ldr r0, [r3]
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	cmp r4, r0
	blt _080592D2
	b _080593D4
_080592D2:
	movs r2, #0
	ldr r0, [r3]
	ldr r0, [r0]
	lsls r4, r4, #0x10
	str r4, [sp, #0x1c]
	ldrh r0, [r0]
	cmp r2, r0
	bge _080593BA
	ldr r1, _08059444 @ =gUnknown_03003340
	str r4, [sp, #0x14]
	asrs r4, r4, #0x10
	mov r8, r4
	lsls r0, r4, #2
	adds r0, r0, r1
	str r0, [sp, #0x18]
_080592F0:
	lsls r0, r2, #0x10
	asrs r4, r0, #0x10
	ldr r6, [sp, #0x18]
	ldr r1, [r6]
	adds r1, r1, r4
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	str r0, [sp, #0x20]
	cmp r1, #0
	blt _080593A2
	ldr r3, [r3]
	mov sb, r3
	ldr r3, [r3]
	mov r0, r8
	lsls r5, r0, #1
	ldr r7, _08059434 @ =0x0000417A
	adds r0, r3, r7
	adds r0, r0, r5
	ldrh r0, [r0]
	adds r2, r0, r4
	ldr r1, _08059438 @ =0x00002D5A
	mov sl, r1
	adds r0, r3, r1
	adds r0, r0, r2
	ldrb r1, [r0]
	ldr r6, [sp, #4]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bgt _080593A2
	ldr r1, _08059448 @ =0x00003262
	adds r0, r3, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	ldr r2, [sp, #0x10]
	ands r0, r2
	cmp r0, #0
	bne _080593A2
	adds r0, r4, #0
	mov r1, r8
	bl sub_08059674
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080593A2
	ldr r2, _0805944C @ =gUnknown_085D5ABC
	ldr r0, _08059450 @ =gUnknown_030040D8
	ldr r0, [r0]
	ldrb r1, [r0]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0, #0x1a]
	mov r3, sb
	ldr r2, [r3]
	cmp r0, #0x20
	beq _0805937C
	adds r0, r2, r7
	adds r0, r0, r5
	ldrh r1, [r0]
	adds r1, r1, r4
	ldr r6, _08059454 @ =0x00001432
	adds r0, r2, r6
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x1f
	ands r0, r1
	cmp r0, #0xb
	beq _080593A2
_0805937C:
	adds r0, r2, r7
	adds r0, r0, r5
	ldrh r1, [r0]
	adds r1, r1, r4
	mov r3, sl
	adds r0, r2, r3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	ldr r4, [sp, #0x20]
	lsrs r4, r4, #0x10
	str r4, [sp, #8]
	ldr r6, [sp, #0x14]
	lsrs r6, r6, #0x10
	str r6, [sp, #0xc]
_080593A2:
	ldr r1, [sp, #0x20]
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r1, r2
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	ldr r3, _08059440 @ =gUnknown_0816D950
	ldr r1, _08059458 @ =gUnknown_08499590
	ldr r1, [r1]
	ldrh r1, [r1]
	cmp r0, r1
	blt _080592F0
_080593BA:
	ldr r3, [sp, #0x1c]
	movs r4, #0x80
	lsls r4, r4, #9
	adds r0, r3, r4
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	ldr r3, _08059440 @ =gUnknown_0816D950
	ldr r1, [r3]
	ldr r1, [r1]
	ldrh r1, [r1, #2]
	cmp r0, r1
	bge _080593D4
	b _080592D2
_080593D4:
	ldr r6, [sp, #8]
	lsls r0, r6, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _080593F2
	ldr r0, [sp, #0xc]
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	movs r0, #0
	str r0, [sp]
	adds r0, r2, #0
	movs r2, #2
	movs r3, #0
	bl sub_0805D648
_080593F2:
	ldr r0, _0805945C @ =gUnknown_030045CC
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08059420
	ldr r0, _08059460 @ =gUnknown_03004784
	ldr r4, [r0]
	ldr r0, _08059450 @ =gUnknown_030040D8
	ldr r0, [r0]
	ldrb r0, [r0, #0xa]
	movs r1, #0x64
	bl __umodsi3
	ldrb r1, [r4, #1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	bls _0805941C
	bl sub_0805F914
_0805941C:
	bl sub_0805F7B8
_08059420:
	bl sub_0805F7B8
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08059434: .4byte 0x0000417A
_08059438: .4byte 0x00002D5A
_0805943C: .4byte 0x0000FFFF
_08059440: .4byte gUnknown_0816D950
_08059444: .4byte gUnknown_03003340
_08059448: .4byte 0x00003262
_0805944C: .4byte gUnknown_085D5ABC
_08059450: .4byte gUnknown_030040D8
_08059454: .4byte 0x00001432
_08059458: .4byte gUnknown_08499590
_0805945C: .4byte gUnknown_030045CC
_08059460: .4byte gUnknown_03004784

