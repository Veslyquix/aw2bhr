	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800E8CC
sub_0800E8CC: @ 0x0800E8CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r6, #0
	ldr r0, _0800E9E8 @ =gUnknown_0808D890
	mov sl, r0
	cmp r4, #2
	ble _0800E90E
	ldr r0, [r0]
	ldr r1, [r0]
	subs r3, r4, #2
	lsls r2, r3, #1
	ldr r7, _0800E9EC @ =0x0000417A
	adds r0, r1, r7
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r5
	ldr r2, _0800E9F0 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #4
	bne _0800E90E
	adds r0, r5, #0
	adds r1, r3, #0
	movs r2, #4
	bl IsTerrainAtCoordsType
	lsls r6, r0, #4
_0800E90E:
	cmp r4, #1
	ble _0800E940
	mov r3, sl
	ldr r0, [r3]
	ldr r1, [r0]
	subs r3, r4, #1
	lsls r2, r3, #1
	ldr r7, _0800E9EC @ =0x0000417A
	adds r0, r1, r7
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r5
	ldr r2, _0800E9F0 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #4
	bne _0800E940
	adds r0, r5, #0
	adds r1, r3, #0
	movs r2, #4
	bl IsTerrainAtCoordsType
	lsls r0, r0, #3
	orrs r6, r0
_0800E940:
	mov r3, sl
	ldr r7, [r3]
	ldr r1, [r7]
	lsls r2, r4, #1
	ldr r0, _0800E9EC @ =0x0000417A
	mov sb, r0
	adds r0, r1, r0
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r5
	ldr r2, _0800E9F0 @ =0x00001432
	mov r8, r2
	add r1, r8
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #4
	bne _0800E970
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #4
	bl IsTerrainAtCoordsType
	lsls r0, r0, #2
	orrs r6, r0
_0800E970:
	ldr r2, [r7]
	ldrh r0, [r2, #2]
	subs r0, #1
	cmp r4, r0
	bge _0800E9A2
	adds r3, r4, #1
	lsls r1, r3, #1
	mov r7, sb
	adds r0, r2, r7
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, r1, r5
	mov r7, r8
	adds r0, r2, r7
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #4
	bne _0800E9A2
	adds r0, r5, #0
	adds r1, r3, #0
	movs r2, #4
	bl IsTerrainAtCoordsType
	lsls r0, r0, #1
	orrs r6, r0
_0800E9A2:
	mov r1, sl
	ldr r0, [r1]
	ldr r3, [r0]
	ldrh r0, [r3, #2]
	subs r0, #2
	cmp r4, r0
	bge _0800E9D6
	adds r2, r4, #2
	lsls r1, r2, #1
	ldr r4, _0800E9EC @ =0x0000417A
	adds r0, r3, r4
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, r1, r5
	ldr r7, _0800E9F0 @ =0x00001432
	adds r0, r3, r7
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #4
	bne _0800E9D6
	adds r0, r5, #0
	adds r1, r2, #0
	movs r2, #4
	bl IsTerrainAtCoordsType
	orrs r6, r0
_0800E9D6:
	adds r0, r6, #0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800E9E8: .4byte gUnknown_0808D890
_0800E9EC: .4byte 0x0000417A
_0800E9F0: .4byte 0x00001432

