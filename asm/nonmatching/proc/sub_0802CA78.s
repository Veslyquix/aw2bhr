	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802CA78
sub_0802CA78: @ 0x0802CA78
	push {r4, r5, lr}
	ldr r0, _0802CAFC @ =gUnknown_030033E8
	ldrb r1, [r0]
	ldrb r0, [r0, #1]
	cmn r1, r0
	bne _0802CB18
	ldr r0, _0802CB00 @ =gUnknown_08499590
	ldr r2, [r0]
	ldr r3, _0802CB04 @ =gUnknown_08090BD8
	ldr r4, [r3]
	ldrh r1, [r4, #2]
	lsls r1, r1, #1
	ldr r5, _0802CB08 @ =0x0000417A
	adds r0, r2, r5
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrh r1, [r4]
	adds r0, r0, r1
	adds r2, #0x12
	adds r2, r2, r0
	ldrb r0, [r2]
	adds r5, r3, #0
	cmp r0, #0
	bne _0802CB18
	ldr r0, [r4]
	ldr r1, _0802CB0C @ =gUnknown_03003F24
	ldr r1, [r1]
	ldr r3, _0802CB10 @ =gUnknown_08090BDC
	ldr r4, _0802CB14 @ =gUnknown_08090BE0
	cmp r0, r1
	beq _0802CACA
	ldr r2, [r3]
	ldr r0, [r4]
	ldr r0, [r0]
	ldrb r1, [r0]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0, #0xe]
	cmp r0, #1
	bne _0802CB18
_0802CACA:
	ldr r2, [r3]
	ldr r4, [r4]
	ldr r0, [r4]
	ldrb r1, [r0]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0, #0xe]
	cmp r0, #0
	beq _0802CB18
	movs r0, #0xff
	bl sub_0801F838
	ldr r1, [r5]
	ldrh r0, [r1]
	ldrh r1, [r1, #2]
	ldr r2, [r4]
	bl sub_08020354
	bl sub_080413E8
	cmp r0, #0
	beq _0802CB18
	movs r0, #0
	b _0802CB1A
	.align 2, 0
_0802CAFC: .4byte gUnknown_030033E8
_0802CB00: .4byte gUnknown_08499590
_0802CB04: .4byte gUnknown_08090BD8
_0802CB08: .4byte 0x0000417A
_0802CB0C: .4byte gUnknown_03003F24
_0802CB10: .4byte gUnknown_08090BDC
_0802CB14: .4byte gUnknown_08090BE0
_0802CB18:
	movs r0, #1
_0802CB1A:
	pop {r4, r5}
	pop {r1}
	bx r1

