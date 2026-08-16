	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08009264
sub_08009264: @ 0x08009264
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08009B38
	cmp r0, #0
	beq _0800930A
	movs r6, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08008CB8
	cmp r0, #9
	bhi _080092E2
	lsls r0, r0, #2
	ldr r1, _0800928C @ =_08009290
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800928C: .4byte _08009290
_08009290: @ jump table
	.4byte _080092B8 @ case 0
	.4byte _080092E2 @ case 1
	.4byte _080092CE @ case 2
	.4byte _080092E2 @ case 3
	.4byte _080092CE @ case 4
	.4byte _080092E2 @ case 5
	.4byte _080092CE @ case 6
	.4byte _080092E2 @ case 7
	.4byte _080092B8 @ case 8
	.4byte _080092B8 @ case 9
_080092B8:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08008D14
	adds r1, r0, #0
	movs r0, #6
	ands r0, r1
	cmp r0, #0
	beq _080092E2
	movs r6, #0x13
	b _080092E6
_080092CE:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08008D14
	adds r1, r0, #0
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	beq _080092E2
	movs r6, #0x16
_080092E2:
	cmp r6, #0
	ble _0800930A
_080092E6:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800C608
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xc
	bl SetTerrainAt
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl MakeTileSimple
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08007F9C
_0800930A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

