	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08071584
sub_08071584: @ 0x08071584
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	ldr r1, [r6, #0x34]
	ldr r0, _080715F4 @ =0x68736D53
	cmp r1, r0
	bne _080715E4
	adds r0, r1, #1
	str r0, [r6, #0x34]
	ldrb r5, [r6, #8]
	ldr r4, [r6, #0x2c]
	movs r7, #1
	cmp r5, #0
	ble _080715E0
	mov sb, r8
_080715B4:
	mov r0, sl
	ands r0, r7
	cmp r0, #0
	beq _080715D6
	movs r0, #0x80
	ldrb r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _080715D6
	mov r0, r8
	strb r0, [r4, #0x17]
	mov r1, sb
	cmp r1, #0
	bne _080715D6
	adds r0, r4, #0
	bl sub_08071564
_080715D6:
	subs r5, #1
	adds r4, #0x50
	lsls r7, r7, #1
	cmp r5, #0
	bgt _080715B4
_080715E0:
	ldr r0, _080715F4 @ =0x68736D53
	str r0, [r6, #0x34]
_080715E4:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080715F4: .4byte 0x68736D53

