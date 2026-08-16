	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800A95C
sub_0800A95C: @ 0x0800A95C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r7, r1, #0
	movs r5, #0
	ldr r0, _0800AA28 @ =gUnknown_0808D850
	mov r8, r0
	cmp r7, #0
	ble _0800A9A6
	subs r6, r7, #1
	cmp r4, #0
	ble _0800A980
	subs r0, r4, #1
	adds r1, r6, #0
	bl sub_08009918
	lsls r5, r0, #8
_0800A980:
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_08009918
	lsls r0, r0, #7
	orrs r5, r0
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _0800A9A6
	adds r0, r4, #1
	adds r1, r6, #0
	bl sub_08009918
	lsls r0, r0, #6
	orrs r5, r0
_0800A9A6:
	cmp r4, #0
	ble _0800A9B6
	subs r0, r4, #1
	adds r1, r7, #0
	bl sub_08009918
	lsls r0, r0, #5
	orrs r5, r0
_0800A9B6:
	mov r2, r8
	ldr r2, [r2]
	mov r8, r2
	ldr r0, [r2]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _0800A9D2
	adds r0, r4, #1
	adds r1, r7, #0
	bl sub_08009918
	lsls r0, r0, #3
	orrs r5, r0
_0800A9D2:
	mov r1, r8
	ldr r0, [r1]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r7, r0
	bge _0800AA12
	adds r6, r7, #1
	cmp r4, #0
	ble _0800A9F0
	subs r0, r4, #1
	adds r1, r6, #0
	bl sub_08009918
	lsls r0, r0, #2
	orrs r5, r0
_0800A9F0:
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_08009918
	lsls r0, r0, #1
	orrs r5, r0
	mov r2, r8
	ldr r0, [r2]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _0800AA12
	adds r0, r4, #1
	adds r1, r6, #0
	bl sub_08009918
	orrs r5, r0
_0800AA12:
	ldr r0, _0800AA2C @ =gUnknown_08486BC4
	lsls r1, r5, #1
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800AA28: .4byte gUnknown_0808D850
_0800AA2C: .4byte gUnknown_08486BC4

