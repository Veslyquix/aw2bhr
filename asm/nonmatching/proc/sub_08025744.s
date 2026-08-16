	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08025744
sub_08025744: @ 0x08025744
	push {r4, lr}
	ldr r2, _0802579C @ =gUnknown_08499590
	ldr r3, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0xf
	ldr r4, _080257A0 @ =0x0000417A
	adds r2, r3, r4
	adds r2, r2, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r2]
	adds r2, r0, r2
	ldr r1, _080257A4 @ =0x0000051A
	adds r0, r3, r1
	adds r0, r0, r2
	ldrb r4, [r0]
	cmp r4, #0
	beq _08025796
	ldr r1, _080257A8 @ =0x00001E42
	adds r0, r3, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _08025796
	adds r0, r3, #0
	adds r0, #0x12
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _080257B0
	ldr r0, _080257AC @ =gUnknown_08499594
	ldr r1, [r0]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #1]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _080257B0
_08025796:
	movs r0, #0
	b _080257BA
	.align 2, 0
_0802579C: .4byte gUnknown_08499590
_080257A0: .4byte 0x0000417A
_080257A4: .4byte 0x0000051A
_080257A8: .4byte 0x00001E42
_080257AC: .4byte gUnknown_08499594
_080257B0:
	adds r0, r4, #0
	bl sub_08026F5C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_080257BA:
	pop {r4}
	pop {r1}
	bx r1

