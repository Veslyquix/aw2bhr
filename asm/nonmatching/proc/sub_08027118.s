	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08027118
sub_08027118: @ 0x08027118
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r4, #1
_08027120:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_080266DC
	lsls r0, r0, #0x18
	adds r1, r4, #1
	mov ip, r1
	cmp r0, #0
	beq _0802716C
	movs r5, #1
	ldr r0, _0802717C @ =gUnknown_08499598
	mov r8, r0
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r7, r0, #2
	movs r6, #0x3c
_08027140:
	cmp r5, r4
	beq _08027164
	mov r0, r8
	ldr r1, [r0]
	adds r3, r6, r1
	ldrb r0, [r3, #0x1b]
	cmp r0, #0
	beq _08027164
	adds r2, r3, #0
	adds r2, #0x2a
	adds r0, r7, r1
	adds r0, #0x2a
	ldrb r1, [r2]
	ldrb r0, [r0]
	cmp r1, r0
	bne _08027164
	movs r0, #0
	strh r0, [r3, #0x14]
_08027164:
	adds r6, #0x3c
	adds r5, #1
	cmp r5, #4
	ble _08027140
_0802716C:
	mov r4, ip
	cmp r4, #4
	ble _08027120
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802717C: .4byte gUnknown_08499598

