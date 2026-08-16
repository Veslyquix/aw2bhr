	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806279C
sub_0806279C: @ 0x0806279C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r1, #0
	ldr r7, _080627F0 @ =gUnknown_0202DAD8
	movs r0, #0x2c
	mov r8, r0
	movs r4, #0
	mov ip, r0
_080627AE:
	movs r2, #0
	lsls r0, r1, #5
	adds r6, r1, #1
	adds r0, r0, r1
	lsls r3, r0, #4
_080627B8:
	adds r5, r2, #1
	mov r0, ip
	muls r0, r2, r0
	adds r0, r0, r3
	adds r0, r0, r7
	movs r1, #4
_080627C4:
	str r4, [r0, #0x14]
	stm r0!, {r4}
	subs r1, #1
	cmp r1, #0
	bge _080627C4
	mov r0, r8
	muls r0, r2, r0
	adds r0, r0, r3
	adds r0, r0, r7
	strh r4, [r0, #0x28]
	strh r4, [r0, #0x2a]
	adds r2, r5, #0
	cmp r2, #0xb
	ble _080627B8
	adds r1, r6, #0
	cmp r1, #9
	ble _080627AE
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080627F0: .4byte gUnknown_0202DAD8

