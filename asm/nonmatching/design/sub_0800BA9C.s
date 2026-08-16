	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800BA9C
sub_0800BA9C: @ 0x0800BA9C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_0800B528
	cmp r0, #0
	bge _0800BAAE
	movs r0, #0
	b _0800BB24
_0800BAAE:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08007CA0
	ldr r0, _0800BAF8 @ =gUnknown_08499590
	ldr r1, [r0]
	lsls r2, r5, #1
	ldr r3, _0800BAFC @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r4
	ldr r2, _0800BB00 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r6, [r1]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xd
	bl SetTerrainAt
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800B61C
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	bge _0800BB04
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl SetTerrainAt
	movs r0, #0
	b _0800BB24
	.align 2, 0
_0800BAF8: .4byte gUnknown_08499590
_0800BAFC: .4byte 0x0000417A
_0800BB00: .4byte 0x00001432
_0800BB04:
	adds r0, r4, #0
	adds r1, r5, #0
	bl MakeTileSimple
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #7
	bl IsTerrainAtCoordsType
	cmp r0, #0
	bne _0800BB22
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800BB2C
_0800BB22:
	movs r0, #1
_0800BB24:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

