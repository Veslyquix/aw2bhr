	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804EE08
sub_0804EE08: @ 0x0804EE08
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov ip, r2
	ldr r1, _0804EE74 @ =gUnknown_02029B80
	lsls r0, r7, #2
	mov r8, r0
	adds r0, r0, r7
	adds r0, r0, r5
	lsls r6, r0, #1
	adds r4, r6, r1
	ldrh r3, [r4]
	cmp r3, #0
	bne _0804EE84
	ldr r2, _0804EE78 @ =gUnknown_03001470
	mov r1, ip
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r2, #0x28
	adds r1, r1, r2
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	cmp r0, #0xc0
	bne _0804EE50
	str r3, [r1]
_0804EE50:
	ldr r0, _0804EE7C @ =gUnknown_08552500
	ldr r2, [r1]
	lsls r2, r2, #1
	adds r2, r2, r0
	ldr r3, _0804EE80 @ =gUnknown_02029A10
	lsls r1, r5, #3
	adds r1, r1, r5
	lsls r1, r1, #2
	movs r0, #0xb4
	muls r0, r7, r0
	adds r1, r1, r0
	adds r1, r1, r3
	movs r3, #0
	ldrsh r0, [r2, r3]
	ldrh r2, [r1, #0xa]
	adds r0, r0, r2
	strh r0, [r1, #0xa]
	b _0804EEE4
	.align 2, 0
_0804EE74: .4byte gUnknown_02029B80
_0804EE78: .4byte gUnknown_03001470
_0804EE7C: .4byte gUnknown_08552500
_0804EE80: .4byte gUnknown_02029A10
_0804EE84:
	movs r0, #0x23
	bl sub_0803B48C
	movs r3, #0
	strh r3, [r4]
	ldr r0, _0804EEF0 @ =gUnknown_02029B94
	adds r0, r6, r0
	movs r1, #1
	strh r1, [r0]
	ldr r2, _0804EEF4 @ =gUnknown_02029A10
	lsls r0, r5, #3
	adds r0, r0, r5
	lsls r0, r0, #2
	movs r1, #0xb4
	muls r1, r7, r1
	adds r0, r0, r1
	adds r0, r0, r2
	strh r3, [r0, #0x14]
	mov r0, sp
	strh r7, [r0]
	adds r0, #2
	strh r5, [r0]
	ldr r2, _0804EEF8 @ =gUnknown_085534EC
	mov r3, r8
	adds r0, r3, r2
	ldrh r1, [r0]
	add r0, sp, #4
	strh r1, [r0]
	lsls r0, r7, #1
	adds r0, #1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r1, [r0]
	mov r0, sp
	adds r0, #6
	strh r1, [r0]
	add r1, sp, #8
	movs r0, #0x10
	strh r0, [r1]
	adds r1, #2
	movs r0, #8
	strh r0, [r1]
	add r1, sp, #0xc
	movs r0, #0x64
	strh r0, [r1]
	mov r0, sp
	bl sub_08056E28
_0804EEE4:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804EEF0: .4byte gUnknown_02029B94
_0804EEF4: .4byte gUnknown_02029A10
_0804EEF8: .4byte gUnknown_085534EC

