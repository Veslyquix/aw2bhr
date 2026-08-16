	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800C454
sub_0800C454: @ 0x0800C454
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _0800C564 @ =gUnknown_0200B0B0
	ldr r0, [r0]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x3b
	ble _0800C476
	adds r0, r4, #0
	bl sub_0800C840
	cmp r0, #0
	beq _0800C55C
_0800C476:
	add r2, sp, #4
	adds r0, r6, #0
	mov r1, sp
	bl sub_0800C6E8
	cmp r0, #0
	beq _0800C4A6
	adds r0, r6, #0
	bl sub_0800C7A4
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl sub_0800C608
	ldr r0, [sp]
	ldr r1, [sp, #4]
	movs r2, #1
	bl SetTerrainAt
	ldr r0, [sp]
	ldr r1, [sp, #4]
	movs r2, #1
	bl sub_08007F14
_0800C4A6:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800C840
	cmp r0, #2
	bne _0800C4CE
	ldr r0, _0800C568 @ =gUnknown_08499590
	ldr r1, [r0]
	lsls r2, r5, #1
	ldr r3, _0800C56C @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r4
	ldr r2, _0800C570 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	bl sub_0800C7A4
_0800C4CE:
	adds r0, r6, #0
	bl sub_080012DC
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800C840
	cmp r0, #0
	beq _0800C508
	ldr r0, _0800C568 @ =gUnknown_08499590
	ldr r1, [r0]
	lsls r2, r5, #1
	ldr r3, _0800C56C @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r4
	ldr r2, _0800C570 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, r6
	beq _0800C55C
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800C608
_0800C508:
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl SetTerrainAt
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl sub_08007F14
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_0800C574
	bl sub_080219AC
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_0800C75C
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800A588
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800ABD0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08007F9C
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800BEE4
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800EC20
_0800C55C:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800C564: .4byte gUnknown_0200B0B0
_0800C568: .4byte gUnknown_08499590
_0800C56C: .4byte 0x0000417A
_0800C570: .4byte 0x00001432

