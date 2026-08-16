	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800A3D4
sub_0800A3D4: @ 0x0800A3D4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r7, r1, #0
	cmp r7, #0
	ble _0800A43E
	subs r5, r7, #1
	adds r1, r5, #0
	bl sub_08009B38
	cmp r0, #0
	beq _0800A412
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_08009B84
	adds r4, r0, #0
	cmp r4, #0
	ble _0800A43E
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #2
	bl SetTerrainAt
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl MakeTileSimple
	b _0800A43E
_0800A412:
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_080094EC
	cmp r0, #0
	beq _0800A43E
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_0800A798
	cmp r0, #0
	bne _0800A43E
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #7
	bl SetTerrainAt
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #0x2a
	bl MakeTileSimple
_0800A43E:
	ldr r1, _0800A480 @ =gUnknown_0808D83C
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	subs r0, #1
	mov r8, r1
	cmp r7, r0
	bge _0800A4B0
	adds r5, r7, #1
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_08009B38
	cmp r0, #0
	beq _0800A484
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_08009B84
	adds r4, r0, #0
	cmp r4, #0
	ble _0800A4B0
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #2
	bl SetTerrainAt
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl MakeTileSimple
	b _0800A4B0
	.align 2, 0
_0800A480: .4byte gUnknown_0808D83C
_0800A484:
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_080094EC
	cmp r0, #0
	beq _0800A4B0
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_0800A798
	cmp r0, #0
	bne _0800A4B0
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #7
	bl SetTerrainAt
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #0x2a
	bl MakeTileSimple
_0800A4B0:
	cmp r6, #0
	ble _0800A512
	subs r5, r6, #1
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_08009B38
	cmp r0, #0
	beq _0800A4E6
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_08009B84
	adds r4, r0, #0
	cmp r4, #0
	ble _0800A512
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #2
	bl SetTerrainAt
	adds r0, r5, #0
	adds r1, r7, #0
	adds r2, r4, #0
	bl MakeTileSimple
	b _0800A512
_0800A4E6:
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_080094EC
	cmp r0, #0
	beq _0800A512
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_0800A798
	cmp r0, #0
	bne _0800A512
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #7
	bl SetTerrainAt
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #0x2a
	bl MakeTileSimple
_0800A512:
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0]
	subs r0, #1
	cmp r6, r0
	bge _0800A57E
	adds r5, r6, #1
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_08009B38
	cmp r0, #0
	beq _0800A552
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_08009B84
	adds r4, r0, #0
	cmp r4, #0
	ble _0800A57E
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #2
	bl SetTerrainAt
	adds r0, r5, #0
	adds r1, r7, #0
	adds r2, r4, #0
	bl MakeTileSimple
	b _0800A57E
_0800A552:
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_080094EC
	cmp r0, #0
	beq _0800A57E
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_0800A798
	cmp r0, #0
	bne _0800A57E
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #7
	bl SetTerrainAt
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #0x2a
	bl MakeTileSimple
_0800A57E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

