	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804C0FC
sub_0804C0FC: @ 0x0804C0FC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, _0804C254 @ =gUnknown_03004500
	adds r0, r7, r0
	ldrb r0, [r0]
	ldr r6, _0804C258 @ =gUnknown_08136054
	ldr r1, [r6]
	lsls r5, r7, #4
	adds r1, #2
	adds r5, r5, r1
	ldrh r1, [r5]
	ldr r3, _0804C25C @ =gUnknown_08551CFC
	lsls r4, r7, #3
	adds r2, r4, r3
	ldr r2, [r2]
	adds r3, #4
	adds r4, r4, r3
	ldr r3, [r4]
	bl sub_0804BD20
	adds r0, r7, #0
	bl sub_0804FF44
	ldr r3, _0804C260 @ =gUnknown_08136058
	ldr r2, [r3]
	ldrh r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #4]
	mov sb, r6
	mov r8, r3
	cmp r0, #0
	bne _0804C17C
	movs r4, #0
	ldr r6, _0804C264 @ =gUnknown_02029A10
	movs r0, #0xb4
	adds r5, r7, #0
	muls r5, r0, r5
_0804C154:
	lsls r0, r4, #3
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804C16C
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_0804C268
_0804C16C:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #4
	bls _0804C154
	adds r0, r7, #0
	bl sub_0804C098
_0804C17C:
	mov r0, r8
	ldr r4, [r0]
	mov r1, sb
	ldr r0, [r1]
	lsls r1, r7, #4
	adds r0, #2
	adds r6, r1, r0
	ldrh r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r1, r0, r4
	ldrh r0, [r1, #4]
	cmp r0, #1
	bne _0804C246
	ldrh r0, [r1]
	cmp r0, #6
	bne _0804C1A6
	adds r0, r7, #0
	bl sub_0804C488
_0804C1A6:
	ldrh r0, [r6]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrh r0, [r1]
	cmp r0, #0x13
	bne _0804C1BC
	adds r0, r7, #0
	bl sub_0804C400
_0804C1BC:
	ldrh r0, [r6]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrh r0, [r1]
	cmp r0, #0x10
	bne _0804C1D2
	adds r0, r7, #0
	bl sub_0804C498
_0804C1D2:
	ldrh r0, [r6]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrh r0, [r1]
	cmp r0, #0x14
	bne _0804C1E8
	adds r0, r7, #0
	bl sub_0804DB14
_0804C1E8:
	ldrh r0, [r6]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrh r0, [r1]
	cmp r0, #0x15
	bne _0804C1FE
	adds r0, r7, #0
	bl sub_0804CEF8
_0804C1FE:
	ldrh r0, [r6]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrh r0, [r1]
	cmp r0, #0x16
	bne _0804C214
	adds r0, r7, #0
	bl sub_0804C99C
_0804C214:
	ldrh r0, [r6]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrh r0, [r1]
	cmp r0, #0x17
	bne _0804C22A
	adds r0, r7, #0
	bl sub_0804C4A8
_0804C22A:
	ldrh r0, [r6]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrh r0, [r1]
	cmp r0, #0x11
	bne _0804C240
	adds r0, r7, #0
	bl sub_0804C578
_0804C240:
	adds r0, r7, #0
	bl sub_0804C098
_0804C246:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C254: .4byte gUnknown_03004500
_0804C258: .4byte gUnknown_08136054
_0804C25C: .4byte gUnknown_08551CFC
_0804C260: .4byte gUnknown_08136058
_0804C264: .4byte gUnknown_02029A10

