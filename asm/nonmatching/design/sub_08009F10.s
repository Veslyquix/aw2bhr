	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08009F10
sub_08009F10: @ 0x08009F10
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r1, #0
	bl sub_0800A6AC
	adds r4, r0, #0
	cmp r4, #0
	bge _08009F28
_08009F24:
	movs r0, #0
	b _0800A080
_08009F28:
	cmp r4, #0
	beq _08009F9E
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800A95C
	adds r7, r0, #0
	cmp r7, #0
	beq _08009FCC
	cmp r7, #0
	ble _08009F24
	movs r0, #0xfe
	lsls r0, r0, #8
	mov r8, r0
	mov r2, r8
	ands r2, r4
	mov r8, r2
	movs r0, #0x80
	lsls r0, r0, #7
	cmp r8, r0
	bne _08009F66
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
	bl SetTerrainAt
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl MakeTileSimple
_08009F66:
	movs r0, #0x80
	lsls r0, r0, #6
	cmp r8, r0
	bne _08009F82
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
	bl SetTerrainAt
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl MakeTileSimple
_08009F82:
	mov r3, r8
	cmp r3, #0
	bne _08009FE0
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
	bl SetTerrainAt
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl MakeTileSimple
	b _08009FE0
_08009F9E:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800A6AC
	cmp r0, #0
	blt _08009F24
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800A884
	adds r4, r0, #0
	cmp r4, #0
	beq _08009F24
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800A95C
	adds r7, r0, #0
	cmp r7, #0
	beq _08009FC8
	adds r4, r7, #0
_08009FC8:
	cmp r4, #0
	ble _08009F24
_08009FCC:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
	bl SetTerrainAt
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl MakeTileSimple
_08009FE0:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800A588
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08009BF4
	cmp r0, #0
	beq _08009FFC
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800A098
_08009FFC:
	ldr r7, _0800A08C @ =gUnknown_0808D830
	cmp r6, #0
	ble _0800A048
	subs r4, r6, #1
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	bl IsTerrainAtCoordsType
	cmp r0, #0
	beq _0800A048
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	bl MakeTileSimple
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08007D70
	ldr r0, [r7]
	ldr r1, [r0]
	lsls r2, r6, #1
	ldr r3, _0800A090 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r5
	ldr r2, _0800A094 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #3
	bne _0800A048
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800AF74
_0800A048:
	ldr r0, [r7]
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r6, r0
	bge _0800A06E
	adds r4, r6, #1
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	bl IsTerrainAtCoordsType
	cmp r0, #0
	beq _0800A06E
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	bl sub_08007F14
_0800A06E:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08007F9C
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0800EC20
	movs r0, #1
_0800A080:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800A08C: .4byte gUnknown_0808D830
_0800A090: .4byte 0x0000417A
_0800A094: .4byte 0x00001432

