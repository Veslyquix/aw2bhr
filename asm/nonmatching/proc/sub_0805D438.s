	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805D438
sub_0805D438: @ 0x0805D438
	push {r4, r5, r6, r7, lr}
	ldr r0, _0805D458 @ =gUnknown_030044D8
	ldrb r0, [r0]
	adds r1, r0, #0
	cmp r1, #0
	beq _0805D446
	b _0805D5DE
_0805D446:
	ldr r7, _0805D45C @ =gUnknown_030046B0
	ldr r5, [r7]
	ldrb r0, [r5]
	cmp r0, #0
	bne _0805D464
	ldr r1, _0805D460 @ =gUnknown_03004780
	movs r0, #1
	b _0805D5DC
	.align 2, 0
_0805D458: .4byte gUnknown_030044D8
_0805D45C: .4byte gUnknown_030046B0
_0805D460: .4byte gUnknown_03004780
_0805D464:
	ldrb r0, [r5]
	cmp r0, #0x40
	beq _0805D534
	ldr r1, _0805D4AC @ =gUnknown_03003F38
	ldrb r0, [r5]
	strb r0, [r1]
	ldr r6, _0805D4B0 @ =gUnknown_030040D8
	ldr r2, _0805D4B4 @ =gUnknown_08499594
	ldrb r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [r2]
	adds r4, r1, r0
	str r4, [r6]
	ldr r3, _0805D4B8 @ =gUnknown_03004784
	ldr r2, _0805D4BC @ =gUnknown_085766E0
	ldrb r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, #4
	ldr r1, [r2]
	adds r1, r1, r0
	str r1, [r3]
	ldrb r1, [r4, #1]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0805D4A6
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805D4C0
_0805D4A6:
	adds r0, r5, #1
	str r0, [r7]
	b _0805D5DE
	.align 2, 0
_0805D4AC: .4byte gUnknown_03003F38
_0805D4B0: .4byte gUnknown_030040D8
_0805D4B4: .4byte gUnknown_08499594
_0805D4B8: .4byte gUnknown_03004784
_0805D4BC: .4byte gUnknown_085766E0
_0805D4C0:
	ldr r1, _0805D520 @ =gUnknown_03003F24
	ldrb r0, [r4, #2]
	movs r3, #0
	strh r0, [r1]
	ldrb r0, [r4, #3]
	strh r0, [r1, #2]
	ldr r2, _0805D524 @ =gUnknown_030045CC
	ldrb r1, [r2]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _0805D528 @ =gUnknown_030046C0
	strb r3, [r0]
	strb r3, [r0, #0x13]
	strb r3, [r0, #6]
	strb r3, [r0, #7]
	ldr r0, _0805D52C @ =gUnknown_08499590
	ldr r2, [r0]
	ldrb r1, [r4, #3]
	lsls r1, r1, #1
	ldr r5, _0805D530 @ =0x0000417A
	adds r0, r2, r5
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrb r1, [r4, #2]
	adds r0, r0, r1
	adds r2, #0x12
	adds r2, r2, r0
	strb r3, [r2]
	ldr r2, [r6]
	ldrb r1, [r2, #1]
	movs r0, #4
	orrs r0, r1
	strb r0, [r2, #1]
	bl sub_080129E0
	ldr r4, [r6]
	movs r1, #0x64
	bl __umodsi3
	strb r0, [r4, #0xa]
	bl sub_0805A95C
	b _0805D538
	.align 2, 0
_0805D520: .4byte gUnknown_03003F24
_0805D524: .4byte gUnknown_030045CC
_0805D528: .4byte gUnknown_030046C0
_0805D52C: .4byte gUnknown_08499590
_0805D530: .4byte 0x0000417A
_0805D534:
	ldr r0, _0805D5AC @ =gUnknown_030046C0
	strb r1, [r0, #0x13]
_0805D538:
	ldr r0, _0805D5B0 @ =gUnknown_03004680
	bl sub_08071908
	cmp r0, #0
	bne _0805D564
	ldr r0, _0805D5B4 @ =gUnknown_030046B0
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0x40
	beq _0805D550
	bl sub_0805E9DC
_0805D550:
	ldr r2, _0805D5B8 @ =gUnknown_030045CC
	ldrb r1, [r2]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _0805D5BC @ =gUnknown_03004778
	ldr r0, [r0]
	bl _call_via_r0
_0805D564:
	ldr r0, _0805D5AC @ =gUnknown_030046C0
	ldrb r0, [r0, #0x13]
	cmp r0, #0
	bne _0805D5D0
	ldr r4, _0805D5B4 @ =gUnknown_030046B0
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, #0x40
	beq _0805D598
	ldr r0, _0805D5C0 @ =gUnknown_08499590
	ldr r2, [r0]
	ldr r0, _0805D5C4 @ =gUnknown_030040D8
	ldr r3, [r0]
	ldrb r1, [r3, #3]
	lsls r1, r1, #1
	ldr r5, _0805D5C8 @ =0x0000417A
	adds r0, r2, r5
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrb r1, [r3, #2]
	adds r0, r0, r1
	adds r2, #0x12
	adds r2, r2, r0
	ldr r0, _0805D5CC @ =gUnknown_03003F38
	ldrb r0, [r0]
	strb r0, [r2]
_0805D598:
	ldr r0, _0805D5C4 @ =gUnknown_030040D8
	ldr r2, [r0]
	ldrb r1, [r2, #1]
	movs r0, #0xfb
	ands r0, r1
	strb r0, [r2, #1]
	ldr r0, [r4]
	adds r0, #1
	str r0, [r4]
	b _0805D5DE
	.align 2, 0
_0805D5AC: .4byte gUnknown_030046C0
_0805D5B0: .4byte gUnknown_03004680
_0805D5B4: .4byte gUnknown_030046B0
_0805D5B8: .4byte gUnknown_030045CC
_0805D5BC: .4byte gUnknown_03004778
_0805D5C0: .4byte gUnknown_08499590
_0805D5C4: .4byte gUnknown_030040D8
_0805D5C8: .4byte 0x0000417A
_0805D5CC: .4byte gUnknown_03003F38
_0805D5D0:
	ldr r1, _0805D5E4 @ =gUnknown_030046B0
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r1, _0805D5E8 @ =gUnknown_03004780
	movs r0, #3
_0805D5DC:
	strh r0, [r1]
_0805D5DE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805D5E4: .4byte gUnknown_030046B0
_0805D5E8: .4byte gUnknown_03004780

