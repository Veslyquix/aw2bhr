	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800AF74
sub_0800AF74: @ 0x0800AF74
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl IsTerrainWaterOrRiver
	cmp r0, #0
	bne _0800AF8C
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl SetTerrainAt
_0800AF8C:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	bl SetTerrainAt
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800B048
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
	pop {r4, r5}
	pop {r0}
	bx r0

