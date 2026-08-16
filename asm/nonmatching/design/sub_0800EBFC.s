	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800EBFC
sub_0800EBFC: @ 0x0800EBFC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl MakeTileSimple
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetTileWithShadow_unkMapA22
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl MakeTileSimple
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

