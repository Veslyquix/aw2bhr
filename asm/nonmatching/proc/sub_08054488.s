	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08054488
sub_08054488: @ 0x08054488
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r3, _080544EC @ =gUnknown_020298E0
	lsls r1, r4, #3
	adds r1, r1, r4
	lsls r1, r1, #4
	adds r0, r1, r3
	ldrh r0, [r0, #0x16]
	lsls r0, r0, #1
	adds r2, r0, r1
	adds r0, r3, #0
	adds r0, #0x1a
	adds r0, r2, r0
	ldrh r5, [r0]
	cmp r5, #0xff
	beq _080544E6
	ldr r0, _080544F0 @ =gUnknown_03004508
	adds r1, r3, #0
	adds r1, #0xc
	adds r1, r2, r1
	ldrh r0, [r0]
	ldrh r1, [r1]
	cmp r0, r1
	bne _080544E6
	adds r0, r4, #0
	bl sub_08057BCC
	ldr r3, _080544F4 @ =gUnknown_0855374C
	ldr r2, _080544F8 @ =gUnknown_085D6A48
	ldr r0, _080544FC @ =gUnknown_03004580
	lsls r1, r4, #4
	adds r0, #2
	adds r1, r1, r0
	ldrh r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #4]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r2, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	bl _call_via_r2
_080544E6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080544EC: .4byte gUnknown_020298E0
_080544F0: .4byte gUnknown_03004508
_080544F4: .4byte gUnknown_0855374C
_080544F8: .4byte gUnknown_085D6A48
_080544FC: .4byte gUnknown_03004580

