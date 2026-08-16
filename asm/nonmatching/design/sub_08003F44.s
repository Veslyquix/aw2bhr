	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08003F44
sub_08003F44: @ 0x08003F44
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r3, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	cmp r3, #0x1d
	ble _08003F5A
	movs r3, #0x1d
_08003F5A:
	cmp r6, #0x13
	ble _08003F60
	movs r6, #0x13
_08003F60:
	ldr r0, _08003F90 @ =gUnknown_08499590
	mov sb, r0
	ldr r5, [r0]
	lsls r1, r6, #1
	mov sl, r1
	ldr r2, _08003F94 @ =0x0000417A
	mov r8, r2
	adds r0, r5, r2
	adds r2, r0, r1
	ldrh r1, [r2]
	adds r1, r1, r3
	lsls r1, r1, #1
	ldr r7, _08003F98 @ =0x00000A22
	mov ip, r7
	adds r0, r5, r7
	adds r0, r0, r1
	strh r4, [r0]
	cmp r4, #0x20
	beq _08003FB8
	cmp r4, #0x20
	bgt _08003F9C
	cmp r4, #1
	beq _08003FA6
	b _0800400C
	.align 2, 0
_08003F90: .4byte gUnknown_08499590
_08003F94: .4byte 0x0000417A
_08003F98: .4byte 0x00000A22
_08003F9C:
	cmp r4, #0x2a
	beq _08004004
	cmp r4, #0x87
	beq _08003FCC
	b _0800400C
_08003FA6:
	ldrh r1, [r2]
	adds r1, r1, r3
	ldr r2, _08003FB4 @ =0x00001432
	adds r0, r5, r2
	adds r0, r0, r1
	strb r4, [r0]
	b _0800400C
	.align 2, 0
_08003FB4: .4byte 0x00001432
_08003FB8:
	ldrh r0, [r2]
	adds r0, r0, r3
	ldr r7, _08003FC8 @ =0x00001432
	adds r1, r5, r7
	adds r1, r1, r0
	movs r0, #3
	strb r0, [r1]
	b _0800400C
	.align 2, 0
_08003FC8: .4byte 0x00001432
_08003FCC:
	ldrh r0, [r2]
	adds r0, r0, r3
	ldr r2, _08004000 @ =0x00001432
	adds r1, r5, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #4
	beq _0800400C
	movs r0, #4
	strb r0, [r1]
	mov r7, sb
	ldr r1, [r7]
	mov r2, r8
	adds r0, r1, r2
	add r0, sl
	ldrh r0, [r0]
	adds r0, r0, r3
	lsls r0, r0, #1
	add r1, ip
	adds r1, r1, r0
	strh r4, [r1]
	adds r0, r3, #0
	adds r1, r6, #0
	bl sub_0800CF28
	b _0800400C
	.align 2, 0
_08004000: .4byte 0x00001432
_08004004:
	adds r0, r3, #0
	adds r1, r6, #0
	bl sub_08007CA0
_0800400C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

