	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800ABD0
sub_0800ABD0: @ 0x0800ABD0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r0, _0800AEA8 @ =gUnknown_0808D858
	mov r8, r0
	cmp r7, #0
	bgt _0800ABE4
	b _0800ACE4
_0800ABE4:
	subs r4, r7, #1
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_080094EC
	adds r5, r4, #0
	cmp r0, #0
	beq _0800AC34
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_0800A798
	cmp r0, #0
	blt _0800AC18
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_08009BF4
	cmp r0, #0
	beq _0800AC18
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_08009538
	cmp r0, #0
	bne _0800AC34
_0800AC18:
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #7
	bl SetTerrainAt
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #0x2a
	bl MakeTileSimple
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_0800A3D4
_0800AC34:
	cmp r6, #0
	ble _0800AC86
	subs r4, r6, #1
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080094EC
	cmp r0, #0
	beq _0800AC86
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800A798
	cmp r0, #0
	ble _0800AC6A
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08009BF4
	cmp r0, #0
	beq _0800AC6A
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08009538
	cmp r0, #0
	bne _0800AC86
_0800AC6A:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #7
	bl SetTerrainAt
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x2a
	bl MakeTileSimple
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800A3D4
_0800AC86:
	ldr r1, _0800AEA8 @ =gUnknown_0808D858
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0]
	subs r0, #1
	mov r8, r1
	cmp r6, r0
	bge _0800ACE4
	adds r4, r6, #1
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080094EC
	cmp r0, #0
	beq _0800ACE4
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800A798
	cmp r0, #0
	ble _0800ACC8
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08009BF4
	cmp r0, #0
	beq _0800ACC8
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08009538
	cmp r0, #0
	bne _0800ACE4
_0800ACC8:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #7
	bl SetTerrainAt
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x2a
	bl MakeTileSimple
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800A3D4
_0800ACE4:
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r7, r0
	bge _0800ADF0
	adds r4, r7, #1
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_080094EC
	adds r5, r4, #0
	cmp r0, #0
	beq _0800AD42
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_0800A798
	cmp r0, #0
	blt _0800AD26
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_08009BF4
	cmp r0, #0
	beq _0800AD26
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_08009538
	cmp r0, #0
	bne _0800AD42
_0800AD26:
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #7
	bl SetTerrainAt
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #0x2a
	bl MakeTileSimple
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_0800A3D4
_0800AD42:
	cmp r6, #0
	ble _0800AD94
	subs r4, r6, #1
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080094EC
	cmp r0, #0
	beq _0800AD94
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800A798
	cmp r0, #0
	ble _0800AD78
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08009BF4
	cmp r0, #0
	beq _0800AD78
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08009538
	cmp r0, #0
	bne _0800AD94
_0800AD78:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #7
	bl SetTerrainAt
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x2a
	bl MakeTileSimple
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800A3D4
_0800AD94:
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0]
	subs r0, #1
	cmp r6, r0
	bge _0800ADF0
	adds r4, r6, #1
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080094EC
	cmp r0, #0
	beq _0800ADF0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800A798
	cmp r0, #0
	ble _0800ADD4
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08009BF4
	cmp r0, #0
	beq _0800ADD4
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08009538
	cmp r0, #0
	bne _0800ADF0
_0800ADD4:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #7
	bl SetTerrainAt
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x2a
	bl MakeTileSimple
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800A3D4
_0800ADF0:
	cmp r6, #0
	ble _0800AE42
	subs r4, r6, #1
	adds r0, r4, #0
	adds r1, r7, #0
	bl sub_080094EC
	cmp r0, #0
	beq _0800AE42
	adds r0, r4, #0
	adds r1, r7, #0
	bl sub_0800A798
	cmp r0, #0
	blt _0800AE26
	adds r0, r4, #0
	adds r1, r7, #0
	bl sub_08009BF4
	cmp r0, #0
	beq _0800AE26
	adds r0, r4, #0
	adds r1, r7, #0
	bl sub_08009538
	cmp r0, #0
	bne _0800AE42
_0800AE26:
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #7
	bl SetTerrainAt
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0x2a
	bl MakeTileSimple
	adds r0, r4, #0
	adds r1, r7, #0
	bl sub_0800A3D4
_0800AE42:
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0]
	subs r0, #1
	cmp r6, r0
	bge _0800AE9E
	adds r4, r6, #1
	adds r0, r4, #0
	adds r1, r7, #0
	bl sub_080094EC
	cmp r0, #0
	beq _0800AE9E
	adds r0, r4, #0
	adds r1, r7, #0
	bl sub_0800A798
	cmp r0, #0
	blt _0800AE82
	adds r0, r4, #0
	adds r1, r7, #0
	bl sub_08009BF4
	cmp r0, #0
	beq _0800AE82
	adds r0, r4, #0
	adds r1, r7, #0
	bl sub_08009538
	cmp r0, #0
	bne _0800AE9E
_0800AE82:
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #7
	bl SetTerrainAt
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0x2a
	bl MakeTileSimple
	adds r0, r4, #0
	adds r1, r7, #0
	bl sub_0800A3D4
_0800AE9E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800AEA8: .4byte gUnknown_0808D858

