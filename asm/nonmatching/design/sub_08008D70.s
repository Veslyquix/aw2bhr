	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08008D70
sub_08008D70: @ 0x08008D70
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	ldr r1, _08008DCC @ =gUnknown_0808D808
	ldr r0, [r1]
	ldr r2, [r0]
	ldrh r0, [r2, #2]
	subs r0, #1
	adds r5, r1, #0
	cmp r3, r0
	bge _08008DA2
	adds r1, r3, #1
	lsls r1, r1, #1
	ldr r6, _08008DD0 @ =0x0000417A
	adds r0, r2, r6
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, r1, r4
	lsls r1, r1, #1
	ldr r6, _08008DD4 @ =0x00000A22
	adds r0, r2, r6
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0x36
	beq _08008DC6
_08008DA2:
	cmp r3, #0
	ble _08008DD8
	ldr r0, [r5]
	ldr r2, [r0]
	subs r1, r3, #1
	lsls r1, r1, #1
	ldr r6, _08008DD0 @ =0x0000417A
	adds r0, r2, r6
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r1, _08008DD4 @ =0x00000A22
	adds r2, r2, r1
	adds r2, r2, r0
	ldrh r0, [r2]
	cmp r0, #0x36
	bne _08008DD8
_08008DC6:
	movs r0, #0x36
	b _08008E34
	.align 2, 0
_08008DCC: .4byte gUnknown_0808D808
_08008DD0: .4byte 0x0000417A
_08008DD4: .4byte 0x00000A22
_08008DD8:
	ldr r0, [r5]
	ldr r2, [r0]
	ldrh r0, [r2]
	subs r0, #1
	cmp r4, r0
	bge _08008E00
	lsls r1, r3, #1
	ldr r6, _08008E28 @ =0x0000417A
	adds r0, r2, r6
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r6, _08008E2C @ =0x00000A22
	adds r1, r2, r6
	adds r1, r1, r0
	ldrh r0, [r1]
	cmp r0, #0x14
	beq _08008E24
_08008E00:
	cmp r4, #0
	ble _08008E30
	ldr r0, [r5]
	ldr r1, [r0]
	lsls r2, r3, #1
	ldr r3, _08008E28 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r0, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r6, _08008E2C @ =0x00000A22
	adds r1, r1, r6
	adds r1, r1, r0
	ldrh r0, [r1]
	cmp r0, #0x14
	bne _08008E30
_08008E24:
	movs r0, #0x14
	b _08008E34
	.align 2, 0
_08008E28: .4byte 0x0000417A
_08008E2C: .4byte 0x00000A22
_08008E30:
	movs r0, #1
	rsbs r0, r0, #0
_08008E34:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

