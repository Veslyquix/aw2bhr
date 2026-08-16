	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800B048
sub_0800B048: @ 0x0800B048
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	subs r4, r6, #1
	adds r1, r4, #0
	movs r2, #1
	bl IsTerrainAtCoordsType
	cmp r0, #0
	bne _0800B0A0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #3
	bl IsTerrainAtCoordsType
	cmp r0, #0
	bne _0800B0A0
	adds r4, r6, #1
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #3
	bl IsTerrainAtCoordsType
	cmp r0, #0
	beq _0800B094
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
_0800B080:
	bl MakeTileSimple
	adds r1, r6, #2
	adds r0, r5, #0
	movs r2, #3
	bl IsTerrainAtCoordsType
	cmp r0, #0
	bne _0800B184
	b _0800B190
_0800B094:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x20
	bl MakeTileSimple
	b _0800B1A6
_0800B0A0:
	subs r4, r6, #1
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	bl IsTerrainAtCoordsType
	cmp r0, #0
	beq _0800B128
	subs r0, r5, #1
	adds r1, r4, #0
	bl sub_0800AFCC
	movs r2, #0x43
	cmp r0, #0
	beq _0800B0C0
	movs r2, #3
_0800B0C0:
	adds r0, r5, #0
	adds r1, r4, #0
	bl MakeTileSimple
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #3
	bl IsTerrainAtCoordsType
	cmp r0, #0
	beq _0800B10A
	subs r7, r6, #2
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #3
	bl IsTerrainAtCoordsType
	cmp r0, #0
	bne _0800B100
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #1
	bl IsTerrainAtCoordsType
	cmp r0, #0
	bne _0800B100
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #2
	bl MakeTileSimple
	b _0800B10A
_0800B100:
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x22
	bl MakeTileSimple
_0800B10A:
	adds r4, r6, #1
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #3
	bl IsTerrainAtCoordsType
	cmp r0, #0
	beq _0800B122
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x22
	b _0800B080
_0800B122:
	adds r0, r5, #0
	adds r1, r6, #0
	b _0800B194
_0800B128:
	subs r7, r6, #2
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #3
	bl IsTerrainAtCoordsType
	cmp r0, #0
	bne _0800B152
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #1
	bl IsTerrainAtCoordsType
	cmp r0, #0
	bne _0800B152
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #2
	bl MakeTileSimple
	b _0800B15C
_0800B152:
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x22
	bl MakeTileSimple
_0800B15C:
	adds r4, r6, #1
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #3
	bl IsTerrainAtCoordsType
	cmp r0, #0
	beq _0800B19C
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x22
	bl MakeTileSimple
	adds r1, r6, #2
	adds r0, r5, #0
	movs r2, #3
	bl IsTerrainAtCoordsType
	cmp r0, #0
	beq _0800B190
_0800B184:
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x22
	bl MakeTileSimple
	b _0800B1A6
_0800B190:
	adds r0, r5, #0
	adds r1, r4, #0
_0800B194:
	movs r2, #0x23
	bl MakeTileSimple
	b _0800B1A6
_0800B19C:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x23
	bl MakeTileSimple
_0800B1A6:
	ldr r7, _0800B1E8 @ =gUnknown_08499590
	ldr r0, [r7]
	ldrh r0, [r0]
	subs r0, #2
	cmp r5, r0
	bge _0800B1F6
	adds r5, #1
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl IsTerrainAtCoordsType
	cmp r0, #0
	beq _0800B1F6
	ldr r0, [r7]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r6, r0
	bge _0800B1F6
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #3
	bl IsTerrainAtCoordsType
	cmp r0, #0
	beq _0800B1EC
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #3
	bl MakeTileSimple
	b _0800B1F6
	.align 2, 0
_0800B1E8: .4byte gUnknown_08499590
_0800B1EC:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x21
	bl MakeTileSimple
_0800B1F6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

