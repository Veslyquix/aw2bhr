	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080715F8
sub_080715F8: @ 0x080715F8
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
	ldr r0, _08071668 @ =0x68736D53
	cmp r1, r0
	bne _08071658
	adds r0, r1, #1
	str r0, [r6, #0x34]
	ldrb r5, [r6, #8]
	ldr r4, [r6, #0x2c]
	movs r7, #1
	cmp r5, #0
	ble _08071654
	mov sb, r8
_08071628:
	mov r0, sl
	ands r0, r7
	cmp r0, #0
	beq _0807164A
	movs r0, #0x80
	ldrb r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _0807164A
	mov r0, r8
	strb r0, [r4, #0x19]
	mov r1, sb
	cmp r1, #0
	bne _0807164A
	adds r0, r4, #0
	bl sub_08071564
_0807164A:
	subs r5, #1
	adds r4, #0x50
	lsls r7, r7, #1
	cmp r5, #0
	bgt _08071628
_08071654:
	ldr r0, _08071668 @ =0x68736D53
	str r0, [r6, #0x34]
_08071658:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071668: .4byte 0x68736D53

