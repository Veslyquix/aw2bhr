	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802DCB4
sub_0802DCB4: @ 0x0802DCB4
	push {r4, r5, lr}
	bl sub_08023824
	bl sub_0802361C
	movs r0, #4
	bl sub_08023908
	movs r0, #0
	bl sub_08023274
	bl sub_0802DBF8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802DCD6
	b _0802DE08
_0802DCD6:
	ldr r1, _0802DCF0 @ =gUnknown_08090C20
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r2, [r0, #4]
	movs r0, #8
	ands r0, r2
	adds r4, r1, #0
	cmp r0, #0
	beq _0802DCF4
	bl sub_0802E250
	b _0802DE12
	.align 2, 0
_0802DCF0: .4byte gUnknown_08090C20
_0802DCF4:
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _0802DD08
	movs r0, #0
	bl sub_0801B780
	bl sub_0802D458
	b _0802DE12
_0802DD08:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0802DD8C
	ldr r5, _0802DD64 @ =gUnknown_08499590
	ldr r2, [r5]
	ldr r4, _0802DD68 @ =gUnknown_030033E4
	ldrh r1, [r4, #2]
	lsls r1, r1, #1
	ldr r3, _0802DD6C @ =0x0000417A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrh r1, [r4]
	adds r0, r0, r1
	adds r2, #0x12
	adds r2, r2, r0
	ldrb r0, [r2]
	cmp r0, #0
	beq _0802DD74
	movs r0, #0
	bl sub_0801B780
	ldr r3, _0802DD70 @ =gUnknown_08499594
	ldr r2, [r5]
	ldrh r1, [r4, #2]
	lsls r1, r1, #1
	ldr r5, _0802DD6C @ =0x0000417A
	adds r0, r2, r5
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrh r1, [r4]
	adds r0, r0, r1
	adds r2, #0x12
	adds r2, r2, r0
	ldrb r0, [r2]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r3]
	adds r0, r0, r1
	bl sub_0803A8F0
	b _0802DE12
	.align 2, 0
_0802DD64: .4byte gUnknown_08499590
_0802DD68: .4byte gUnknown_030033E4
_0802DD6C: .4byte 0x0000417A
_0802DD70: .4byte gUnknown_08499594
_0802DD74:
	movs r0, #0
	bl sub_0801B780
	ldrh r0, [r4]
	ldrh r1, [r4, #2]
	bl sub_0803EED4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_080470F8
	b _0802DE12
_0802DD8C:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0802DDC8
	bl sub_08025580
	bl sub_080254AC
	adds r1, r0, #0
	cmp r1, #0
	beq _0802DDC8
	ldrb r0, [r1, #2]
	ldrb r1, [r1, #3]
	bl sub_08029088
	ldr r0, _0802DDC4 @ =gUnknown_0849A00C
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0802DDC8
	bl sub_0802DCA4
	b _0802DE12
	.align 2, 0
_0802DDC4: .4byte gUnknown_0849A00C
_0802DDC8:
	ldr r0, [r4]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802DDEC
	ldr r1, _0802DDE8 @ =gUnknown_030033E4
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r3, #2
	ldrsh r1, [r1, r3]
	bl sub_0802E4B4
	b _0802DE12
	.align 2, 0
_0802DDE8: .4byte gUnknown_030033E4
_0802DDEC:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0802DE08
	ldr r1, _0802DE18 @ =gUnknown_030033E4
	movs r5, #0
	ldrsh r0, [r1, r5]
	movs r2, #2
	ldrsh r1, [r1, r2]
	bl sub_0802E2D0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802DE12
_0802DE08:
	bl sub_0802A7C4
	movs r0, #0
	bl sub_0802776C
_0802DE12:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802DE18: .4byte gUnknown_030033E4

