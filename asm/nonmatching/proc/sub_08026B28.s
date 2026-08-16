	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08026B28
sub_08026B28: @ 0x08026B28
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r5, #1
	ldr r0, _08026BA4 @ =gUnknown_08499598
	mov sb, r0
_08026B36:
	mov r1, sb
	ldr r0, [r1]
	lsls r1, r5, #4
	subs r1, r1, r5
	lsls r1, r1, #2
	adds r0, r1, r0
	ldrb r0, [r0, #0x1b]
	adds r7, r5, #1
	cmp r0, #0
	beq _08026B8E
	movs r4, #1
	ldr r0, _08026BA4 @ =gUnknown_08499598
	mov r8, r0
	adds r6, r1, #0
	ldr r1, _08026BA8 @ =gUnknown_08090A84
	mov ip, r1
_08026B56:
	cmp r5, r4
	beq _08026B84
	mov r1, r8
	ldr r0, [r1]
	adds r2, r6, r0
	adds r3, r2, #0
	adds r3, #0x2a
	lsls r1, r4, #4
	subs r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r0
	adds r1, #0x2a
	ldrb r0, [r3]
	ldrb r1, [r1]
	cmp r0, r1
	beq _08026B84
	adds r2, #0x2c
	mov r0, ip
	adds r1, r4, r0
	ldrb r0, [r2]
	ldrb r1, [r1]
	orrs r0, r1
	strb r0, [r2]
_08026B84:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bls _08026B56
_08026B8E:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	bls _08026B36
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08026BA4: .4byte gUnknown_08499598
_08026BA8: .4byte gUnknown_08090A84

