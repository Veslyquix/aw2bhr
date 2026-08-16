	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080602C4
sub_080602C4: @ 0x080602C4
	push {r4, r5, lr}
	ldr r0, _080602FC @ =gUnknown_030046C0
	ldrb r3, [r0, #6]
	ldrb r4, [r0, #7]
	ldr r0, _08060300 @ =gUnknown_08499590
	ldr r1, [r0]
	lsls r2, r4, #1
	ldr r5, _08060304 @ =0x0000417A
	adds r0, r1, r5
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r3
	ldr r2, _08060308 @ =0x0000234A
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _08060314
	adds r0, r3, #0
	adds r1, r4, #0
	bl sub_08029088
	ldr r1, _0806030C @ =gUnknown_030046D4
	movs r0, #0
	str r0, [r1]
	ldr r1, _08060310 @ =gUnknown_030045D4
	movs r0, #9
	b _08060318
	.align 2, 0
_080602FC: .4byte gUnknown_030046C0
_08060300: .4byte gUnknown_08499590
_08060304: .4byte 0x0000417A
_08060308: .4byte 0x0000234A
_0806030C: .4byte gUnknown_030046D4
_08060310: .4byte gUnknown_030045D4
_08060314:
	ldr r1, _08060320 @ =gUnknown_030045D4
	movs r0, #5
_08060318:
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08060320: .4byte gUnknown_030045D4

