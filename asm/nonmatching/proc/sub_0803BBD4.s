	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803BBD4
sub_0803BBD4: @ 0x0803BBD4
	push {r4, r5, r6, lr}
	ldr r0, _0803BC30 @ =gUnknown_0200C420
	ldrb r0, [r0, #0xd]
	bl sub_08080F54
	movs r5, #0
	ldr r2, _0803BC34 @ =gUnknown_03003F30
	movs r1, #0
_0803BBE4:
	adds r0, r5, r2
	strb r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #6
	bls _0803BBE4
	movs r5, #0
	ldr r6, _0803BC34 @ =gUnknown_03003F30
_0803BBF6:
	adds r0, r5, #0
	bl sub_08016D04
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r5, #1
	bne _0803BC3C
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	bl sub_08016CD8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803BC1E
	adds r0, r4, #0
	bl sub_08016E04
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803BC2A
_0803BC1E:
	bl sub_080781F0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _0803BC38
_0803BC2A:
	adds r1, r5, r6
	movs r0, #1
	b _0803BC68
	.align 2, 0
_0803BC30: .4byte gUnknown_0200C420
_0803BC34: .4byte gUnknown_03003F30
_0803BC38:
	strb r0, [r6, #1]
	b _0803BC6A
_0803BC3C:
	adds r0, r5, #0
	bl sub_08016D04
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_08016CD8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803BC64
	adds r0, r4, #0
	bl sub_08016E04
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803BC64
	adds r1, r5, r6
	movs r0, #1
	b _0803BC68
_0803BC64:
	adds r1, r5, r6
	movs r0, #0
_0803BC68:
	strb r0, [r1]
_0803BC6A:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bls _0803BBF6
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

