	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08010D28
sub_08010D28: @ 0x08010D28
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #0xf
	bl SetTerrainAt
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl sub_0800FD44
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl MakeTileSimple
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08010ADC
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
	.align 2, 0

