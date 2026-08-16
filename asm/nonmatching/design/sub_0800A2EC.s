	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800A2EC
sub_0800A2EC: @ 0x0800A2EC
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	cmp r6, #0
	ble _0800A316
	subs r4, r6, #1
	adds r1, r4, #0
	bl sub_08009B38
	cmp r0, #0
	beq _0800A316
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	bl SetTerrainAt
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	bl MakeTileSimple
_0800A316:
	ldr r1, _0800A3A4 @ =gUnknown_0808D838
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	subs r0, #1
	adds r7, r1, #0
	cmp r6, r0
	bge _0800A348
	adds r4, r6, #1
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08009B38
	cmp r0, #0
	beq _0800A348
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	bl SetTerrainAt
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	bl MakeTileSimple
_0800A348:
	cmp r5, #0
	ble _0800A36E
	subs r4, r5, #1
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_08009B38
	cmp r0, #0
	beq _0800A36E
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	bl SetTerrainAt
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	bl MakeTileSimple
_0800A36E:
	ldr r0, [r7]
	ldr r0, [r0]
	ldrh r0, [r0]
	subs r0, #1
	cmp r5, r0
	bge _0800A39C
	adds r4, r5, #1
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_08009B38
	cmp r0, #0
	beq _0800A39C
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	bl SetTerrainAt
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	bl MakeTileSimple
_0800A39C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800A3A4: .4byte gUnknown_0808D838

