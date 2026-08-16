	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08075C98
sub_08075C98: @ 0x08075C98
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r6, r7, #0
	adds r6, #0x4c
	movs r1, #0
	ldrsh r0, [r6, r1]
	movs r1, #0x20
	bl sub_08075AC4
	bl sub_080135A4
	ldr r0, [r7, #0x2c]
	adds r0, #0x10
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	cmp r0, r8
	bhi _08075D8C
	ldr r1, [r7, #0x30]
	movs r0, #0x10
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08075D8C
	cmp r1, #0xa0
	bgt _08075D8C
	movs r0, #0
	ldrsh r3, [r6, r0]
	movs r5, #0x20
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	adds r4, r0, #0
	movs r1, #0
	ldrsh r3, [r6, r1]
	str r5, [sp]
	movs r0, #0
	mov r1, r8
	movs r2, #8
	bl Interpolate
	mov sl, r0
	movs r2, #0
	ldrsh r3, [r6, r2]
	str r5, [sp]
	movs r0, #0
	mov r1, r8
	movs r2, #8
	bl Interpolate
	mov sb, r0
	ldr r5, _08075DB4 @ =gSinLut
	movs r3, #0xff
	ands r4, r3
	adds r0, r4, #0
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r1, r1, #4
	mov r8, r1
	mov r0, r8
	mov r1, sl
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	lsls r4, r4, #1
	adds r4, r4, r5
	movs r3, #0
	ldrsh r4, [r4, r3]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #4
	adds r0, r4, #0
	mov r1, sl
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, r8
	mov r1, sb
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldr r0, [r7, #0x54]
	ldr r1, [r7, #0x2c]
	subs r1, #8
	ldr r2, _08075DB8 @ =0x000001FF
	ands r1, r2
	ldr r2, [r7, #0x30]
	subs r2, #8
	movs r3, #0xff
	ands r2, r3
	movs r3, #0xc0
	lsls r3, r3, #2
	orrs r2, r3
	bl sub_0801C254
_08075D8C:
	adds r1, r7, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x20
	ble _08075DA4
	adds r0, r7, #0
	bl Proc_Break
_08075DA4:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075DB4: .4byte gSinLut
_08075DB8: .4byte 0x000001FF

