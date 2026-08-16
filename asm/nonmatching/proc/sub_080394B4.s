	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080394B4
sub_080394B4: @ 0x080394B4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
_080394B8:
	movs r6, #0
	ldrh r0, [r4, #0x1e]
	adds r1, r0, #1
	strh r1, [r4, #0x1e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _08039538
	strh r6, [r4, #0x1e]
	movs r1, #0x20
	ldrsh r0, [r4, r1]
	adds r5, r4, #0
	adds r5, #0x26
	adds r0, r5, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08039536
	subs r0, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bhi _080394F6
	ldrh r0, [r4, #0x20]
	adds r0, #1
	strh r0, [r4, #0x20]
	ldrh r0, [r4, #0x22]
	adds r0, #8
	strh r0, [r4, #0x22]
	movs r0, #2
	strh r0, [r4, #0x1e]
	b _080394B8
_080394F6:
	movs r2, #0x22
	ldrsh r0, [r4, r2]
	movs r2, #0x24
	ldrsh r1, [r4, r2]
	bl sub_0803941C
	ldrh r0, [r4, #0x24]
	adds r0, #1
	strh r0, [r4, #0x24]
	movs r1, #0x20
	ldrsh r0, [r4, r1]
	adds r0, r5, r0
	ldrb r0, [r0]
	cmp r0, #0x69
	beq _08039522
	cmp r0, #0x69
	ble _08039528
	cmp r0, #0x6c
	bne _08039528
	ldrh r0, [r4, #0x22]
	adds r0, #6
	b _0803952C
_08039522:
	ldrh r0, [r4, #0x22]
	adds r0, #6
	b _0803952C
_08039528:
	ldrh r0, [r4, #0x22]
	adds r0, #0xe
_0803952C:
	strh r0, [r4, #0x22]
	ldrh r0, [r4, #0x20]
	adds r0, #1
	strh r0, [r4, #0x20]
	b _08039538
_08039536:
	str r6, [r4, #8]
_08039538:
	cmp r6, #0
	bne _080394B8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

