	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802B3AC
sub_0802B3AC: @ 0x0802B3AC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	bl sub_08012E4C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _0802B448 @ =gUnknown_0849A02C
	bl Proc_Find
	cmp r0, #0
	beq _0802B4B8
	ldr r4, _0802B44C @ =gUnknown_030033E4
	ldrh r0, [r4]
	ldrh r1, [r4, #2]
	bl sub_0803DE94
	cmp r0, #0
	bne _0802B402
	ldr r2, _0802B450 @ =gUnknown_020288B4
	ldr r0, _0802B454 @ =gUnknown_08499590
	ldr r5, [r0]
	ldrh r1, [r4, #2]
	lsls r1, r1, #1
	ldr r3, _0802B458 @ =0x0000417A
	adds r0, r5, r3
	adds r0, r0, r1
	ldrh r1, [r0]
	ldrh r0, [r4]
	adds r3, r1, r0
	adds r2, r3, r2
	ldrb r0, [r2]
	cmp r0, #0
	beq _0802B468
_0802B402:
	ldr r0, _0802B45C @ =gUnknown_03003F38
	ldrb r0, [r0]
	bl sub_080251D8
	ldr r2, _0802B460 @ =gUnknown_0849A2A6
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r1, r1, r2
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r1]
	adds r0, r0, r1
	adds r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r2, sb
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	subs r1, #0x14
	mov r3, r8
	lsls r2, r3, #0x18
	asrs r2, r2, #0x18
	subs r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _0802B464 @ =gUnknown_030013D0
	ldrh r2, [r2, #0x14]
	movs r3, #0xd3
	lsls r3, r3, #1
	bl sub_08037200
	b _0802B4B8
	.align 2, 0
_0802B448: .4byte gUnknown_0849A02C
_0802B44C: .4byte gUnknown_030033E4
_0802B450: .4byte gUnknown_020288B4
_0802B454: .4byte gUnknown_08499590
_0802B458: .4byte 0x0000417A
_0802B45C: .4byte gUnknown_03003F38
_0802B460: .4byte gUnknown_0849A2A6
_0802B464: .4byte gUnknown_030013D0
_0802B468:
	ldr r0, _0802B4C4 @ =gUnknown_03003F38
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0x12
	adds r1, r1, r3
	ldrb r1, [r1]
	ldr r2, _0802B4C8 @ =gUnknown_03003100
	bl sub_080251BC
	ldr r2, _0802B4CC @ =gUnknown_0849A2A6
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r2, #2
	adds r1, r1, r2
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r1]
	adds r0, r0, r1
	adds r0, #0x1b
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r2, sb
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	subs r1, #0x14
	mov r3, r8
	lsls r2, r3, #0x18
	asrs r2, r2, #0x18
	subs r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _0802B4D0 @ =gUnknown_030013D0
	ldrh r2, [r2, #0x14]
	movs r3, #0xd3
	lsls r3, r3, #1
	bl sub_08037200
_0802B4B8:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802B4C4: .4byte gUnknown_03003F38
_0802B4C8: .4byte gUnknown_03003100
_0802B4CC: .4byte gUnknown_0849A2A6
_0802B4D0: .4byte gUnknown_030013D0

