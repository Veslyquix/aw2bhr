	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08060264
sub_08060264: @ 0x08060264
	push {r4, r5, lr}
	ldr r0, _0806029C @ =gUnknown_08499590
	ldr r1, [r0]
	ldr r3, _080602A0 @ =gUnknown_030046C0
	ldrb r4, [r3, #7]
	lsls r2, r4, #1
	ldr r5, _080602A4 @ =0x0000417A
	adds r0, r1, r5
	adds r0, r0, r2
	ldrh r0, [r0]
	ldrb r2, [r3, #6]
	adds r0, r0, r2
	ldr r3, _080602A8 @ =0x0000234A
	adds r1, r1, r3
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _080602B4
	adds r0, r2, #0
	adds r1, r4, #0
	bl sub_08029088
	ldr r1, _080602AC @ =gUnknown_030046D4
	movs r0, #0
	str r0, [r1]
	ldr r1, _080602B0 @ =gUnknown_030045D4
	movs r0, #8
	b _080602B8
	.align 2, 0
_0806029C: .4byte gUnknown_08499590
_080602A0: .4byte gUnknown_030046C0
_080602A4: .4byte 0x0000417A
_080602A8: .4byte 0x0000234A
_080602AC: .4byte gUnknown_030046D4
_080602B0: .4byte gUnknown_030045D4
_080602B4:
	ldr r1, _080602C0 @ =gUnknown_030045D4
	movs r0, #4
_080602B8:
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080602C0: .4byte gUnknown_030045D4

