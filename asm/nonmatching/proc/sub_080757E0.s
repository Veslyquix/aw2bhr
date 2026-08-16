	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080757E0
sub_080757E0: @ 0x080757E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldrh r0, [r6, #0x34]
	adds r0, #1
	strh r0, [r6, #0x34]
	ldr r1, _080758B0 @ =gSinLut
	mov sl, r1
	movs r7, #0xff
	ands r0, r7
	adds r0, #0x40
	lsls r0, r0, #1
	add r0, sl
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	mov sb, r1
	bl Div
	mov r8, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	ldrh r1, [r6, #0x34]
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #1
	add r0, sl
	movs r1, #0
	ldrsh r0, [r0, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	ldrh r1, [r6, #0x34]
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #1
	add r0, sl
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldrh r1, [r6, #0x34]
	adds r0, r7, #0
	ands r0, r1
	adds r0, #0x40
	lsls r0, r0, #1
	add r0, sl
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	mov r1, r8
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldr r1, [r6, #0x2c]
	subs r1, #0x20
	ldr r0, _080758B4 @ =0x000001FF
	ands r1, r0
	ldr r2, [r6, #0x30]
	subs r2, #0x20
	ands r2, r7
	movs r0, #0xe0
	lsls r0, r0, #3
	orrs r2, r0
	ldr r3, _080758B8 @ =gUnknown_086143D8
	movs r0, #0
	str r0, [sp]
	movs r0, #5
	bl PutSpriteExt
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080758B0: .4byte gSinLut
_080758B4: .4byte 0x000001FF
_080758B8: .4byte gUnknown_086143D8

