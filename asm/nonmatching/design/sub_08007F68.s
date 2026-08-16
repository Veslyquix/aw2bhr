	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08007F68
sub_08007F68: @ 0x08007F68
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl MakeTileSimple
	subs r6, r5, #1
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	bl IsTerrainAtCoordsType
	cmp r0, #0
	beq _08007F8C
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	bl MakeTileSimple
_08007F8C:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08007D70
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

