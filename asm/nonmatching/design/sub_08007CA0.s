	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08007CA0
sub_08007CA0: @ 0x08007CA0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r2, #7
	bl IsTerrainAtCoordsType
	cmp r0, #0
	bne _08007D68
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800C840
	cmp r0, #0
	beq _08007CC4
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800C608
_08007CC4:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800977C
	cmp r0, #0
	beq _08007CF2
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080094EC
	cmp r0, #0
	beq _08007CE8
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x2a
	bl MakeTileSimple
	b _08007CF2
_08007CE8:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl sub_08007F14
_08007CF2:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x13
	bl IsTerrainAtCoordsType
	cmp r0, #0
	beq _08007D16
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #7
	bl SetTerrainAt
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x2a
	bl MakeTileSimple
	b _08007D68
_08007D16:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08008C34
	cmp r0, #0
	beq _08007D36
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #7
	bl SetTerrainAt
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08007BA4
	b _08007D68
_08007D36:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #7
	bl SetTerrainAt
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08007C04
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
	bl sub_0800EC20
_08007D68:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

