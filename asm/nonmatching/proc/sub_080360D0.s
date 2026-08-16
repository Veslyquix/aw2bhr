	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080360D0
sub_080360D0: @ 0x080360D0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
_080360D4:
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x4c
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r0, r3
	asrs r0, r0, #0x10
	adds r3, r1, #0
	cmp r0, #0xb
	bhi _080360D4
	lsls r0, r0, #2
	ldr r1, _0803610C @ =_08036110
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803610C: .4byte _08036110
_08036110: @ jump table
	.4byte _080361E4 @ case 0
	.4byte _080361F2 @ case 1
	.4byte _080361F2 @ case 2
	.4byte _080361F2 @ case 3
	.4byte _080361F2 @ case 4
	.4byte _080361DC @ case 5
	.4byte _0803625C @ case 6
	.4byte _0803625C @ case 7
	.4byte _0803625C @ case 8
	.4byte _0803625C @ case 9
	.4byte _08036140 @ case 10
	.4byte _0803615E @ case 11
_08036140:
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, r3, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r4, #0x3e]
	adds r1, r4, #0
	adds r1, #0x35
	movs r0, #3
	strb r0, [r1]
	b _08036284
_0803615E:
	adds r0, r4, #0
	bl sub_08036024
	adds r1, r4, #0
	adds r1, #0x35
	movs r0, #5
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x42
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	adds r1, #0xf
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	bl sub_08027278
	movs r0, #0x7d
	bl sub_0803B4DC
	ldr r0, _080361D0 @ =gUnknown_03003FC0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _08036284
	ldr r0, _080361D4 @ =gUnknown_030032D8
	ldrh r0, [r0]
	cmp r0, #0x13
	beq _08036284
	bl sub_0805C974
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08036284
	ldr r0, _080361D8 @ =gUnknown_08499594
	ldr r2, [r4, #0x30]
	ldr r0, [r0]
	subs r2, r2, r0
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r0, r1, #4
	adds r1, r1, r0
	lsls r0, r1, #8
	adds r1, r1, r0
	lsls r0, r1, #0x10
	adds r1, r1, r0
	rsbs r1, r1, #0
	asrs r1, r1, #2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #2
	movs r2, #0
	movs r3, #0
	bl sub_08034534
	b _08036284
	.align 2, 0
_080361D0: .4byte gUnknown_03003FC0
_080361D4: .4byte gUnknown_030032D8
_080361D8: .4byte gUnknown_08499594
_080361DC:
	adds r0, r4, #0
	bl sub_0803647C
	b _08036284
_080361E4:
	adds r0, r4, #0
	bl sub_08036024
	adds r0, r4, #0
	bl sub_08035828
	b _08036284
_080361F2:
	adds r0, r4, #0
	bl sub_080360A4
	adds r1, r4, #0
	adds r1, #0x39
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, _08036254 @ =gUnknown_030033EC
	ldrh r1, [r0]
	ldr r0, _08036258 @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #0x1c]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08036230
	adds r0, r4, #0
	adds r0, #0x44
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, #8
	adds r0, r4, #0
	adds r0, #0x42
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r0, #8
_08036230:
	adds r5, r4, #0
	adds r5, #0x38
	lsls r0, r6, #0x10
	asrs r1, r0, #0x10
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r1, r0
	beq _08036284
	ldr r0, [r4, #0x2c]
	bl sub_0801C4D4
	strb r6, [r5]
	adds r1, r4, #0
	adds r1, #0x35
	movs r0, #2
	strb r0, [r1]
	b _08036284
	.align 2, 0
_08036254: .4byte gUnknown_030033EC
_08036258: .4byte gUnknown_08499598
_0803625C:
	lsls r0, r6, #0x10
	ldr r1, _08036280 @ =0xFFFB0000
	adds r0, r0, r1
	adds r5, r4, #0
	adds r5, #0x38
	lsrs r6, r0, #0x10
	asrs r1, r0, #0x10
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r1, r0
	bne _08036274
	b _080360D4
_08036274:
	ldr r0, [r4, #0x2c]
	bl sub_0801C4D4
	strb r6, [r5]
	b _080360D4
	.align 2, 0
_08036280: .4byte 0xFFFB0000
_08036284:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

