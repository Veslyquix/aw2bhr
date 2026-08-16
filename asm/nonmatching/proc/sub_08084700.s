	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08084700
sub_08084700: @ 0x08084700
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	blt _080847A6
	adds r0, r5, #0
	adds r0, #0x6a
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _080847A6
	ldr r6, _080847E8 @ =gUnknown_0861696C
	adds r4, r5, #0
	adds r4, #0x52
	ldrh r0, [r4]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r6
	ldrb r0, [r0]
	bl sub_08084858
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08084754
	ldr r2, _080847EC @ =gUnknown_0812598C
	adds r0, r5, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x12
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldr r1, _080847F0 @ =0x0000030A
	movs r2, #0x10
	bl sub_08013618
_08084754:
	ldrh r0, [r4]
	adds r0, #2
	movs r1, #6
	bl DivRem
	adds r0, r0, r6
	ldrb r0, [r0]
	bl sub_0808488C
	adds r4, r5, #0
	adds r4, #0x4a
	ldrh r1, [r4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x12
	movs r2, #0xf
	ands r1, r2
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r1, _080847F4 @ =0x0000031E
	movs r2, #2
	bl sub_08013618
	movs r0, #0x20
	bl sub_0803CBD8
	cmp r0, #0
	beq _080847A6
	ldrh r0, [r4]
	movs r1, #2
	bl Div
	movs r1, #0x10
	bl DivRem
	lsls r0, r0, #1
	ldr r1, _080847F8 @ =gUnknown_0823DE18
	adds r0, r0, r1
	ldr r1, _080847FC @ =0x000003BE
	movs r2, #2
	bl sub_08013618
_080847A6:
	movs r4, #0
	adds r5, #0x4a
	ldr r7, _080847EC @ =gUnknown_0812598C
	ldr r6, _08084800 @ =0x024A0000
_080847AE:
	adds r0, r4, #0
	bl sub_08084858
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080847D0
	ldrh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x12
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r7
	lsrs r1, r6, #0x10
	movs r2, #0x10
	bl sub_08013618
_080847D0:
	movs r0, #0x80
	lsls r0, r0, #0xe
	adds r6, r6, r0
	adds r4, #1
	cmp r4, #5
	ble _080847AE
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080847E8: .4byte gUnknown_0861696C
_080847EC: .4byte gUnknown_0812598C
_080847F0: .4byte 0x0000030A
_080847F4: .4byte 0x0000031E
_080847F8: .4byte gUnknown_0823DE18
_080847FC: .4byte 0x000003BE
_08084800: .4byte 0x024A0000

