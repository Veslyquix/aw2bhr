	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08076D68
sub_08076D68: @ 0x08076D68
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	ldr r3, _08076DA4 @ =gUnknown_081CC594
	ldr r5, [r3]
	ldrh r1, [r5, #6]
	mov ip, r1
	ldrh r2, [r5, #2]
	mov r8, r2
	movs r1, #6
	ldrsh r2, [r5, r1]
	movs r1, #2
	ldrsh r6, [r5, r1]
	adds r1, r2, r6
	lsrs r7, r0, #0x10
	asrs r4, r0, #0x10
	adds r1, r1, r4
	adds r2, r2, r4
	cmp r1, #0xef
	bhi _08076DF2
	adds r0, r2, #0
	subs r0, #0x20
	cmp r0, #0x4f
	bhi _08076DA8
	mov r2, ip
	adds r0, r4, r2
	strh r0, [r5, #6]
	b _08076DF2
	.align 2, 0
_08076DA4: .4byte gUnknown_081CC594
_08076DA8:
	adds r1, r6, r4
	cmp r2, #0x6f
	bgt _08076DB6
	cmp r1, #0
	blt _08076DB6
	cmp r4, #0
	blt _08076DC4
_08076DB6:
	cmp r2, #0x20
	ble _08076DD2
	cmp r1, #0x5f
	bgt _08076DD2
	lsls r0, r7, #0x10
	cmp r0, #0
	ble _08076DD2
_08076DC4:
	ldr r1, [r3]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r1, #2]
	adds r0, r0, r2
	strh r0, [r1, #2]
	b _08076DF2
_08076DD2:
	cmp r2, #0
	bge _08076DDC
	ldr r1, [r3]
	movs r0, #0
	b _08076DF0
_08076DDC:
	cmp r2, #0x90
	ble _08076DE6
	ldr r1, [r3]
	movs r0, #0x90
	b _08076DF0
_08076DE6:
	ldr r1, [r3]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r1, #6]
	adds r0, r0, r2
_08076DF0:
	strh r0, [r1, #6]
_08076DF2:
	ldr r3, [r3]
	mov r1, ip
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r2, #6
	ldrsh r1, [r3, r2]
	cmp r0, r1
	bne _08076E10
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r2, #2
	ldrsh r1, [r3, r2]
	cmp r0, r1
	beq _08076E14
_08076E10:
	movs r0, #1
	b _08076E16
_08076E14:
	movs r0, #0
_08076E16:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

