	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080750C0
sub_080750C0: @ 0x080750C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x80
	lsls r0, r0, #1
	mov sb, r0
	ldrh r3, [r7, #0x3a]
	movs r0, #0xa
	str r0, [sp]
	movs r0, #4
	movs r1, #8
	mov r2, sb
	bl Interpolate
	mov sl, r0
	ldr r4, _08075190 @ =gSinLut
	adds r0, r4, #0
	adds r0, #0x80
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
	movs r0, #0xc
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldrh r1, [r7, #0x34]
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r0, r2, #0
	orrs r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r0, [r7, #0x36]
	mov r2, sb
	orrs r2, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r3, _08075194 @ =gUnknown_081CC4F0
	ldr r4, _08075198 @ =gUnknown_0861433C
	ldrh r0, [r7, #0x38]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	str r0, [sp]
	movs r0, #1
	bl PutSpriteExt
	cmp sl, sb
	bne _0807517A
	movs r0, #0
	strh r0, [r7, #0x3a]
	adds r0, r7, #0
	bl Proc_Break
_0807517A:
	ldrh r0, [r7, #0x3a]
	adds r0, #1
	strh r0, [r7, #0x3a]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075190: .4byte gSinLut
_08075194: .4byte gUnknown_081CC4F0
_08075198: .4byte gUnknown_0861433C

