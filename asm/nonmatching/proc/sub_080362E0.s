	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080362E0
sub_080362E0: @ 0x080362E0
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	adds r2, r3, #0
	adds r2, #0x40
	ldrh r0, [r2]
	ldrh r1, [r3, #0x3e]
	adds r0, r0, r1
	strh r0, [r3, #0x3e]
	movs r4, #0x42
	adds r4, r4, r3
	mov ip, r4
	ldr r6, _08036380 @ =gUnknown_0849BE10
	adds r5, r3, #0
	adds r5, #0x38
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrh r1, [r2]
	ldrh r0, [r0]
	adds r4, r0, #0
	muls r4, r1, r4
	adds r0, r4, #0
	mov r1, ip
	ldrh r1, [r1]
	adds r0, r0, r1
	mov r4, ip
	strh r0, [r4]
	adds r4, r3, #0
	adds r4, #0x44
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r1, [r2]
	ldrh r0, [r0]
	adds r2, r0, #0
	muls r2, r1, r2
	adds r0, r2, #0
	ldrh r1, [r4]
	adds r0, r0, r1
	strh r0, [r4]
	ldrh r0, [r3, #0x3e]
	cmp r0, #0xf
	bls _08036378
	subs r0, #0x10
	strh r0, [r3, #0x3e]
	ldrh r1, [r3, #0x3e]
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r1, r0, r1
	mov r2, ip
	ldrh r0, [r2]
	subs r0, r0, r1
	strh r0, [r2]
	ldrh r1, [r3, #0x3e]
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r1, r0, r1
	ldrh r0, [r4]
	subs r0, r0, r1
	strh r0, [r4]
	movs r0, #0
	strh r0, [r3, #0x3e]
_08036378:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08036380: .4byte gUnknown_0849BE10

