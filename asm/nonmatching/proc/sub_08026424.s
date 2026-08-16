	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08026424
sub_08026424: @ 0x08026424
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r6, #0
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08026480
	movs r5, #0
	movs r4, #1
	ldr r7, _08026484 @ =gUnknown_08090A64
	lsls r0, r6, #4
	subs r0, r0, r6
	lsls r0, r0, #2
	mov r8, r0
_08026448:
	ldr r0, [r7]
	ldr r2, [r0]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r1, r0, r2
	ldrb r0, [r1, #0x1b]
	cmp r0, #0
	beq _08026472
	mov r3, r8
	adds r0, r3, r2
	adds r0, #0x2a
	adds r1, #0x2a
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _08026472
	adds r0, r4, #0
	bl sub_08025CF0
	adds r5, r5, r0
_08026472:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #4
	bls _08026448
	cmp r5, #0
	bne _08026488
_08026480:
	movs r0, #0
	b _080264B2
	.align 2, 0
_08026484: .4byte gUnknown_08090A64
_08026488:
	ldr r0, [r7]
	ldr r1, [r0]
	lsls r0, r6, #4
	subs r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r1, [r0, #0x18]
	lsls r0, r1, #5
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r1, r5, #0
	bl Div
	adds r5, r0, #0
	cmp r5, #0x64
	bls _080264AE
	movs r5, #0x64
_080264AE:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
_080264B2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

