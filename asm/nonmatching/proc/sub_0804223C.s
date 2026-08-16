	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804223C
sub_0804223C: @ 0x0804223C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r3, _08042290 @ =gUnknown_085D5ABC
	ldrb r4, [r7]
	movs r0, #0x5c
	muls r0, r4, r0
	adds r3, #0x14
	adds r0, r0, r3
	ldr r4, [r0]
	ldr r0, _08042294 @ =gUnknown_08499590
	ldr r3, [r0]
	lsls r2, r2, #0x10
	asrs r6, r2, #0x10
	lsls r2, r6, #1
	ldr r5, _08042298 @ =0x0000417A
	adds r0, r3, r5
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r1, r1, #0x10
	asrs r5, r1, #0x10
	adds r0, r0, r5
	ldr r1, _0804229C @ =0x00001432
	adds r3, r3, r1
	adds r3, r3, r0
	ldrb r1, [r3]
	movs r0, #0x1f
	ands r0, r1
	adds r4, #0x1a
	adds r4, r4, r0
	ldrb r0, [r4]
	cmp r0, #0
	beq _0804228C
	ldrb r2, [r7, #8]
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08041F38
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080422A0
_0804228C:
	movs r0, #0
	b _080422A2
	.align 2, 0
_08042290: .4byte gUnknown_085D5ABC
_08042294: .4byte gUnknown_08499590
_08042298: .4byte 0x0000417A
_0804229C: .4byte 0x00001432
_080422A0:
	movs r0, #1
_080422A2:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

