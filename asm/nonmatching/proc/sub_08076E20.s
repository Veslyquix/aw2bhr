	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08076E20
sub_08076E20: @ 0x08076E20
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	movs r3, #4
	lsrs r2, r0, #0x14
	movs r0, #0xf
	ands r2, r0
	cmp r2, #0
	beq _08076E32
	movs r3, #3
_08076E32:
	ldr r5, _08076EB0 @ =gUnknown_03000640
	ldr r1, _08076EB4 @ =gUnknown_08614588
	lsls r2, r2, #2
	adds r0, r2, r1
	movs r4, #0
	ldrsh r0, [r0, r4]
	lsls r0, r0, #1
	strh r0, [r5]
	adds r1, #2
	adds r2, r2, r1
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #1
	strh r0, [r5, #2]
	ldr r0, _08076EB8 @ =gUnknown_03004008
	ldr r0, [r0]
	adds r1, r3, #0
	bl __umodsi3
	cmp r0, #0
	bne _08076E88
	movs r2, #0
	ldrsh r0, [r5, r2]
	movs r4, #4
	ldrsh r1, [r5, r4]
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r5, #4]
	adds r0, r0, r1
	strh r0, [r5, #4]
	movs r2, #2
	ldrsh r0, [r5, r2]
	movs r4, #6
	ldrsh r1, [r5, r4]
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r5, #6]
	adds r0, r0, r1
	strh r0, [r5, #6]
_08076E88:
	movs r2, #4
	ldrsh r0, [r5, r2]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	bl sub_08076CAC
	adds r4, r0, #0
	movs r1, #6
	ldrsh r0, [r5, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	bl sub_08076D68
	adds r4, r4, r0
	cmp r4, #0
	bne _08076EBC
	str r4, [r5, #8]
	b _08076F0A
	.align 2, 0
_08076EB0: .4byte gUnknown_03000640
_08076EB4: .4byte gUnknown_08614588
_08076EB8: .4byte gUnknown_03004008
_08076EBC:
	movs r2, #4
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bge _08076EC6
	rsbs r0, r0, #0
_08076EC6:
	lsls r0, r0, #0xf
	lsrs r3, r0, #0x10
	movs r4, #6
	ldrsh r0, [r5, r4]
	cmp r0, #0
	bge _08076ED4
	rsbs r0, r0, #0
_08076ED4:
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x10
	adds r2, r0, #0
	lsls r0, r0, #0x10
	lsls r1, r3, #0x10
	cmp r0, r1
	bge _08076EE4
	adds r2, r3, #0
_08076EE4:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	movs r1, #8
	subs r1, r1, r0
	ldr r0, [r5, #8]
	bl __umodsi3
	cmp r0, #0
	bne _08076F04
	movs r0, #0xe8
	lsls r0, r0, #1
	ldr r1, _08076F10 @ =gUnknown_0202FDFC
	movs r2, #4
	ldrsh r1, [r1, r2]
	bl sub_08072B54
_08076F04:
	ldr r0, [r5, #8]
	adds r0, #1
	str r0, [r5, #8]
_08076F0A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08076F10: .4byte gUnknown_0202FDFC

