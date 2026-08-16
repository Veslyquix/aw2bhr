	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08058318
sub_08058318: @ 0x08058318
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r5, #0
	movs r2, #0
	ldr r0, _080583C4 @ =gUnknown_03003340
	mov sl, r0
	movs r4, #1
	rsbs r4, r4, #0
	mov sb, r4
	ldr r0, _080583C8 @ =gUnknown_030033EC
	ldrh r6, [r0]
_08058334:
	ldr r0, _080583CC @ =gUnknown_08499598
	ldr r1, [r0]
	lsls r0, r6, #4
	subs r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x2c
	ldrb r1, [r0]
	asrs r1, r2
	movs r0, #1
	ands r1, r0
	adds r7, r2, #1
	cmp r1, #0
	bne _080583AE
	lsls r3, r2, #6
	adds r4, r3, #0
	adds r4, #0x40
	cmp r3, r4
	bge _080583AE
	ldr r0, _080583D0 @ =gUnknown_08499594
	ldr r1, [r0]
	ldr r0, _080583D4 @ =gUnknown_0857680F
	mov r8, r0
	ldr r0, _080583D8 @ =gUnknown_085D5ABC
	mov ip, r0
	lsls r0, r2, #7
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r2, r0, r1
	subs r3, r4, r3
_08058370:
	ldrb r0, [r2]
	cmp r0, #2
	bls _080583A6
	adds r1, r0, #0
	mov r4, r8
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #2
	bne _080583A6
	movs r0, #0x5c
	muls r0, r1, r0
	add r0, ip
	ldrb r0, [r0, #0xb]
	cmp r0, #0
	beq _080583A6
	ldrb r0, [r2, #3]
	lsls r0, r0, #2
	add r0, sl
	ldrb r1, [r2, #2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, sb
	beq _080583A6
	adds r5, #1
_080583A6:
	adds r2, #0xc
	subs r3, #1
	cmp r3, #0
	bne _08058370
_080583AE:
	adds r2, r7, #0
	cmp r2, #3
	ble _08058334
	adds r0, r5, #0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080583C4: .4byte gUnknown_03003340
_080583C8: .4byte gUnknown_030033EC
_080583CC: .4byte gUnknown_08499598
_080583D0: .4byte gUnknown_08499594
_080583D4: .4byte gUnknown_0857680F
_080583D8: .4byte gUnknown_085D5ABC

