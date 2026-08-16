	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08009538
sub_08009538: @ 0x08009538
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r7, #0
	ldr r2, _08009574 @ =gUnknown_0808D818
	ldr r0, [r2]
	ldr r3, [r0]
	lsls r1, r6, #1
	ldr r4, _08009578 @ =0x0000417A
	adds r0, r3, r4
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, r1, r5
	lsls r1, r1, #1
	ldr r4, _0800957C @ =0x00000A22
	adds r0, r3, r4
	adds r0, r0, r1
	ldrh r1, [r0]
	mov sb, r2
	cmp r1, #0xfd
	beq _080095FE
	cmp r1, #0xfd
	bgt _08009580
	cmp r1, #0xfc
	beq _08009592
	b _0800970A
	.align 2, 0
_08009574: .4byte gUnknown_0808D818
_08009578: .4byte 0x0000417A
_0800957C: .4byte 0x00000A22
_08009580:
	movs r0, #0x8e
	lsls r0, r0, #1
	cmp r1, r0
	beq _0800963E
	adds r0, #1
	cmp r1, r0
	bne _08009590
	b _080096A2
_08009590:
	b _0800970A
_08009592:
	cmp r6, #0
	bgt _08009598
	b _0800970A
_08009598:
	subs r4, r6, #1
	adds r0, r5, #0
	adds r1, r4, #0
	bl IsTerrainLand
	mov r8, r4
	cmp r0, #0
	beq _080095AA
	movs r7, #1
_080095AA:
	cmp r7, #0
	beq _080095B0
	b _0800970A
_080095B0:
	cmp r5, #0
	ble _080095D2
	subs r4, r5, #1
	adds r0, r4, #0
	mov r1, r8
	bl IsTerrainLand
	cmp r0, #0
	beq _080095C4
	b _08009708
_080095C4:
	adds r0, r4, #0
	adds r1, r6, #0
	bl IsTerrainLand
	cmp r0, #0
	beq _080095D2
	movs r7, #1
_080095D2:
	cmp r7, #0
	beq _080095D8
	b _0800970A
_080095D8:
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0]
	subs r0, #1
	cmp r5, r0
	blt _080095E8
	b _0800970A
_080095E8:
	adds r4, r5, #1
	adds r0, r4, #0
	mov r1, r8
	bl IsTerrainLand
	cmp r0, #0
	beq _080095F8
	b _08009708
_080095F8:
	adds r0, r4, #0
	adds r1, r6, #0
	b _08009700
_080095FE:
	ldrh r0, [r3]
	subs r0, #1
	cmp r5, r0
	blt _08009608
	b _0800970A
_08009608:
	adds r4, r5, #1
	adds r0, r4, #0
	adds r1, r6, #0
	bl IsTerrainLand
	mov r8, r4
	cmp r0, #0
	beq _0800961A
	movs r7, #1
_0800961A:
	cmp r7, #0
	bne _0800970A
	cmp r6, #0
	ble _080096DC
	subs r4, r6, #1
	mov r0, r8
	adds r1, r4, #0
	bl IsTerrainLand
	cmp r0, #0
	bne _08009708
	adds r0, r5, #0
	adds r1, r4, #0
	bl IsTerrainLand
	cmp r0, #0
	beq _080096DC
	b _08009708
_0800963E:
	ldrh r0, [r3, #2]
	subs r0, #1
	cmp r6, r0
	bge _0800970A
	adds r4, r6, #1
	adds r0, r5, #0
	adds r1, r4, #0
	bl IsTerrainLand
	mov r8, r4
	cmp r0, #0
	beq _08009658
	movs r7, #1
_08009658:
	cmp r7, #0
	bne _0800970A
	cmp r5, #0
	ble _0800967C
	subs r4, r5, #1
	adds r0, r4, #0
	mov r1, r8
	bl IsTerrainLand
	cmp r0, #0
	bne _08009708
	adds r0, r4, #0
	adds r1, r6, #0
	bl IsTerrainLand
	cmp r0, #0
	beq _0800967C
	movs r7, #1
_0800967C:
	cmp r7, #0
	bne _0800970A
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0]
	subs r0, #1
	cmp r5, r0
	bge _0800970A
	adds r4, r5, #1
	adds r0, r4, #0
	mov r1, r8
	bl IsTerrainLand
	cmp r0, #0
	bne _08009708
	adds r0, r4, #0
	adds r1, r6, #0
	b _08009700
_080096A2:
	cmp r5, #0
	ble _0800970A
	subs r4, r5, #1
	adds r0, r4, #0
	adds r1, r6, #0
	bl IsTerrainLand
	mov r8, r4
	cmp r0, #0
	beq _080096B8
	movs r7, #1
_080096B8:
	cmp r7, #0
	bne _0800970A
	cmp r6, #0
	ble _080096DC
	subs r4, r6, #1
	mov r0, r8
	adds r1, r4, #0
	bl IsTerrainLand
	cmp r0, #0
	bne _08009708
	adds r0, r5, #0
	adds r1, r4, #0
	bl IsTerrainLand
	cmp r0, #0
	beq _080096DC
	movs r7, #1
_080096DC:
	cmp r7, #0
	bne _0800970A
	mov r4, sb
	ldr r0, [r4]
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r6, r0
	bge _0800970A
	adds r4, r6, #1
	mov r0, r8
	adds r1, r4, #0
	bl IsTerrainLand
	cmp r0, #0
	bne _08009708
	adds r0, r5, #0
	adds r1, r4, #0
_08009700:
	bl IsTerrainLand
	cmp r0, #0
	beq _0800970A
_08009708:
	movs r7, #1
_0800970A:
	movs r0, #0
	cmp r7, #0
	bne _08009712
	movs r0, #1
_08009712:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

