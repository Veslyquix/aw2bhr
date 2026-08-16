	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08009BF4
sub_08009BF4: @ 0x08009BF4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r7, #0
	ldr r0, _08009CEC @ =gUnknown_0808D824
	mov sb, r0
	cmp r6, #0
	ble _08009C38
	subs r4, r6, #1
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_080094EC
	cmp r0, #0
	bne _08009C38
	mov r1, sb
	ldr r0, [r1]
	ldr r1, [r0]
	lsls r2, r4, #1
	ldr r3, _08009CF0 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r5
	ldr r2, _08009CF4 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #2
	bne _08009C38
	movs r7, #1
_08009C38:
	mov r3, sb
	ldr r3, [r3]
	mov r8, r3
	ldr r0, [r3]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r6, r0
	bge _08009C74
	adds r4, r6, #1
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_080094EC
	cmp r0, #0
	bne _08009C74
	mov r0, r8
	ldr r1, [r0]
	lsls r2, r4, #1
	ldr r3, _08009CF0 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r5
	ldr r2, _08009CF4 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #2
	bne _08009C74
	adds r7, #1
_08009C74:
	cmp r5, #0
	ble _08009CA6
	subs r0, r5, #1
	adds r1, r6, #0
	bl sub_080094EC
	cmp r0, #0
	bne _08009CA6
	mov r3, sb
	ldr r0, [r3]
	ldr r1, [r0]
	lsls r2, r6, #1
	ldr r3, _08009CF0 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r0, #1
	adds r0, r0, r5
	ldr r2, _08009CF4 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #2
	bne _08009CA6
	adds r7, #1
_08009CA6:
	mov r3, sb
	ldr r4, [r3]
	ldr r0, [r4]
	ldrh r0, [r0]
	subs r0, #1
	cmp r5, r0
	bge _08009CDE
	adds r0, r5, #1
	adds r1, r6, #0
	bl sub_080094EC
	cmp r0, #0
	bne _08009CDE
	ldr r1, [r4]
	lsls r2, r6, #1
	ldr r3, _08009CF0 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, #1
	adds r0, r0, r5
	ldr r2, _08009CF4 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #2
	bne _08009CDE
	adds r7, #1
_08009CDE:
	adds r0, r7, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08009CEC: .4byte gUnknown_0808D824
_08009CF0: .4byte 0x0000417A
_08009CF4: .4byte 0x00001432

