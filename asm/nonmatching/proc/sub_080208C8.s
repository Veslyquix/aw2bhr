	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080208C8
sub_080208C8: @ 0x080208C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	ldr r0, _0802093C @ =gUnknown_030033EC
	ldrh r1, [r0]
	ldr r3, _08020940 @ =gUnknown_08090940
	ldr r0, [r3]
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1b]
	mov sl, r3
	cmp r0, #1
	beq _08020972
	movs r0, #0
	mov sb, r0
	mov r8, r0
	movs r4, #1
	lsls r0, r7, #4
	subs r0, r0, r7
	lsls r6, r0, #2
	movs r5, #0x3c
_080208FE:
	cmp r4, r7
	beq _0802096A
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802096A
	mov r1, r8
	cmp r1, #0
	beq _08020944
	mov r1, sl
	ldr r0, [r1]
	ldr r2, [r0]
	adds r1, r5, r2
	ldrb r0, [r1, #0x1b]
	cmp r0, #1
	bne _0802096A
	adds r0, r1, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	cmp sb, r1
	beq _0802096A
	adds r0, r6, r2
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, r1
	beq _0802096A
	movs r0, #1
	b _08020974
	.align 2, 0
_0802093C: .4byte gUnknown_030033EC
_08020940: .4byte gUnknown_08090940
_08020944:
	mov r1, sl
	ldr r0, [r1]
	ldr r2, [r0]
	adds r1, r5, r2
	ldrb r0, [r1, #0x1b]
	cmp r0, #1
	bne _0802096A
	adds r3, r1, #0
	adds r3, #0x2a
	adds r0, r6, r2
	adds r0, #0x2a
	ldrb r1, [r3]
	ldrb r0, [r0]
	cmp r1, r0
	beq _0802096A
	adds r3, r1, #0
	mov sb, r3
	movs r0, #1
	mov r8, r0
_0802096A:
	adds r5, #0x3c
	adds r4, #1
	cmp r4, #4
	ble _080208FE
_08020972:
	movs r0, #0
_08020974:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

