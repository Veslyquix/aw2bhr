	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080080F8
sub_080080F8: @ 0x080080F8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #1
	bl IsTerrainAtCoordsType
	cmp r0, #0
	beq _08008154
	ldr r0, _080081C4 @ =gUnknown_08499590
	ldr r1, [r0]
	lsls r2, r5, #1
	ldr r3, _080081C8 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r2, _080081CC @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r2, [r1]
	cmp r2, #0x43
	beq _0800812A
	cmp r2, #3
	bne _08008142
_0800812A:
	adds r1, r5, #1
	adds r0, r4, #0
	movs r2, #3
	bl IsTerrainAtCoordsType
	cmp r0, #0
	bne _08008142
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl MakeTileSimple
_08008142:
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetTileWithShadow_unkMapA22
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl MakeTileSimple
_08008154:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	bl IsTerrainAtCoordsType
	cmp r0, #0
	beq _0800816A
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800B048
_0800816A:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #5
	bl IsTerrainAtCoordsType
	cmp r0, #0
	beq _0800819C
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800F418
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl MakeTileSimple
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetTileWithShadow_unkMapA22
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl MakeTileSimple
_0800819C:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xd
	bl IsTerrainAtCoordsType
	cmp r0, #0
	beq _080081D8
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800B61C
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	bge _080081D0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08007CA0
	b _080081D8
	.align 2, 0
_080081C4: .4byte gUnknown_08499590
_080081C8: .4byte 0x0000417A
_080081CC: .4byte 0x00000A22
_080081D0:
	adds r0, r4, #0
	adds r1, r5, #0
	bl MakeTileSimple
_080081D8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

