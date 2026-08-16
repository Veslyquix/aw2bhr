	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08007F14
sub_08007F14: @ 0x08007F14
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	bl MakeTileSimple
	cmp r4, #0x2a
	beq _08007F62
	cmp r4, #1
	bne _08007F4A
	subs r4, r6, #1
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	bl IsTerrainAtCoordsType
	cmp r0, #0
	beq _08007F42
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	bl MakeTileSimple
_08007F42:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800ABD0
_08007F4A:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08007D70
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08007F9C
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800A588
_08007F62:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

