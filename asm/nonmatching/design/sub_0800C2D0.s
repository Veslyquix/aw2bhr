	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800C2D0
sub_0800C2D0: @ 0x0800C2D0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r7, r1, #0
	mov sb, r2
	ldr r4, _0800C3E0 @ =gUnknown_0808D874
	ldr r0, [r4]
	ldr r1, [r0]
	lsls r2, r7, #1
	ldr r3, _0800C3E4 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r6
	ldr r2, _0800C3E8 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r1, [r1]
	mov r8, r1
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_08007DD0
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	bge _0800C314
	mov r3, r8
	cmp r3, #7
	bne _0800C314
	movs r5, #0x2a
_0800C314:
	mov r0, r8
	cmp r0, #2
	beq _0800C332
	cmp r5, #0x2a
	bne _0800C328
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #7
	bl SetTerrainAt
_0800C328:
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl MakeTileSimple
_0800C332:
	mov r2, sb
	cmp r2, #0
	beq _0800C3C6
	ldr r4, [r4]
	mov sl, r4
	ldr r1, [r4]
	subs r3, r7, #1
	lsls r2, r3, #1
	ldr r4, _0800C3E4 @ =0x0000417A
	adds r0, r1, r4
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r6
	ldr r2, _0800C3E8 @ =0x00001432
	mov sb, r2
	add r1, sb
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #2
	bne _0800C362
	adds r0, r6, #0
	adds r1, r3, #0
	bl sub_08009F10
_0800C362:
	mov r3, sl
	ldr r1, [r3]
	adds r3, r7, #1
	lsls r2, r3, #1
	adds r0, r1, r4
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r6
	add r1, sb
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #2
	bne _0800C384
	adds r0, r6, #0
	adds r1, r3, #0
	bl sub_08009F10
_0800C384:
	mov r0, sl
	ldr r1, [r0]
	lsls r5, r7, #1
	adds r0, r1, r4
	adds r0, r0, r5
	ldrh r0, [r0]
	subs r0, #1
	adds r0, r0, r6
	add r1, sb
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #2
	bne _0800C3A6
	subs r0, r6, #1
	adds r1, r7, #0
	bl sub_08009F10
_0800C3A6:
	mov r2, sl
	ldr r1, [r2]
	adds r0, r1, r4
	adds r0, r0, r5
	ldrh r0, [r0]
	adds r0, #1
	adds r0, r0, r6
	add r1, sb
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #2
	bne _0800C3C6
	adds r0, r6, #1
	adds r1, r7, #0
	bl sub_08009F10
_0800C3C6:
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_0800ABD0
	mov r3, r8
	cmp r3, #1
	bne _0800C3EC
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #1
	bl sub_08007F14
	b _0800C446
	.align 2, 0
_0800C3E0: .4byte gUnknown_0808D874
_0800C3E4: .4byte 0x0000417A
_0800C3E8: .4byte 0x00001432
_0800C3EC:
	mov r0, r8
	cmp r0, #5
	bne _0800C41C
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_0800F418
	adds r5, r0, #0
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl MakeTileSimple
	adds r0, r6, #0
	adds r1, r7, #0
	bl GetTileWithShadow_unkMapA22
	adds r5, r0, #0
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl MakeTileSimple
	b _0800C446
_0800C41C:
	mov r2, r8
	cmp r2, #3
	bne _0800C42C
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_0800B048
	b _0800C446
_0800C42C:
	mov r3, r8
	cmp r3, #4
	bne _0800C446
	adds r0, r6, #0
	adds r1, r7, #0
	bl GetTileWithShadow_unkMapA22
	adds r5, r0, #0
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl MakeTileSimple
_0800C446:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

