	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080421D0
sub_080421D0: @ 0x080421D0
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r3, _08042224 @ =gUnknown_085D5ABC
	ldrb r4, [r7]
	movs r0, #0x5c
	muls r0, r4, r0
	adds r3, #0x14
	adds r0, r0, r3
	ldr r4, [r0]
	ldr r0, _08042228 @ =gUnknown_08499590
	ldr r3, [r0]
	lsls r2, r2, #0x10
	asrs r6, r2, #0x10
	lsls r2, r6, #1
	ldr r5, _0804222C @ =0x0000417A
	adds r0, r3, r5
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r1, r1, #0x10
	asrs r5, r1, #0x10
	adds r0, r0, r5
	ldr r1, _08042230 @ =0x00001432
	adds r3, r3, r1
	adds r3, r3, r0
	ldrb r1, [r3]
	movs r0, #0x1f
	ands r0, r1
	adds r4, #0x1a
	adds r4, r4, r0
	ldrb r0, [r4]
	cmp r0, #0
	beq _08042220
	ldrb r2, [r7, #7]
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08041F38
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08042234
_08042220:
	movs r0, #0
	b _08042236
	.align 2, 0
_08042224: .4byte gUnknown_085D5ABC
_08042228: .4byte gUnknown_08499590
_0804222C: .4byte 0x0000417A
_08042230: .4byte 0x00001432
_08042234:
	movs r0, #1
_08042236:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

