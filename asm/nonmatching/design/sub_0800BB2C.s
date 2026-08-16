	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800BB2C
sub_0800BB2C: @ 0x0800BB2C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r5, r1, #0
	movs r7, #0x2a
	cmp r5, #0
	ble _0800BB76
	subs r4, r5, #1
	adds r1, r4, #0
	bl sub_0800B4F0
	cmp r0, #0
	beq _0800BB76
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_0800B61C
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	bge _0800BB6E
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #7
	bl SetTerrainAt
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0x2a
	bl MakeTileSimple
	b _0800BB76
_0800BB6E:
	adds r0, r6, #0
	adds r1, r4, #0
	bl MakeTileSimple
_0800BB76:
	cmp r6, #0
	ble _0800BBB6
	subs r4, r6, #1
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800B4F0
	cmp r0, #0
	beq _0800BBB6
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800B61C
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	bge _0800BBAE
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #7
	bl SetTerrainAt
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl MakeTileSimple
	b _0800BBB6
_0800BBAE:
	adds r0, r4, #0
	adds r1, r5, #0
	bl MakeTileSimple
_0800BBB6:
	ldr r1, _0800BBFC @ =gUnknown_0808D860
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0]
	subs r0, #1
	mov r8, r1
	cmp r6, r0
	bge _0800BC08
	adds r4, r6, #1
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800B4F0
	cmp r0, #0
	beq _0800BC08
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800B61C
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	bge _0800BC00
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #7
	bl SetTerrainAt
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl MakeTileSimple
	b _0800BC08
	.align 2, 0
_0800BBFC: .4byte gUnknown_0808D860
_0800BC00:
	adds r0, r4, #0
	adds r1, r5, #0
	bl MakeTileSimple
_0800BC08:
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r5, r0
	bge _0800BC52
	adds r4, r5, #1
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_0800B4F0
	cmp r0, #0
	beq _0800BC52
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_0800B61C
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	bge _0800BC4A
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #7
	bl SetTerrainAt
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r7, #0
	bl MakeTileSimple
	b _0800BC52
_0800BC4A:
	adds r0, r6, #0
	adds r1, r4, #0
	bl MakeTileSimple
_0800BC52:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

