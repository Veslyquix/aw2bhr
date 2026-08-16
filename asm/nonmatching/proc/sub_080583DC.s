	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080583DC
sub_080583DC: @ 0x080583DC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r5, #0
	movs r2, #0
	ldr r0, _08058478 @ =gUnknown_030033EC
	ldrh r7, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	mov sb, r0
	ldr r0, _0805847C @ =gUnknown_08499598
	ldr r0, [r0]
	mov sl, r0
_080583FA:
	lsls r0, r7, #4
	subs r0, r0, r7
	lsls r0, r0, #2
	add r0, sl
	adds r0, #0x2c
	ldrb r1, [r0]
	asrs r1, r2
	movs r0, #1
	ands r1, r0
	adds r6, r2, #1
	cmp r1, #0
	beq _08058460
	lsls r3, r2, #6
	adds r4, r3, #0
	adds r4, #0x40
	cmp r3, r4
	bge _08058460
	ldr r0, _08058480 @ =gUnknown_08499594
	ldr r1, [r0]
	ldr r0, _08058484 @ =gUnknown_0857680F
	mov r8, r0
	ldr r0, _08058488 @ =gUnknown_03003340
	mov ip, r0
	lsls r0, r2, #7
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r2, r0, r1
	subs r3, r4, r3
_08058432:
	ldrb r0, [r2]
	cmp r0, #0
	beq _08058458
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #2
	bne _08058458
	ldrb r0, [r2, #3]
	lsls r0, r0, #2
	add r0, ip
	ldrb r1, [r2, #2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, sb
	beq _08058458
	adds r5, #1
_08058458:
	adds r2, #0xc
	subs r3, #1
	cmp r3, #0
	bne _08058432
_08058460:
	adds r2, r6, #0
	cmp r2, #3
	ble _080583FA
	adds r0, r5, #0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08058478: .4byte gUnknown_030033EC
_0805847C: .4byte gUnknown_08499598
_08058480: .4byte gUnknown_08499594
_08058484: .4byte gUnknown_0857680F
_08058488: .4byte gUnknown_03003340

