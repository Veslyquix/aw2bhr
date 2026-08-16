	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08009CF8
sub_08009CF8: @ 0x08009CF8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r7, #0
	ldr r0, _08009DF0 @ =gUnknown_0808D828
	mov r8, r0
	cmp r6, #0
	ble _08009D3A
	ldr r0, [r0]
	ldr r2, [r0]
	subs r1, r6, #1
	lsls r3, r1, #1
	ldr r4, _08009DF4 @ =0x0000417A
	adds r0, r2, r4
	adds r0, r0, r3
	ldrh r0, [r0]
	adds r0, r0, r5
	ldr r3, _08009DF8 @ =0x00001432
	adds r2, r2, r3
	adds r2, r2, r0
	ldrb r4, [r2]
	adds r0, r5, #0
	bl sub_080094EC
	cmp r0, #0
	bne _08009D3A
	cmp r4, #2
	beq _08009D38
	cmp r4, #0xc
	bne _08009D3A
_08009D38:
	movs r7, #1
_08009D3A:
	mov r4, r8
	ldr r0, [r4]
	ldr r3, [r0]
	ldrh r0, [r3, #2]
	subs r0, #1
	cmp r6, r0
	bge _08009D72
	adds r1, r6, #1
	lsls r2, r1, #1
	ldr r4, _08009DF4 @ =0x0000417A
	adds r0, r3, r4
	adds r0, r0, r2
	ldrh r2, [r0]
	adds r2, r2, r5
	ldr r4, _08009DF8 @ =0x00001432
	adds r0, r3, r4
	adds r0, r0, r2
	ldrb r4, [r0]
	adds r0, r5, #0
	bl sub_080094EC
	cmp r0, #0
	bne _08009D72
	cmp r4, #2
	beq _08009D70
	cmp r4, #0xc
	bne _08009D72
_08009D70:
	adds r7, #1
_08009D72:
	cmp r5, #0
	ble _08009DA8
	mov r1, r8
	ldr r0, [r1]
	ldr r1, [r0]
	lsls r2, r6, #1
	ldr r3, _08009DF4 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r0, #1
	adds r0, r0, r5
	ldr r4, _08009DF8 @ =0x00001432
	adds r1, r1, r4
	adds r1, r1, r0
	ldrb r4, [r1]
	subs r0, r5, #1
	adds r1, r6, #0
	bl sub_080094EC
	cmp r0, #0
	bne _08009DA8
	cmp r4, #2
	beq _08009DA6
	cmp r4, #0xc
	bne _08009DA8
_08009DA6:
	adds r7, #1
_08009DA8:
	mov r1, r8
	ldr r0, [r1]
	ldr r2, [r0]
	ldrh r0, [r2]
	subs r0, #1
	cmp r5, r0
	bge _08009DE2
	lsls r1, r6, #1
	ldr r3, _08009DF4 @ =0x0000417A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, #1
	adds r1, r1, r5
	ldr r4, _08009DF8 @ =0x00001432
	adds r0, r2, r4
	adds r0, r0, r1
	ldrb r4, [r0]
	adds r0, r5, #1
	adds r1, r6, #0
	bl sub_080094EC
	cmp r0, #0
	bne _08009DE2
	cmp r4, #2
	beq _08009DE0
	cmp r4, #0xc
	bne _08009DE2
_08009DE0:
	adds r7, #1
_08009DE2:
	adds r0, r7, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08009DF0: .4byte gUnknown_0808D828
_08009DF4: .4byte 0x0000417A
_08009DF8: .4byte 0x00001432

