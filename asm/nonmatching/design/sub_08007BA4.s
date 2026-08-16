	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08007BA4
sub_08007BA4: @ 0x08007BA4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	bl sub_08007DD0
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	beq _08007BD6
	cmp r4, #0
	bge _08007BD8
	ldr r0, _08007BF8 @ =gUnknown_08499590
	ldr r1, [r0]
	lsls r2, r6, #1
	ldr r3, _08007BFC @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r5
	ldr r2, _08007C00 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #7
	bne _08007BD8
_08007BD6:
	movs r4, #0x2a
_08007BD8:
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl MakeTileSimple
	cmp r4, #0x2a
	bne _08007BF0
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #7
	bl SetTerrainAt
_08007BF0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08007BF8: .4byte gUnknown_08499590
_08007BFC: .4byte 0x0000417A
_08007C00: .4byte 0x00001432

