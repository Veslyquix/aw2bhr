	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800C124
sub_0800C124: @ 0x0800C124
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	bl IsTerrainWater
	cmp r0, #0
	beq _0800C1AC
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08008C34
	cmp r0, #0
	bne _0800C210
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800C840
	cmp r0, #0
	beq _0800C156
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800C608
_0800C156:
	ldr r0, _0800C19C @ =gUnknown_0200B0B0
	ldr r3, [r0]
	ldr r0, _0800C1A0 @ =gUnknown_08499590
	ldr r1, [r0]
	lsls r2, r5, #1
	ldr r6, _0800C1A4 @ =0x0000417A
	adds r0, r1, r6
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r2, _0800C1A8 @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r3, #0x20]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800EC20
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x2a
	bl MakeTileSimple
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #7
	bl SetTerrainAt
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08007F9C
	b _0800C208
	.align 2, 0
_0800C19C: .4byte gUnknown_0200B0B0
_0800C1A0: .4byte gUnknown_08499590
_0800C1A4: .4byte 0x0000417A
_0800C1A8: .4byte 0x00000A22
_0800C1AC:
	ldr r6, _0800C21C @ =gUnknown_08499590
	mov r8, r6
	ldr r0, [r6]
	lsls r6, r5, #1
	ldr r7, _0800C220 @ =0x0000417A
	adds r1, r0, r7
	adds r1, r1, r6
	ldrh r1, [r1]
	adds r1, r1, r4
	ldr r2, _0800C224 @ =0x00001432
	adds r0, r0, r2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xd
	beq _0800C208
	cmp r0, #0xd
	bgt _0800C208
	cmp r0, #7
	bne _0800C208
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08007CA0
	mov r0, r8
	ldr r1, [r0]
	adds r0, r1, r7
	adds r0, r0, r6
	ldrh r0, [r0]
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r2, _0800C228 @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r0, [r1]
	cmp r0, #0x2a
	beq _0800C208
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x2a
	bl MakeTileSimple
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #7
	bl SetTerrainAt
_0800C208:
	adds r0, r4, #0
	adds r1, r5, #0
	bl EnsureValidTile
_0800C210:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800C21C: .4byte gUnknown_08499590
_0800C220: .4byte 0x0000417A
_0800C224: .4byte 0x00001432
_0800C228: .4byte 0x00000A22

