	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807567C
sub_0807567C: @ 0x0807567C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	ldr r3, [r7, #0x3c]
	ldr r0, [r7, #0x38]
	str r0, [sp]
	movs r0, #5
	bl Interpolate
	mov sl, r0
	ldr r3, [r7, #0x3c]
	ldr r0, [r7, #0x38]
	str r0, [sp]
	movs r0, #0
	movs r1, #0xa
	movs r2, #1
	bl Interpolate
	adds r4, r0, #0
	ldr r3, [r7, #0x3c]
	ldr r0, [r7, #0x38]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #6
	bl Interpolate
	str r0, [sp, #4]
	ldrh r0, [r7, #0x34]
	adds r0, r0, r4
	strh r0, [r7, #0x34]
	ldr r1, _080757B0 @ =gSinLut
	mov r8, r1
	movs r2, #0xff
	mov sb, r2
	ands r0, r2
	adds r0, #0x40
	lsls r0, r0, #1
	add r0, r8
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	ldrh r1, [r7, #0x34]
	mov r0, sb
	ands r0, r1
	lsls r0, r0, #1
	add r0, r8
	movs r2, #0
	ldrsh r0, [r0, r2]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	ldrh r1, [r7, #0x34]
	mov r0, sb
	ands r0, r1
	lsls r0, r0, #1
	add r0, r8
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldrh r1, [r7, #0x34]
	mov r0, sb
	ands r0, r1
	adds r0, #0x40
	lsls r0, r0, #1
	add r0, r8
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0xd
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldr r1, [r7, #0x2c]
	subs r1, #0x20
	ldr r0, _080757B4 @ =0x000001FF
	ands r1, r0
	movs r0, #0xd0
	lsls r0, r0, #5
	orrs r1, r0
	ldr r2, [r7, #0x30]
	subs r2, #0x20
	mov r0, sb
	ands r2, r0
	movs r0, #0xe0
	lsls r0, r0, #3
	orrs r2, r0
	ldr r3, _080757B8 @ =gUnknown_086143D8
	movs r0, #0
	str r0, [sp]
	movs r0, #5
	bl PutSpriteExt
	ldr r2, _080757BC @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080757C0 @ =gUnknown_03002020
	mov r1, sp
	ldrh r1, [r1, #4]
	strh r1, [r0]
	ldr r1, _080757C4 @ =gUnknown_03002B28
	movs r0, #0x10
	strh r0, [r1]
	ldr r0, _080757C8 @ =gUnknown_03001FFC
	movs r2, #0
	strh r2, [r0]
	ldr r1, [r7, #0x3c]
	ldr r0, [r7, #0x38]
	cmp r1, r0
	blt _080757CC
	movs r0, #1
	str r0, [r7, #0x40]
	adds r0, r7, #0
	bl Proc_Break
	b _080757D0
	.align 2, 0
_080757B0: .4byte gSinLut
_080757B4: .4byte 0x000001FF
_080757B8: .4byte gUnknown_086143D8
_080757BC: .4byte gUnknown_030030E0
_080757C0: .4byte gUnknown_03002020
_080757C4: .4byte gUnknown_03002B28
_080757C8: .4byte gUnknown_03001FFC
_080757CC:
	adds r0, r1, #1
	str r0, [r7, #0x3c]
_080757D0:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

