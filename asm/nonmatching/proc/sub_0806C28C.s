	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806C28C
sub_0806C28C: @ 0x0806C28C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	ldr r3, [r7, #0x5c]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	mov sb, r0
	ldr r4, _0806C35C @ =gSinLut
	adds r0, r4, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r1, r1, #4
	mov r8, r1
	mov r0, r8
	mov r1, sb
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r0, #0
	ldrsh r4, [r4, r0]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #4
	adds r0, r4, #0
	mov r1, sb
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
	ldr r3, _0806C360 @ =gUnknown_085816F0
	ldr r1, [r7, #0x58]
	lsls r1, r1, #4
	adds r0, r1, r3
	movs r4, #0xc
	ldrsh r2, [r0, r4]
	adds r2, #0x54
	ldr r0, [r7, #0x60]
	subs r2, r2, r0
	movs r0, #0xff
	ands r2, r0
	movs r0, #0xe0
	lsls r0, r0, #3
	orrs r2, r0
	adds r3, #8
	adds r1, r1, r3
	ldr r3, [r1]
	ldr r0, _0806C364 @ =0x00001090
	str r0, [sp]
	movs r0, #0
	movs r1, #0x84
	bl PutSpriteExt
	ldr r0, [r7, #0x5c]
	cmp r0, #8
	bne _0806C342
	movs r0, #0x79
	bl sub_0803B4DC
_0806C342:
	ldr r0, [r7, #0x5c]
	cmp r0, #0xf
	ble _0806C36C
	movs r0, #0
	str r0, [r7, #0x5c]
	ldr r1, _0806C368 @ =gUnknown_0202F2C0
	movs r0, #1
	str r0, [r1]
	adds r0, r7, #0
	bl Proc_Break
	b _0806C370
	.align 2, 0
_0806C35C: .4byte gSinLut
_0806C360: .4byte gUnknown_085816F0
_0806C364: .4byte 0x00001090
_0806C368: .4byte gUnknown_0202F2C0
_0806C36C:
	adds r0, #1
	str r0, [r7, #0x5c]
_0806C370:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

