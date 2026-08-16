	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080660BC
sub_080660BC: @ 0x080660BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #4]
	adds r7, r1, #0
	ldr r1, _08066160 @ =gUnknown_0816E140
	ldr r0, [r1]
	mov r8, r0
	ldr r0, [r0]
	ldrb r6, [r0, #8]
	adds r0, #0x11
	adds r5, r0, r7
	ldrb r2, [r5]
	mov sb, r2
	movs r0, #0x40
	ldr r2, [sp]
	ands r0, r2
	mov sl, r1
	cmp r0, #0
	beq _0806616A
	subs r4, r6, #1
	mov r1, sb
	adds r0, r1, r4
	adds r1, r6, #0
	bl __modsi3
	strb r0, [r5]
	movs r2, #0
	movs r3, #0
	adds r5, r4, #0
	cmp r3, r6
	bge _08066126
	mov r1, r8
	ldr r0, [r1]
	adds r4, r0, #0
	adds r4, #0x11
	ldrb r1, [r0, #0x11]
_08066116:
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r1, r0
	bne _08066120
	adds r3, #1
_08066120:
	adds r2, #1
	cmp r2, r6
	blt _08066116
_08066126:
	cmp r3, r6
	bne _08066140
	mov r2, sl
	ldr r0, [r2]
	ldr r4, [r0]
	adds r4, #0x11
	adds r4, r4, r7
	ldrb r0, [r4]
	adds r0, r0, r5
	adds r1, r6, #0
	bl __modsi3
	strb r0, [r4]
_08066140:
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _0806616A
	mov r1, sl
	ldr r0, [r1]
	ldr r0, [r0]
	adds r0, #0x11
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp sb, r0
	beq _08066164
	movs r0, #0x64
	bl sub_0803B4DC
	b _0806616A
	.align 2, 0
_08066160: .4byte gUnknown_0816E140
_08066164:
	movs r0, #0x68
	bl sub_0803B4DC
_0806616A:
	movs r0, #0x80
	ldr r2, [sp]
	ands r0, r2
	cmp r0, #0
	beq _080661EE
	mov r0, sl
	ldr r0, [r0]
	mov r8, r0
	ldr r4, [r0]
	adds r4, #0x11
	adds r4, r4, r7
	ldrb r0, [r4]
	adds r5, r6, #1
	adds r0, r0, r5
	adds r1, r6, #0
	bl __modsi3
	strb r0, [r4]
	movs r2, #0
	movs r3, #0
	cmp r3, r6
	bge _080661B0
	mov r1, r8
	ldr r0, [r1]
	adds r1, r0, #0
	adds r1, #0x11
	ldrb r4, [r0, #0x11]
_080661A0:
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r4, r0
	bne _080661AA
	adds r3, #1
_080661AA:
	adds r2, #1
	cmp r2, r6
	blt _080661A0
_080661B0:
	cmp r3, r6
	bne _080661CA
	mov r2, sl
	ldr r0, [r2]
	ldr r4, [r0]
	adds r4, #0x11
	adds r4, r4, r7
	ldrb r0, [r4]
	adds r0, r0, r5
	adds r1, r6, #0
	bl __modsi3
	strb r0, [r4]
_080661CA:
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _080661EE
	mov r1, sl
	ldr r0, [r1]
	ldr r0, [r0]
	adds r0, #0x11
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp sb, r0
	beq _080661E8
	movs r0, #0x64
	bl sub_0803B4DC
	b _080661EE
_080661E8:
	movs r0, #0x68
	bl sub_0803B4DC
_080661EE:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

