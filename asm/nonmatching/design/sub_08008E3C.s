	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08008E3C
sub_08008E3C: @ 0x08008E3C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_08008CB8
	cmp r0, #0
	beq _08008E52
	b _08008F56
_08008E52:
	ldr r3, _08008EE4 @ =gUnknown_0808D80C
	ldr r0, [r3]
	ldr r1, [r0]
	lsls r2, r5, #1
	ldr r0, _08008EE8 @ =0x0000417A
	adds r0, r0, r1
	mov ip, r0
	adds r0, r0, r2
	ldrh r6, [r0]
	adds r0, r6, r4
	lsls r0, r0, #1
	ldr r7, _08008EEC @ =0x00000A22
	adds r1, r1, r7
	adds r0, r1, r0
	ldrh r0, [r0]
	mov sb, r3
	mov r8, r2
	cmp r0, #0x13
	bne _08008EF0
	cmp r5, #0
	ble _08008EA4
	subs r6, r5, #1
	lsls r0, r6, #1
	add r0, ip
	ldrh r0, [r0]
	adds r0, r0, r4
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	cmp r0, #0x13
	bne _08008EA4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x16
	bl MakeTileSimple
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0x16
	bl MakeTileSimple
_08008EA4:
	mov r1, sb
	ldr r0, [r1]
	ldr r3, [r0]
	ldrh r0, [r3, #2]
	subs r0, #1
	cmp r5, r0
	bge _08008F56
	adds r6, r5, #1
	lsls r1, r6, #1
	ldr r2, _08008EE8 @ =0x0000417A
	adds r0, r3, r2
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, r1, r4
	lsls r1, r1, #1
	ldr r7, _08008EEC @ =0x00000A22
	adds r0, r3, r7
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0x13
	bne _08008F56
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x16
	bl MakeTileSimple
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0x16
	bl MakeTileSimple
	b _08008F56
	.align 2, 0
_08008EE4: .4byte gUnknown_0808D80C
_08008EE8: .4byte 0x0000417A
_08008EEC: .4byte 0x00000A22
_08008EF0:
	cmp r0, #0x16
	bne _08008F56
	cmp r4, #0
	ble _08008F1A
	subs r0, r6, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	cmp r0, #0x16
	bne _08008F1A
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x13
	bl MakeTileSimple
	subs r0, r4, #1
	adds r1, r5, #0
	movs r2, #0x13
	bl MakeTileSimple
_08008F1A:
	mov r1, sb
	ldr r0, [r1]
	ldr r1, [r0]
	ldrh r0, [r1]
	subs r0, #1
	cmp r4, r0
	bge _08008F56
	ldr r2, _08008F64 @ =0x0000417A
	adds r0, r1, r2
	add r0, r8
	ldrh r0, [r0]
	adds r0, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r6, _08008F68 @ =0x00000A22
	adds r1, r1, r6
	adds r1, r1, r0
	ldrh r0, [r1]
	cmp r0, #0x16
	bne _08008F56
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x13
	bl MakeTileSimple
	adds r0, r4, #1
	adds r1, r5, #0
	movs r2, #0x13
	bl MakeTileSimple
_08008F56:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08008F64: .4byte 0x0000417A
_08008F68: .4byte 0x00000A22

