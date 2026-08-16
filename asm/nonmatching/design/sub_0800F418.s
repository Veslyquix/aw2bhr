	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800F418
sub_0800F418: @ 0x0800F418
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r6, #0
	ldr r0, _0800F4D8 @ =gUnknown_0808D894
	mov r8, r0
	cmp r5, #0
	ble _0800F452
	subs r7, r5, #1
	adds r0, r4, #0
	adds r1, r7, #0
	bl sub_0800F368
	lsls r6, r0, #7
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _0800F452
	adds r0, r4, #1
	adds r1, r7, #0
	bl sub_0800F2E0
	lsls r0, r0, #6
	orrs r6, r0
_0800F452:
	cmp r4, #0
	ble _0800F462
	subs r0, r4, #1
	adds r1, r5, #0
	bl sub_0800F318
	lsls r0, r0, #5
	orrs r6, r0
_0800F462:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800F2E0
	lsls r0, r0, #4
	orrs r6, r0
	mov r2, r8
	ldr r7, [r2]
	ldr r0, [r7]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _0800F488
	adds r0, r4, #1
	adds r1, r5, #0
	bl sub_0800F318
	lsls r0, r0, #3
	orrs r6, r0
_0800F488:
	ldr r0, [r7]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r5, r0
	bge _0800F4C4
	adds r5, #1
	cmp r4, #0
	ble _0800F4A4
	subs r0, r4, #1
	adds r1, r5, #0
	bl sub_0800F2E0
	lsls r0, r0, #2
	orrs r6, r0
_0800F4A4:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800F368
	lsls r0, r0, #1
	orrs r6, r0
	ldr r0, [r7]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _0800F4C4
	adds r0, r4, #1
	adds r1, r5, #0
	bl sub_0800F2E0
	orrs r6, r0
_0800F4C4:
	ldr r0, _0800F4DC @ =gUnknown_084865C4
	lsls r1, r6, #1
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800F4D8: .4byte gUnknown_0808D894
_0800F4DC: .4byte gUnknown_084865C4

