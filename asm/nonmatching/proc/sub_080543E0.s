	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080543E0
sub_080543E0: @ 0x080543E0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	ldr r5, _0805447C @ =gUnknown_0813613C
	ldr r2, [r5]
	ldr r4, _08054480 @ =gUnknown_08136140
	ldr r3, [r4]
	lsls r0, r7, #3
	adds r0, r0, r7
	lsls r0, r0, #2
	movs r1, #0xb4
	mov r6, r8
	muls r6, r1, r6
	adds r1, r6, #0
	adds r0, r0, r1
	adds r6, r0, r3
	movs r0, #0x18
	ldrsh r3, [r6, r0]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #5
	adds r2, #0x2c
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, #1
	beq _08054470
	adds r1, r3, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08054448
	adds r0, r3, #0
	bl sub_080153F0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08054448
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	ldr r1, _08054484 @ =gUnknown_02029BA8
	mov r3, r8
	lsls r2, r3, #5
	adds r1, #0x10
	adds r2, r2, r1
	ldr r1, [r2]
	bl sub_080156E8
_08054448:
	ldr r2, [r5]
	ldr r3, [r4]
	lsls r0, r7, #3
	adds r0, r0, r7
	lsls r0, r0, #2
	movs r1, #0xb4
	mov r4, r8
	muls r4, r1, r4
	adds r1, r4, #0
	adds r0, r0, r1
	adds r0, r0, r3
	movs r6, #0x18
	ldrsh r1, [r0, r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r2, #0x2c
	adds r0, r0, r2
	movs r1, #1
	str r1, [r0]
_08054470:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805447C: .4byte gUnknown_0813613C
_08054480: .4byte gUnknown_08136140
_08054484: .4byte gUnknown_02029BA8

