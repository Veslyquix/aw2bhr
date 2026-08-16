	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800F4E0
sub_0800F4E0: @ 0x0800F4E0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #2
	bl IsTerrainAtCoordsType
	cmp r0, #0
	bne _0800F4FE
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xc
	bl IsTerrainAtCoordsType
	cmp r0, #0
	beq _0800F508
_0800F4FE:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08009264
	b _0800F55E
_0800F508:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #5
	bl SetTerrainAt
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
_0800F55E:
	pop {r4, r5}
	pop {r0}
	bx r0

