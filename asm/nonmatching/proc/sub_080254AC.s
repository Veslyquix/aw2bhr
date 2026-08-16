	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080254AC
sub_080254AC: @ 0x080254AC
	push {r4, r5, r6, r7, lr}
	ldr r1, _080254F4 @ =gUnknown_08090A4C
	ldr r0, [r1]
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r7, r1, #0
	cmp r2, #0x32
	bhi _0802550A
	ldr r4, _080254F8 @ =gUnknown_03003F2C
	ldr r6, _080254FC @ =gUnknown_08499594
	ldr r5, [r6]
_080254C6:
	ldrh r0, [r4]
	adds r0, r2, r0
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldrb r0, [r1]
	cmp r0, #0
	beq _08025500
	ldrb r0, [r1, #1]
	movs r3, #1
	ands r3, r0
	cmp r3, #0
	bne _08025500
	ldr r1, [r7]
	strh r2, [r1]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x31
	ble _0802554A
	strh r3, [r1]
	b _0802554A
	.align 2, 0
_080254F4: .4byte gUnknown_08090A4C
_080254F8: .4byte gUnknown_03003F2C
_080254FC: .4byte gUnknown_08499594
_08025500:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x32
	bls _080254C6
_0802550A:
	movs r2, #1
	adds r3, r7, #0
	ldr r0, [r3]
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, #1
	cmp r2, r0
	bge _08025578
	ldr r4, _0802555C @ =gUnknown_03003F2C
	ldr r6, _08025560 @ =gUnknown_08499594
	ldr r5, [r6]
_08025520:
	ldrh r0, [r4]
	adds r0, r2, r0
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldrb r0, [r1]
	cmp r0, #0
	beq _08025564
	ldrb r0, [r1, #1]
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _08025564
	ldr r3, [r3]
	strh r2, [r3]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x31
	ble _0802554A
	strh r1, [r3]
_0802554A:
	ldrh r0, [r4]
	adds r0, r2, r0
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r6]
	adds r0, r0, r1
	b _0802557A
	.align 2, 0
_0802555C: .4byte gUnknown_03003F2C
_08025560: .4byte gUnknown_08499594
_08025564:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r3, r7, #0
	ldr r0, [r3]
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, #1
	cmp r2, r0
	blt _08025520
_08025578:
	movs r0, #0
_0802557A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

