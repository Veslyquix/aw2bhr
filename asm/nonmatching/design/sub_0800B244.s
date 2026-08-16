	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800B244
sub_0800B244: @ 0x0800B244
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	adds r7, r1, #0
	ldr r0, _0800B2B4 @ =gUnknown_08499590
	mov sl, r0
	ldr r1, [r0]
	lsls r2, r7, #1
	ldr r3, _0800B2B8 @ =0x0000417A
	mov sb, r3
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r2, _0800B2BC @ =0x00000A22
	mov r8, r2
	add r1, r8
	adds r1, r1, r0
	ldrh r4, [r1]
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_0800B1FC
	cmp r0, #0
	beq _0800B280
	b _0800B3B0
_0800B280:
	cmp r7, #0
	bgt _0800B286
	b _0800B4E0
_0800B286:
	subs r4, r7, #1
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	bl IsTerrainAtCoordsType
	adds r6, r4, #0
	cmp r0, #0
	beq _0800B322
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800B1FC
	adds r1, r0, #0
	cmp r1, #0
	beq _0800B2C6
	cmp r1, #0
	bgt _0800B2C0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800B2CE
	b _0800B2F0
	.align 2, 0
_0800B2B4: .4byte gUnknown_08499590
_0800B2B8: .4byte 0x0000417A
_0800B2BC: .4byte 0x00000A22
_0800B2C0:
	cmp r1, #1
	beq _0800B2CA
	b _0800B2F0
_0800B2C6:
	movs r4, #2
	b _0800B2D0
_0800B2CA:
	movs r4, #0x22
	b _0800B2D0
_0800B2CE:
	movs r4, #3
_0800B2D0:
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl MakeTileSimple
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl GetTileWithShadow
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl MakeTileSimple
_0800B2F0:
	adds r1, r7, #1
	adds r0, r5, #0
	bl sub_0800B1FC
	adds r1, r0, #0
	cmp r1, #0
	beq _0800B314
	cmp r1, #0
	bgt _0800B30C
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800B314
	b _0800B318
_0800B30C:
	cmp r1, #1
	bne _0800B318
	movs r4, #0x22
	b _0800B31C
_0800B314:
	movs r4, #0x23
	b _0800B31C
_0800B318:
	movs r4, #1
	rsbs r4, r4, #0
_0800B31C:
	adds r0, r5, #0
	adds r1, r7, #0
	b _0800B404
_0800B322:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #3
	bl IsTerrainAtCoordsType
	cmp r0, #0
	bne _0800B332
	b _0800B4E0
_0800B332:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800B1FC
	adds r1, r0, #0
	cmp r1, #0
	beq _0800B354
	cmp r1, #0
	bgt _0800B34E
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800B35C
	b _0800B37E
_0800B34E:
	cmp r1, #1
	beq _0800B358
	b _0800B37E
_0800B354:
	movs r4, #2
	b _0800B35E
_0800B358:
	movs r4, #0x22
	b _0800B35E
_0800B35C:
	movs r4, #3
_0800B35E:
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl MakeTileSimple
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl GetTileWithShadow
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl MakeTileSimple
_0800B37E:
	adds r1, r7, #1
	adds r0, r5, #0
	bl sub_0800B1FC
	adds r1, r0, #0
	cmp r1, #0
	beq _0800B3A2
	cmp r1, #0
	bgt _0800B39A
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800B3A2
	b _0800B3A6
_0800B39A:
	cmp r1, #1
	bne _0800B3A6
	movs r4, #0x22
	b _0800B3AA
_0800B3A2:
	movs r4, #0x23
	b _0800B3AA
_0800B3A6:
	movs r4, #1
	rsbs r4, r4, #0
_0800B3AA:
	adds r0, r5, #0
	adds r1, r7, #0
	b _0800B404
_0800B3B0:
	cmp r4, #0x23
	bne _0800B44E
	subs r4, r7, #1
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #3
	bl IsTerrainAtCoordsType
	adds r6, r4, #0
	cmp r0, #0
	bne _0800B40C
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl MakeTileSimple
	cmp r5, #0
	ble _0800B3EA
	subs r0, r5, #1
	adds r1, r6, #0
	bl sub_0800AFCC
	cmp r0, #0
	beq _0800B3EA
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x21
	bl MakeTileSimple
_0800B3EA:
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #0x20
	bl MakeTileSimple
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl GetTileWithShadow2
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
_0800B404:
	adds r2, r4, #0
	bl MakeTileSimple
	b _0800B4E0
_0800B40C:
	mov r3, sl
	ldr r1, [r3]
	lsls r2, r6, #1
	mov r3, sb
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r5
	lsls r0, r0, #1
	add r1, r8
	adds r1, r1, r0
	ldrh r1, [r1]
	cmp r1, #0x20
	beq _0800B42C
	cmp r1, #2
	bne _0800B438
_0800B42C:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x20
	bl MakeTileSimple
	b _0800B442
_0800B438:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x23
	bl MakeTileSimple
_0800B442:
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #0x20
	bl MakeTileSimple
	b _0800B4E0
_0800B44E:
	cmp r4, #0x22
	bne _0800B4E0
	subs r4, r7, #1
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	bl IsTerrainAtCoordsType
	adds r6, r4, #0
	cmp r0, #0
	beq _0800B49A
	cmp r5, #0
	ble _0800B476
	subs r0, r5, #1
	adds r1, r4, #0
	bl sub_0800AFCC
	movs r4, #0x21
	cmp r0, #0
	bne _0800B478
_0800B476:
	movs r4, #1
_0800B478:
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl MakeTileSimple
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl GetTileWithShadow2
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl MakeTileSimple
	b _0800B4C0
_0800B49A:
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #3
	bl IsTerrainAtCoordsType
	cmp r0, #0
	beq _0800B4C0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0800B1FC
	movs r2, #0x23
	cmp r0, #0
	bne _0800B4B8
	movs r2, #0x20
_0800B4B8:
	adds r0, r5, #0
	adds r1, r4, #0
	bl MakeTileSimple
_0800B4C0:
	adds r1, r7, #1
	adds r0, r5, #0
	bl sub_0800B1FC
	cmp r0, #0
	beq _0800B4D0
	cmp r0, #1
	beq _0800B4D4
_0800B4D0:
	movs r4, #0x20
	b _0800B4D6
_0800B4D4:
	movs r4, #2
_0800B4D6:
	adds r0, r5, #0
	adds r1, r7, #0
	adds r2, r4, #0
	bl MakeTileSimple
_0800B4E0:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

