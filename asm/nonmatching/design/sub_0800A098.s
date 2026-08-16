	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800A098
sub_0800A098: @ 0x0800A098
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r2, _0800A2D4 @ =gUnknown_0808D834
	ldr r0, [r2]
	mov r8, r0
	ldr r1, [r0]
	lsls r7, r5, #1
	ldr r3, _0800A2D8 @ =0x0000417A
	mov sb, r3
	adds r0, r1, r3
	adds r0, r0, r7
	ldrh r0, [r0]
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r3, _0800A2DC @ =0x00000A22
	mov sl, r3
	add r1, sl
	adds r1, r1, r0
	ldrh r1, [r1]
	str r1, [sp]
	cmp r1, #0x39
	bne _0800A1C6
	cmp r4, #0
	ble _0800A146
	subs r6, r4, #1
	adds r0, r6, #0
	adds r1, r5, #0
	bl IsTerrainWater
	cmp r0, #0
	bne _0800A146
	mov r0, r8
	ldr r1, [r0]
	mov r2, sb
	adds r0, r1, r2
	adds r0, r0, r7
	ldrh r0, [r0]
	adds r0, r0, r4
	lsls r0, r0, #1
	add r1, sl
	adds r1, r1, r0
	ldrh r0, [r1]
	cmp r0, #0x39
	bne _0800A146
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #0
	bl sub_0800AA30
	cmp r0, #0
	bne _0800A146
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #2
	bl SetTerrainAt
	ldr r2, _0800A2E0 @ =0x0000011D
	adds r0, r6, #0
	adds r1, r5, #0
	bl MakeTileSimple
	mov r3, r8
	ldr r1, [r3]
	subs r3, r5, #1
	lsls r2, r3, #1
	mov r7, sb
	adds r0, r1, r7
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r0, #1
	adds r0, r0, r4
	ldr r2, _0800A2E4 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0xd
	bne _0800A146
	adds r0, r6, #0
	adds r1, r3, #0
	bl sub_0800BA9C
_0800A146:
	ldr r7, _0800A2E8 @ =gUnknown_08499590
	ldr r0, [r7]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _0800A1C6
	adds r6, r4, #1
	adds r0, r6, #0
	adds r1, r5, #0
	bl IsTerrainWater
	cmp r0, #0
	bne _0800A1C6
	ldr r1, [r7]
	lsls r2, r5, #1
	ldr r3, _0800A2D8 @ =0x0000417A
	mov r8, r3
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r2, _0800A2DC @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r0, [r1]
	cmp r0, #0x39
	bne _0800A1C6
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #1
	bl sub_0800AA30
	cmp r0, #0
	bne _0800A1C6
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #2
	bl SetTerrainAt
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #0xfd
	bl MakeTileSimple
	ldr r1, [r7]
	subs r3, r5, #1
	lsls r2, r3, #1
	mov r7, r8
	adds r0, r1, r7
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, #1
	adds r0, r0, r4
	ldr r2, _0800A2E4 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0xd
	bne _0800A1C6
	adds r0, r6, #0
	adds r1, r3, #0
	bl sub_0800BA9C
_0800A1C6:
	ldr r3, [sp]
	cmp r3, #0x18
	bne _0800A2C2
	cmp r5, #0
	ble _0800A246
	subs r6, r5, #1
	adds r0, r4, #0
	adds r1, r6, #0
	bl IsTerrainWater
	cmp r0, #0
	bne _0800A246
	ldr r7, _0800A2E8 @ =gUnknown_08499590
	mov r8, r7
	mov r0, r8
	ldr r1, [r0]
	lsls r2, r5, #1
	ldr r7, _0800A2D8 @ =0x0000417A
	adds r0, r1, r7
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r2, _0800A2DC @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r0, [r1]
	cmp r0, #0x18
	bne _0800A246
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #2
	bl sub_0800AA30
	cmp r0, #0
	bne _0800A246
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #2
	bl SetTerrainAt
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0xfc
	bl MakeTileSimple
	mov r3, r8
	ldr r1, [r3]
	lsls r2, r6, #1
	adds r0, r1, r7
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r0, #1
	adds r0, r0, r4
	ldr r7, _0800A2E4 @ =0x00001432
	adds r1, r1, r7
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0xd
	bne _0800A246
	subs r0, r4, #1
	adds r1, r6, #0
	bl sub_0800BA9C
_0800A246:
	ldr r7, _0800A2E8 @ =gUnknown_08499590
	ldr r0, [r7]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r5, r0
	bge _0800A2C2
	adds r6, r5, #1
	adds r0, r4, #0
	adds r1, r6, #0
	bl IsTerrainWater
	cmp r0, #0
	bne _0800A2C2
	ldr r1, [r7]
	lsls r2, r5, #1
	ldr r5, _0800A2D8 @ =0x0000417A
	adds r0, r1, r5
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r2, _0800A2DC @ =0x00000A22
	adds r1, r1, r2
	adds r1, r1, r0
	ldrh r0, [r1]
	cmp r0, #0x18
	bne _0800A2C2
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #4
	bl sub_0800AA30
	cmp r0, #0
	bne _0800A2C2
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #2
	bl SetTerrainAt
	movs r2, #0x8e
	lsls r2, r2, #1
	adds r0, r4, #0
	adds r1, r6, #0
	bl MakeTileSimple
	ldr r1, [r7]
	lsls r2, r6, #1
	adds r0, r1, r5
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r0, #1
	adds r0, r0, r4
	ldr r3, _0800A2E4 @ =0x00001432
	adds r1, r1, r3
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0xd
	bne _0800A2C2
	subs r0, r4, #1
	adds r1, r6, #0
	bl sub_0800BA9C
_0800A2C2:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800A2D4: .4byte gUnknown_0808D834
_0800A2D8: .4byte 0x0000417A
_0800A2DC: .4byte 0x00000A22
_0800A2E0: .4byte 0x0000011D
_0800A2E4: .4byte 0x00001432
_0800A2E8: .4byte gUnknown_08499590

