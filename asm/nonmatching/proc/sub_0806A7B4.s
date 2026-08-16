	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806A7B4
sub_0806A7B4: @ 0x0806A7B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, [r6, #0x40]
	ldr r1, [r6, #0x48]
	adds r0, r0, r1
	str r0, [r6, #0x40]
	ldr r0, [r6, #0x44]
	ldr r1, [r6, #0x4c]
	adds r0, r0, r1
	str r0, [r6, #0x44]
	adds r5, r6, #0
	adds r5, #0x58
	ldrh r1, [r5]
	subs r1, #5
	strh r1, [r5]
	ldr r4, _0806A8D0 @ =gSinLut
	adds r0, r4, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #4
	mov sb, r0
	lsls r1, r1, #0x10
	movs r2, #2
	cmp r1, #0
	beq _0806A7F6
	movs r3, #0
	ldrsh r2, [r5, r3]
_0806A7F6:
	mov r0, sb
	adds r1, r2, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
	movs r0, #0
	ldrsh r7, [r4, r0]
	rsbs r0, r7, #0
	lsls r2, r0, #4
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r1, #2
	adds r4, r5, #0
	cmp r0, #0
	beq _0806A81C
	movs r3, #0
	ldrsh r1, [r4, r3]
_0806A81C:
	adds r0, r2, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	lsls r2, r7, #4
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #2
	cmp r0, #0
	beq _0806A836
	adds r1, r0, #0
_0806A836:
	adds r0, r2, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r1, #2
	cmp r0, #0
	beq _0806A84C
	adds r1, r0, #0
_0806A84C:
	mov r0, sb
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	mov r1, sl
	mov r2, r8
	adds r3, r4, #0
	bl SetObjAffine
	ldr r0, [r6, #0x44]
	asrs r2, r0, #0xc
	movs r0, #0x40
	rsbs r0, r0, #0
	cmp r2, r0
	ble _0806A890
	ldr r0, [r6, #0x40]
	asrs r0, r0, #0xc
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r0, r3
	ldr r1, _0806A8D4 @ =0x000001FF
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r2, r3
	movs r2, #0xff
	ands r1, r2
	ldr r2, _0806A8D8 @ =gUnknown_085815C0
	movs r3, #0
	bl sub_0801BD00
_0806A890:
	ldr r1, _0806A8DC @ =gUnknown_0300060C
	ldr r0, [r6, #0x38]
	asrs r0, r0, #0xc
	strh r0, [r1]
	ldr r1, _0806A8E0 @ =gUnknown_0202F210
	ldr r0, [r6, #0x3c]
	asrs r0, r0, #0xc
	strh r0, [r1]
	adds r1, r6, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0806A8C0
	movs r0, #0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x30
	strh r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_0806A8C0:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806A8D0: .4byte gSinLut
_0806A8D4: .4byte 0x000001FF
_0806A8D8: .4byte gUnknown_085815C0
_0806A8DC: .4byte gUnknown_0300060C
_0806A8E0: .4byte gUnknown_0202F210

