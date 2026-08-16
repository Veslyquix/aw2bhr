	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800977C
sub_0800977C: @ 0x0800977C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r7, #0
	ldr r2, _08009858 @ =gUnknown_0808D81C
	ldr r0, [r2]
	mov r8, r0
	ldr r1, [r0]
	lsls r6, r5, #1
	ldr r3, _0800985C @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r6
	ldrh r0, [r0]
	adds r0, r0, r4
	ldr r3, _08009860 @ =0x00001432
	adds r1, r1, r3
	adds r1, r1, r0
	ldrb r1, [r1]
	mov sl, r1
	mov sb, r2
	cmp r1, #0xc
	beq _080097B2
	b _080098F2
_080097B2:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08009BF4
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r7, r1, #0x1f
	mov r0, r8
	ldr r1, [r0]
	ldr r2, _0800985C @ =0x0000417A
	adds r0, r1, r2
	adds r0, r0, r6
	ldrh r0, [r0]
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r3, _08009864 @ =0x00000A22
	adds r1, r1, r3
	adds r1, r1, r0
	ldrh r1, [r1]
	cmp r1, #0x16
	beq _080097E0
	cmp r1, #0x36
	bne _08009868
_080097E0:
	cmp r4, #0
	ble _080097F2
	subs r0, r4, #1
	adds r1, r5, #0
	bl sub_08009720
	cmp r0, #0
	beq _080097F2
	movs r7, #0
_080097F2:
	mov r6, sb
	ldr r0, [r6]
	ldr r0, [r0]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _0800980E
	adds r0, r4, #1
	adds r1, r5, #0
	bl sub_08009720
	cmp r0, #0
	beq _0800980E
	movs r7, #0
_0800980E:
	cmp r7, #0
	beq _080098F2
	movs r3, #0
	cmp r4, #0
	ble _0800983A
	mov r1, sb
	ldr r0, [r1]
	ldr r1, [r0]
	lsls r2, r5, #1
	ldr r6, _0800985C @ =0x0000417A
	adds r0, r1, r6
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r0, #1
	adds r0, r0, r4
	ldr r2, _08009860 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0xc
	bne _0800983A
	movs r3, #1
_0800983A:
	mov r6, sb
	ldr r0, [r6]
	ldr r2, [r0]
	ldrh r0, [r2]
	subs r0, #1
	cmp r4, r0
	bge _080098EC
	lsls r1, r5, #1
	ldr r5, _0800985C @ =0x0000417A
	adds r0, r2, r5
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, #1
	b _080098DC
	.align 2, 0
_08009858: .4byte gUnknown_0808D81C
_0800985C: .4byte 0x0000417A
_08009860: .4byte 0x00001432
_08009864: .4byte 0x00000A22
_08009868:
	cmp r5, #0
	ble _0800987A
	subs r1, r5, #1
	adds r0, r4, #0
	bl sub_08009720
	cmp r0, #0
	beq _0800987A
	movs r7, #0
_0800987A:
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r5, r0
	bge _08009896
	adds r1, r5, #1
	adds r0, r4, #0
	bl sub_08009720
	cmp r0, #0
	beq _08009896
	movs r7, #0
_08009896:
	cmp r7, #0
	beq _080098F2
	movs r3, #0
	cmp r5, #0
	ble _080098C2
	mov r2, sb
	ldr r0, [r2]
	ldr r2, [r0]
	subs r1, r5, #1
	lsls r1, r1, #1
	ldr r6, _08009910 @ =0x0000417A
	adds r0, r2, r6
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, r0, r4
	ldr r1, _08009914 @ =0x00001432
	adds r2, r2, r1
	adds r2, r2, r0
	ldrb r0, [r2]
	cmp r0, #0xc
	bne _080098C2
	movs r3, #1
_080098C2:
	mov r2, sb
	ldr r0, [r2]
	ldr r2, [r0]
	ldrh r0, [r2, #2]
	subs r0, #1
	cmp r5, r0
	bge _080098EC
	adds r1, r5, #1
	lsls r1, r1, #1
	ldr r5, _08009910 @ =0x0000417A
	adds r0, r2, r5
	adds r0, r0, r1
	ldrh r1, [r0]
_080098DC:
	adds r1, r1, r4
	ldr r6, _08009914 @ =0x00001432
	adds r0, r2, r6
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xc
	bne _080098EC
	adds r3, #1
_080098EC:
	cmp r3, #1
	ble _080098F2
	movs r7, #0
_080098F2:
	movs r0, #0
	mov r1, sl
	cmp r1, #2
	beq _080098FE
	cmp r7, #0
	beq _08009900
_080098FE:
	movs r0, #1
_08009900:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08009910: .4byte 0x0000417A
_08009914: .4byte 0x00001432

