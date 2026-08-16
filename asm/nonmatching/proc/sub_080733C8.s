	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080733C8
sub_080733C8: @ 0x080733C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r1, #0
	mov r8, r2
	movs r4, #0
	bl sub_0802163C
	ldrb r0, [r5]
	cmp r0, #0
	beq _080733F4
	movs r1, #0
_080733E4:
	mov r2, r8
	adds r0, r2, r4
	strb r1, [r0]
	adds r4, #1
	adds r0, r5, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _080733E4
_080733F4:
	movs r7, #0
	ldr r1, _08073478 @ =gUnknown_03003F68
	ldr r0, [r1]
	ldrb r0, [r0, #1]
	cmp r7, r0
	bge _0807346A
	mov sl, r1
_08073402:
	movs r2, #0
	mov r3, sl
	ldr r0, [r3]
	adds r1, r7, #1
	mov ip, r1
	ldrb r0, [r0]
	cmp r2, r0
	bge _0807345E
	ldr r6, _08073478 @ =gUnknown_03003F68
	ldr r3, _0807347C @ =gUnknown_0849959C
	mov sb, r3
_08073418:
	ldr r1, [r6]
	ldrb r0, [r1]
	muls r0, r7, r0
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	ldrh r1, [r1, #2]
	mov r3, sb
	ldr r0, [r3]
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r3, #0x1f
	ands r3, r0
	ldrb r0, [r5]
	adds r4, r2, #1
	cmp r0, #0
	beq _08073454
	adds r2, r5, #0
	mov r1, r8
_0807343E:
	ldrb r0, [r2]
	cmp r3, r0
	bne _0807344A
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0807344A:
	adds r2, #1
	adds r1, #1
	ldrb r0, [r2]
	cmp r0, #0
	bne _0807343E
_08073454:
	adds r2, r4, #0
	ldr r0, [r6]
	ldrb r0, [r0]
	cmp r2, r0
	blt _08073418
_0807345E:
	mov r7, ip
	mov r1, sl
	ldr r0, [r1]
	ldrb r0, [r0, #1]
	cmp r7, r0
	blt _08073402
_0807346A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073478: .4byte gUnknown_03003F68
_0807347C: .4byte gUnknown_0849959C

