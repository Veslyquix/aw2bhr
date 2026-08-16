	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802A3FC
sub_0802A3FC: @ 0x0802A3FC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0802A470 @ =gUnknown_0849A0A8
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _0802A4D2
	ldr r3, _0802A474 @ =gUnknown_03001470
	ldr r2, _0802A478 @ =gUnknown_08090B80
	ldr r0, [r2]
	movs r4, #0
	ldrsh r1, [r0, r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r3
	ldrh r5, [r0, #0x38]
	adds r7, r2, #0
	cmp r5, #0x32
	bhi _0802A4C6
	ldr r0, _0802A47C @ =gUnknown_08499594
	mov r8, r0
	adds r6, r3, #0
_0802A434:
	ldr r0, _0802A480 @ =gUnknown_03003F2C
	ldrh r0, [r0]
	adds r0, r0, r5
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	mov r2, r8
	ldr r0, [r2]
	adds r4, r0, r1
	ldrb r2, [r4]
	cmp r2, #0
	beq _0802A4BC
	ldrb r1, [r4, #1]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	bne _0802A4BC
	cmp r2, #0x16
	bne _0802A488
	adds r0, r4, #0
	ldr r1, _0802A484 @ =sub_0802A304
	bl sub_0802A38C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802A488
	ldr r0, [r7]
	movs r4, #0
	ldrsh r1, [r0, r4]
	b _0802A4A8
	.align 2, 0
_0802A470: .4byte gUnknown_0849A0A8
_0802A474: .4byte gUnknown_03001470
_0802A478: .4byte gUnknown_08090B80
_0802A47C: .4byte gUnknown_08499594
_0802A480: .4byte gUnknown_03003F2C
_0802A484: .4byte sub_0802A304
_0802A488:
	adds r0, r4, #0
	bl sub_0802A258
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0802A4BC
	adds r0, r4, #0
	ldr r1, _0802A4B8 @ =sub_0802A2E4
	bl sub_0802A38C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802A4BC
	ldr r0, [r7]
	movs r2, #0
	ldrsh r1, [r0, r2]
_0802A4A8:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r6
	adds r1, r5, #1
	strh r1, [r0, #0x38]
	b _0802A4C6
	.align 2, 0
_0802A4B8: .4byte sub_0802A2E4
_0802A4BC:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0x32
	bls _0802A434
_0802A4C6:
	cmp r5, #0x33
	bne _0802A4D2
	ldr r0, [r7]
	ldrb r0, [r0]
	bl sub_08015C30
_0802A4D2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

