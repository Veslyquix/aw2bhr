	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080719EC
sub_080719EC: @ 0x080719EC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r4, [r0, r1]
	bl sub_08034F6C
	cmp r4, r0
	bne _08071ACA
	ldr r2, [r5, #0x58]
	movs r0, #0x78
	movs r1, #0x50
	bl sub_08011A20
	ldr r1, [r5, #0x5c]
	lsls r1, r1, #3
	movs r0, #0x78
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x58
	movs r2, #0
	bl sub_08011A20
	ldr r2, _08071AD0 @ =gUnknown_081CBF64
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08071A36
	ldr r0, [r5, #0x5c]
	cmp r0, #3
	bgt _08071A36
	adds r0, #1
	str r0, [r5, #0x5c]
_08071A36:
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08071A4E
	ldr r0, [r5, #0x5c]
	cmp r0, #0
	ble _08071A4E
	subs r0, #1
	str r0, [r5, #0x5c]
_08071A4E:
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08071A74
	ldr r1, _08071AD4 @ =gUnknown_08613E48
	ldr r0, [r5, #0x5c]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r0, [r5, #0x58]
	adds r0, r0, r1
	str r0, [r5, #0x58]
	ldr r1, _08071AD8 @ =0x0001869F
	cmp r0, r1
	ble _08071A74
	str r1, [r5, #0x58]
_08071A74:
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08071A9A
	ldr r1, _08071AD4 @ =gUnknown_08613E48
	ldr r0, [r5, #0x5c]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r0, [r5, #0x58]
	subs r0, r0, r1
	str r0, [r5, #0x58]
	cmp r0, #0
	bge _08071A9A
	movs r0, #0
	str r0, [r5, #0x58]
_08071A9A:
	ldr r4, [r2]
	ldr r0, [r4]
	ldrh r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08071AB8
	bl sub_08034F6C
	adds r1, r5, #0
	adds r1, #0x64
	strh r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_08071AB8:
	ldr r0, [r4]
	ldrh r1, [r0, #4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08071ACA
	adds r0, r5, #0
	bl Proc_End
_08071ACA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08071AD0: .4byte gUnknown_081CBF64
_08071AD4: .4byte gUnknown_08613E48
_08071AD8: .4byte 0x0001869F

