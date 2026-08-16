	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800BEB8
sub_0800BEB8: @ 0x0800BEB8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #0x13
	bl IsTerrainAtCoordsType
	cmp r0, #0
	beq _0800BEDE
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800BCD0
	cmp r0, #0
	bne _0800BEDE
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #7
	bl SetTerrainAt
_0800BEDE:
	pop {r4, r5}
	pop {r0}
	bx r0

