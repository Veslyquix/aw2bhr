	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802E724
sub_0802E724: @ 0x0802E724
	push {r4, r5, r6, r7, lr}
	ldr r4, _0802E7A4 @ =gUnknown_08499594
	ldr r2, _0802E7A8 @ =gUnknown_08499590
	ldr r2, [r2]
	lsls r1, r1, #0x10
	asrs r6, r1, #0x10
	lsls r3, r6, #1
	ldr r5, _0802E7AC @ =0x0000417A
	adds r1, r2, r5
	adds r1, r1, r3
	ldrh r1, [r1]
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	adds r1, r1, r5
	adds r2, #0x12
	adds r2, r2, r1
	ldrb r2, [r2]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r1, [r4]
	adds r7, r1, r0
	ldr r0, _0802E7B0 @ =gUnknown_03003F38
	ldrb r0, [r0]
	movs r4, #0xc0
	adds r3, r4, #0
	ands r3, r0
	ldr r0, _0802E7B4 @ =gUnknown_03003F2C
	ldrh r0, [r0]
	cmp r3, r0
	bne _0802E79E
	ldr r1, _0802E7B8 @ =gUnknown_03003340
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0802E79E
	cmp r2, #0
	beq _0802E7C0
	ands r2, r4
	cmp r2, r3
	bne _0802E79E
	ldr r0, _0802E7BC @ =gUnknown_030040D8
	ldr r0, [r0]
	adds r1, r7, #0
	bl sub_08025FC0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0802E7C0
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_080422A8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0802E7C0
_0802E79E:
	movs r0, #0
	b _0802E7C2
	.align 2, 0
_0802E7A4: .4byte gUnknown_08499594
_0802E7A8: .4byte gUnknown_08499590
_0802E7AC: .4byte 0x0000417A
_0802E7B0: .4byte gUnknown_03003F38
_0802E7B4: .4byte gUnknown_03003F2C
_0802E7B8: .4byte gUnknown_03003340
_0802E7BC: .4byte gUnknown_030040D8
_0802E7C0:
	movs r0, #1
_0802E7C2:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

