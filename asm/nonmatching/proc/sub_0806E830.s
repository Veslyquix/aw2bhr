	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806E830
sub_0806E830: @ 0x0806E830
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	movs r4, #0
	mov r8, r4
	ldr r1, [r5, #0x60]
	lsls r0, r1, #1
	adds r7, r0, r1
	bl sub_0806E7FC
	ldr r1, [r5, #0x58]
	cmp r1, #0
	beq _0806E866
	movs r0, #0x10
	subs r3, r0, r1
	str r0, [sp]
	movs r0, #4
	movs r1, #8
	movs r2, #0
	bl Interpolate
	adds r4, r0, #0
	ldr r0, [r5, #0x58]
	subs r0, #1
	str r0, [r5, #0x58]
_0806E866:
	ldr r1, [r5, #0x5c]
	cmp r1, #0
	beq _0806E884
	movs r0, #0x10
	subs r3, r0, r1
	str r0, [sp]
	movs r0, #4
	movs r1, #8
	movs r2, #0
	bl Interpolate
	mov r8, r0
	ldr r0, [r5, #0x5c]
	subs r0, #1
	str r0, [r5, #0x5c]
_0806E884:
	ldr r5, _0806E8C0 @ =gUnknown_08582C1C
	adds r0, r7, r5
	ldrb r1, [r0]
	subs r1, r1, r4
	adds r4, r7, #2
	adds r4, r4, r5
	ldrb r2, [r4]
	ldr r6, _0806E8C4 @ =gUnknown_0816E800
	movs r0, #0
	str r0, [sp]
	adds r3, r6, #0
	bl PutSprite
	adds r0, r7, #1
	adds r0, r0, r5
	ldrb r1, [r0]
	add r1, r8
	ldrb r2, [r4]
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	adds r3, r6, #0
	bl PutSprite
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E8C0: .4byte gUnknown_08582C1C
_0806E8C4: .4byte gUnknown_0816E800

