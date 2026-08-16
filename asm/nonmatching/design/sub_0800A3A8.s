	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800A3A8
sub_0800A3A8: @ 0x0800A3A8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08009B84
	adds r6, r0, #0
	cmp r6, #0
	ble _0800A3CC
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	bl SetTerrainAt
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl MakeTileSimple
_0800A3CC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

