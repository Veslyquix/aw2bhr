	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08040EF4
sub_08040EF4: @ 0x08040EF4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldrh r0, [r7, #0x3c]
	ldr r6, _08041034 @ =0x000001FF
	ands r6, r0
	ldrh r0, [r7, #0x3e]
	movs r1, #0xff
	mov r8, r1
	mov r2, r8
	ands r2, r0
	mov r8, r2
	adds r3, r7, #0
	adds r3, #0x46
	str r3, [sp, #4]
	ldrh r0, [r3]
	movs r1, #0x14
	subs r0, r1, r0
	lsls r0, r0, #8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sb, r0
	movs r2, #0x80
	lsls r2, r2, #1
	mov sl, r2
	subs r0, r2, r0
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	adds r5, r0, #0
	adds r0, r7, #0
	adds r0, #0x42
	ldrh r0, [r0]
	subs r0, #0x10
	ldrh r3, [r7, #0x3e]
	adds r0, r0, r3
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r5, r5, r0
	movs r1, #0xff
	ands r5, r1
	ldr r2, [sp, #4]
	ldrh r4, [r2]
	subs r4, #0x14
	lsls r4, r4, #0x11
	asrs r4, r4, #0x10
	adds r4, r4, r0
	ands r4, r1
	ldr r0, [r7, #0x2c]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r2, r3, #0
	lsls r6, r6, #0x10
	str r6, [sp, #8]
	asrs r6, r6, #0x10
	adds r1, r6, #0
	orrs r1, r2
	mov r2, r8
	mov r3, sl
	orrs r2, r3
	bl sub_0801C254
	ldr r0, [r7, #0x38]
	movs r1, #0xc0
	lsls r1, r1, #3
	adds r2, r1, #0
	adds r1, r6, #0
	orrs r1, r2
	mov r2, sl
	orrs r5, r2
	adds r2, r5, #0
	bl sub_0801C254
	ldr r0, [r7, #0x34]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r6, r1
	mov r1, sl
	orrs r4, r1
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_0801C254
	ldr r4, _08041038 @ =gSinLut
	adds r0, r4, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r5, r0, #4
	adds r0, r5, #0
	mov r1, sl
	bl Div
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	movs r3, #0
	ldrsh r4, [r4, r3]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	movs r1, #2
	mov r2, sb
	cmp r2, #0
	beq _08040FD4
	mov r1, sb
_08040FD4:
	bl Div
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	lsls r0, r4, #4
	mov r1, sl
	bl Div
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	movs r1, #2
	mov r3, sb
	cmp r3, #0
	beq _08040FF2
	mov r1, sb
_08040FF2:
	adds r0, r5, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #3
	adds r1, r7, #0
	adds r2, r6, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldr r1, [sp, #8]
	lsrs r0, r1, #0x10
	mov r1, r8
	subs r1, #0xc
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, [sp, #4]
	ldrh r2, [r3]
	movs r3, #0x14
	subs r2, r3, r2
	bl sub_0802BD54
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041034: .4byte 0x000001FF
_08041038: .4byte gSinLut

