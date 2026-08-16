	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08027308
sub_08027308: @ 0x08027308
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, _080273D8 @ =gSinLut
	adds r0, r4, #0
	adds r0, #0x80
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	mov sb, r0
	adds r7, r6, #0
	adds r7, #0x64
	movs r2, #0
	ldrsh r0, [r7, r2]
	movs r1, #2
	cmp r0, #0
	beq _08027334
	adds r1, r0, #0
_08027334:
	mov r0, sb
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
	movs r1, #0
	ldrsh r5, [r4, r1]
	rsbs r0, r5, #0
	lsls r2, r0, #4
	movs r1, #0
	ldrsh r0, [r7, r1]
	movs r1, #2
	adds r4, r7, #0
	cmp r0, #0
	beq _08027358
	movs r0, #0
	ldrsh r1, [r4, r0]
_08027358:
	adds r0, r2, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	lsls r2, r5, #4
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #2
	cmp r0, #0
	beq _08027372
	adds r1, r0, #0
_08027372:
	adds r0, r2, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #2
	cmp r0, #0
	beq _08027388
	adds r1, r0, #0
_08027388:
	mov r0, sb
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	mov r1, sl
	mov r2, r8
	adds r3, r5, #0
	bl SetObjAffine
	ldr r0, [r6, #0x50]
	ldr r1, [r6, #0x2c]
	ldr r2, _080273DC @ =0x000001FF
	ands r1, r2
	ldr r2, [r6, #0x30]
	movs r3, #0xff
	ands r2, r3
	movs r3, #0xc0
	lsls r3, r3, #2
	orrs r2, r3
	bl sub_0801C254
	adds r4, r6, #0
	adds r4, #0x44
	ldrh r1, [r4]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _080273E0
	subs r0, r1, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08027400
	adds r0, r6, #0
	bl Proc_Break
	b _08027400
	.align 2, 0
_080273D8: .4byte gSinLut
_080273DC: .4byte 0x000001FF
_080273E0:
	movs r0, #0
	ldrsh r3, [r7, r0]
	ldr r0, _08027410 @ =0xFFFFFF00
	adds r1, r3, r0
	lsrs r2, r1, #0x1f
	adds r1, r1, r2
	asrs r1, r1, #1
	subs r3, r3, r1
	adds r0, r3, r0
	cmp r0, #4
	bne _080273FE
	movs r3, #0x80
	lsls r3, r3, #1
	movs r0, #0x3c
	strh r0, [r4]
_080273FE:
	strh r3, [r7]
_08027400:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08027410: .4byte 0xFFFFFF00

