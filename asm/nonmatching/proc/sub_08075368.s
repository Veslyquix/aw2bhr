	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08075368
sub_08075368: @ 0x08075368
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r3, [r5, #0x38]
	cmp r3, #1
	beq _080753B4
	cmp r3, #1
	bgt _0807537E
	cmp r3, #0
	beq _08075388
	b _08075484
_0807537E:
	cmp r3, #2
	beq _08075412
	cmp r3, #3
	beq _08075422
	b _08075484
_08075388:
	ldr r2, _080753A4 @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	strb r0, [r2]
	ldr r1, _080753A8 @ =gUnknown_03002020
	movs r0, #0x10
	strh r0, [r1]
	ldr r0, _080753AC @ =gUnknown_03002B28
	strh r3, [r0]
	ldr r0, _080753B0 @ =gUnknown_03001FFC
	strh r3, [r0]
	b _08075484
	.align 2, 0
_080753A4: .4byte gUnknown_030030E0
_080753A8: .4byte gUnknown_03002020
_080753AC: .4byte gUnknown_03002B28
_080753B0: .4byte gUnknown_03001FFC
_080753B4:
	movs r0, #0x2e
	ldrsh r1, [r5, r0]
	movs r3, #0x32
	ldrsh r2, [r5, r3]
	ldr r3, [r5, #0x3c]
	movs r4, #0x10
	str r4, [sp]
	movs r0, #4
	bl Interpolate
	strh r0, [r5, #0x2a]
	movs r0, #0x30
	ldrsh r1, [r5, r0]
	movs r3, #0x34
	ldrsh r2, [r5, r3]
	ldr r3, [r5, #0x3c]
	str r4, [sp]
	movs r0, #4
	bl Interpolate
	strh r0, [r5, #0x2c]
	ldrh r1, [r5, #0x2a]
	ldrh r2, [r5, #0x2c]
	movs r0, #1
	bl sub_08072C40
	movs r0, #0x18
	str r0, [r5, #0x40]
	bl sub_08075340
	ldr r2, [r5, #0x3c]
	cmp r2, #0x10
	bne _0807547E
	movs r0, #2
	str r0, [r5, #0x38]
	ldrh r0, [r5, #0x2a]
	strh r0, [r5, #0x2e]
	ldrh r0, [r5, #0x2c]
	strh r0, [r5, #0x30]
	movs r0, #0xee
	lsls r0, r0, #1
	movs r3, #0x32
	ldrsh r1, [r5, r3]
	subs r1, r2, r1
	bl sub_08072B54
	b _0807547E
_08075412:
	ldr r0, [r5, #0x40]
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	str r0, [r5, #0x40]
	bl sub_08075340
	b _08075484
_08075422:
	movs r0, #0x2e
	ldrsh r1, [r5, r0]
	movs r3, #0x32
	ldrsh r2, [r5, r3]
	ldr r3, [r5, #0x3c]
	movs r4, #8
	str r4, [sp]
	movs r0, #0
	bl Interpolate
	strh r0, [r5, #0x2a]
	movs r0, #0x30
	ldrsh r1, [r5, r0]
	movs r3, #0x34
	ldrsh r2, [r5, r3]
	ldr r3, [r5, #0x3c]
	str r4, [sp]
	movs r0, #0
	bl Interpolate
	strh r0, [r5, #0x2c]
	ldrh r1, [r5, #0x2a]
	ldrh r2, [r5, #0x2c]
	movs r0, #1
	bl sub_08072C40
	ldr r0, [r5, #0x3c]
	cmp r0, #8
	bne _08075468
	movs r0, #0
	str r0, [r5, #0x38]
	ldrh r0, [r5, #0x2a]
	strh r0, [r5, #0x2e]
	ldrh r0, [r5, #0x2c]
	strh r0, [r5, #0x30]
_08075468:
	ldr r0, [r5, #0x40]
	cmp r0, #0x18
	beq _08075472
	adds r0, #1
	str r0, [r5, #0x40]
_08075472:
	ldr r0, [r5, #0x40]
	movs r1, #0x1f
	ands r0, r1
	str r0, [r5, #0x40]
	bl sub_08075340
_0807547E:
	ldr r0, [r5, #0x3c]
	adds r0, #1
	str r0, [r5, #0x3c]
_08075484:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

