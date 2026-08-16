	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807C2D4
sub_0807C2D4: @ 0x0807C2D4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r8, r0
	ldr r4, _0807C384 @ =gSinLut
	adds r0, r4, #0
	adds r0, #0x80
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r6, r0, #4
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r6, #0
	adds r1, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sb, r0
	movs r0, #0
	ldrsh r4, [r4, r0]
	rsbs r0, r4, #0
	lsls r2, r0, #4
	mov r1, r8
	ldr r0, [r1, #0x60]
	lsls r0, r0, #4
	adds r1, r0, #0
	adds r1, #0x10
	cmp r1, #0
	bne _0807C316
	movs r1, #2
_0807C316:
	adds r0, r2, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	lsls r0, r4, #4
	adds r1, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	mov r1, r8
	ldr r0, [r1, #0x60]
	lsls r0, r0, #4
	adds r1, r0, #0
	adds r1, #0x10
	cmp r1, #0
	bne _0807C33C
	movs r1, #2
_0807C33C:
	adds r0, r6, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	mov r1, sb
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	movs r6, #0x84
	lsls r6, r6, #1
	ldr r3, _0807C388 @ =gUnknown_08615C62
	movs r0, #0
	str r0, [sp]
	movs r1, #0x68
	adds r2, r6, #0
	bl PutSpriteExt
	bl sub_0803840C
	adds r4, r0, #0
	cmp r4, #9
	bgt _0807C390
	ldr r3, _0807C38C @ =gUnknown_0848B690
	lsls r0, r4, #2
	adds r0, #0x1c
	str r0, [sp]
	movs r0, #0
	movs r1, #0xca
	adds r2, r6, #0
	bl PutSpriteExt
	b _0807C412
	.align 2, 0
_0807C384: .4byte gSinLut
_0807C388: .4byte gUnknown_08615C62
_0807C38C: .4byte gUnknown_0848B690
_0807C390:
	adds r0, r4, #0
	movs r1, #0xa
	bl Div
	lsls r0, r0, #2
	adds r0, #0x1c
	ldr r5, _0807C3CC @ =gUnknown_0848B690
	str r0, [sp]
	movs r0, #0
	movs r1, #0xc8
	adds r2, r6, #0
	adds r3, r5, #0
	bl PutSpriteExt
	adds r0, r4, #0
	movs r1, #0xa
	bl Div
	cmp r0, #1
	bne _0807C3D0
	adds r0, r4, #0
	movs r1, #0xa
	bl DivRem
	lsls r0, r0, #2
	adds r0, #0x1c
	str r0, [sp]
	movs r0, #0
	movs r1, #0xd2
	b _0807C3EE
	.align 2, 0
_0807C3CC: .4byte gUnknown_0848B690
_0807C3D0:
	adds r0, r4, #0
	movs r1, #0xa
	bl Div
	cmp r0, #7
	bne _0807C3F8
	adds r0, r4, #0
	movs r1, #0xa
	bl DivRem
	lsls r0, r0, #2
	adds r0, #0x1c
	str r0, [sp]
	movs r0, #0
	movs r1, #0xd5
_0807C3EE:
	adds r2, r6, #0
	adds r3, r5, #0
	bl PutSpriteExt
	b _0807C412
_0807C3F8:
	adds r0, r4, #0
	movs r1, #0xa
	bl DivRem
	lsls r0, r0, #2
	adds r0, #0x1c
	str r0, [sp]
	movs r0, #0
	movs r1, #0xd6
	adds r2, r6, #0
	adds r3, r5, #0
	bl PutSpriteExt
_0807C412:
	mov r1, r8
	ldr r0, [r1, #0x60]
	adds r0, #1
	str r0, [r1, #0x60]
	movs r5, #0
	cmp r5, r0
	bge _0807C45A
	ldr r7, _0807C468 @ =gUnknown_0848B6A8
	movs r6, #0x18
	movs r4, #0x78
_0807C426:
	mov r0, r8
	ldr r1, [r0, #0x60]
	lsls r1, r1, #3
	subs r1, r4, r1
	str r6, [sp]
	movs r0, #0
	movs r2, #0x30
	adds r3, r7, #0
	bl PutSprite
	mov r0, r8
	ldr r1, [r0, #0x60]
	lsls r1, r1, #3
	subs r1, r4, r1
	str r6, [sp]
	movs r0, #0
	movs r2, #0x32
	adds r3, r7, #0
	bl PutSprite
	adds r4, #0x10
	adds r5, #1
	mov r1, r8
	ldr r0, [r1, #0x60]
	cmp r5, r0
	blt _0807C426
_0807C45A:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807C468: .4byte gUnknown_0848B6A8

