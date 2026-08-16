	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08009918
sub_08009918: @ 0x08009918
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r7, #0
	ldr r2, _08009A28 @ =gUnknown_0808D820
	ldr r0, [r2]
	mov r8, r0
	ldr r1, [r0]
	lsls r6, r5, #1
	ldr r3, _08009A2C @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r6
	ldrh r0, [r0]
	adds r0, r0, r4
	ldr r3, _08009A30 @ =0x00001432
	adds r1, r1, r3
	adds r1, r1, r0
	ldrb r1, [r1]
	mov sl, r1
	mov sb, r2
	cmp r1, #0xc
	beq _0800994E
	b _08009B0E
_0800994E:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08009CF8
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r7, r1, #0x1f
	mov r0, r8
	ldr r1, [r0]
	ldr r2, _08009A2C @ =0x0000417A
	adds r0, r1, r2
	adds r0, r0, r6
	ldrh r0, [r0]
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r3, _08009A34 @ =0x00000A22
	adds r1, r1, r3
	adds r1, r1, r0
	ldrh r1, [r1]
	cmp r1, #0x16
	beq _0800997C
	cmp r1, #0x36
	bne _08009A38
_0800997C:
	cmp r4, #0
	ble _0800998E
	subs r0, r4, #1
	adds r1, r5, #0
	bl sub_08009720
	cmp r0, #0
	beq _0800998E
	movs r7, #0
_0800998E:
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _080099AA
	adds r0, r4, #1
	adds r1, r5, #0
	bl sub_08009720
	cmp r0, #0
	beq _080099AA
	movs r7, #0
_080099AA:
	cmp r7, #0
	bne _080099B0
	b _08009B0E
_080099B0:
	movs r6, #0
	cmp r4, #0
	ble _080099EA
	mov r2, sb
	ldr r0, [r2]
	ldr r2, [r0]
	lsls r1, r5, #1
	ldr r3, _08009A2C @ =0x0000417A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, #1
	adds r1, r0, r4
	ldr r3, _08009A30 @ =0x00001432
	adds r0, r2, r3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xc
	bne _080099EA
	lsls r1, r1, #1
	ldr r3, _08009A34 @ =0x00000A22
	adds r0, r2, r3
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0x16
	beq _080099E8
	cmp r0, #0x36
	bne _080099EA
_080099E8:
	movs r6, #1
_080099EA:
	mov r1, sb
	ldr r0, [r1]
	ldr r2, [r0]
	ldrh r0, [r2]
	subs r0, #1
	cmp r4, r0
	blt _080099FA
	b _08009B08
_080099FA:
	lsls r1, r5, #1
	ldr r3, _08009A2C @ =0x0000417A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, #1
	adds r1, r0, r4
	ldr r3, _08009A30 @ =0x00001432
	adds r0, r2, r3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xc
	bne _08009B08
	lsls r1, r1, #1
	ldr r3, _08009A34 @ =0x00000A22
	adds r0, r2, r3
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0x16
	beq _08009B06
	cmp r0, #0x36
	bne _08009B08
	b _08009B06
	.align 2, 0
_08009A28: .4byte gUnknown_0808D820
_08009A2C: .4byte 0x0000417A
_08009A30: .4byte 0x00001432
_08009A34: .4byte 0x00000A22
_08009A38:
	cmp r5, #0
	ble _08009A4A
	subs r1, r5, #1
	adds r0, r4, #0
	bl sub_08009720
	cmp r0, #0
	beq _08009A4A
	movs r7, #0
_08009A4A:
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r5, r0
	bge _08009A66
	adds r1, r5, #1
	adds r0, r4, #0
	bl sub_08009720
	cmp r0, #0
	beq _08009A66
	movs r7, #0
_08009A66:
	cmp r7, #0
	beq _08009B0E
	movs r6, #0
	cmp r5, #0
	ble _08009AB8
	mov r2, sb
	ldr r0, [r2]
	ldr r1, [r0]
	subs r0, r5, #1
	lsls r0, r0, #1
	ldr r2, _08009B2C @ =0x0000417A
	adds r3, r1, r2
	adds r0, r3, r0
	ldrh r0, [r0]
	adds r2, r0, r4
	ldr r0, _08009B30 @ =0x00001432
	adds r0, r0, r1
	mov r8, r0
	add r8, r2
	mov r0, r8
	ldrb r0, [r0]
	cmp r0, #0xc
	bne _08009AB8
	lsls r0, r2, #1
	ldr r2, _08009B34 @ =0x00000A22
	adds r1, r1, r2
	adds r0, r1, r0
	ldrh r0, [r0]
	cmp r0, #0x13
	beq _08009AB6
	adds r0, r5, #1
	lsls r0, r0, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	adds r0, r0, r4
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	cmp r0, #0x14
	bne _08009AB8
_08009AB6:
	movs r6, #1
_08009AB8:
	mov r3, sb
	ldr r0, [r3]
	ldr r2, [r0]
	ldrh r0, [r2, #2]
	subs r0, #1
	cmp r5, r0
	bge _08009B08
	adds r0, r5, #1
	lsls r0, r0, #1
	ldr r3, _08009B2C @ =0x0000417A
	adds r1, r2, r3
	adds r0, r1, r0
	ldrh r0, [r0]
	adds r3, r0, r4
	ldr r0, _08009B30 @ =0x00001432
	adds r0, r0, r2
	mov r8, r0
	add r8, r3
	mov r0, r8
	ldrb r0, [r0]
	cmp r0, #0xc
	bne _08009B08
	subs r0, r5, #1
	lsls r0, r0, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r1, _08009B34 @ =0x00000A22
	adds r2, r2, r1
	adds r0, r2, r0
	ldrh r0, [r0]
	cmp r0, #0x13
	beq _08009B06
	lsls r0, r3, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	cmp r0, #0x14
	bne _08009B08
_08009B06:
	adds r6, #1
_08009B08:
	cmp r6, #1
	ble _08009B0E
	movs r7, #0
_08009B0E:
	movs r0, #0
	mov r2, sl
	cmp r2, #2
	beq _08009B1A
	cmp r7, #0
	beq _08009B1C
_08009B1A:
	movs r0, #1
_08009B1C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08009B2C: .4byte 0x0000417A
_08009B30: .4byte 0x00001432
_08009B34: .4byte 0x00000A22

