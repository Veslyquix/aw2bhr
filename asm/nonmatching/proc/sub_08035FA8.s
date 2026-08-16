	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08035FA8
sub_08035FA8: @ 0x08035FA8
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r2, _08035FD4 @ =gUnknown_08090EB4
	ldr r5, [r2]
	adds r4, r3, #0
	adds r4, #0x36
	ldrb r1, [r4]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r1, [r0, #0x1e]
	movs r0, #0x80
	lsls r0, r0, #7
	cmp r1, r0
	beq _08035FE2
	cmp r1, r0
	bgt _08035FD8
	cmp r1, #0
	beq _0803601C
	b _08036004
	.align 2, 0
_08035FD4: .4byte gUnknown_08090EB4
_08035FD8:
	movs r0, #0x80
	lsls r0, r0, #8
	cmp r1, r0
	bne _08036004
	b _0803601C
_08035FE2:
	ldr r0, _08036000 @ =gUnknown_0849BDE8
	movs r1, #0
	bl sub_080152EC
	ldrb r2, [r4]
	lsls r1, r2, #3
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r2, r5, #0
	adds r2, #0x20
	adds r1, r1, r2
	ldr r1, [r1]
	str r1, [r0, #0x18]
	b _0803601C
	.align 2, 0
_08036000: .4byte gUnknown_0849BDE8
_08036004:
	ldr r2, [r2]
	adds r0, r3, #0
	adds r0, #0x36
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #0x1e
	ldrsh r0, [r0, r1]
	bl sub_0803B48C
_0803601C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

