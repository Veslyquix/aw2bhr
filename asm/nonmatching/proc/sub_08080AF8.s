	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08080AF8
sub_08080AF8: @ 0x08080AF8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r6, #0
	adds r4, #0x4c
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0x10
	bgt _08080B22
	adds r3, r0, #0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0x1e
	bl Interpolate
	str r0, [r6, #0x2c]
_08080B22:
	ldr r2, _08080BB0 @ =0x000011CA
	movs r0, #1
	str r0, [sp]
	movs r0, #0xa8
	movs r1, #0xa0
	movs r3, #2
	bl sub_08043C28
	movs r5, #0
	ldr r0, [r6, #0x2c]
	mov sb, r4
	cmp r5, r0
	bge _08080B6E
	ldr r3, _08080BB4 @ =gUnknown_0848B688
	mov r8, r3
	ldr r7, _08080BB8 @ =0x000003BA
_08080B42:
	lsls r4, r5, #3
	movs r1, #0xe8
	subs r1, r1, r4
	str r7, [sp]
	movs r0, #0
	movs r2, #0x88
	lsls r2, r2, #3
	mov r3, r8
	bl PutSpriteExt
	str r7, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x8b
	lsls r2, r2, #3
	mov r3, r8
	bl PutSpriteExt
	adds r5, #1
	ldr r0, [r6, #0x2c]
	cmp r5, r0
	blt _08080B42
_08080B6E:
	movs r5, #0
	ldr r0, [r6, #0x58]
	cmp r5, r0
	bge _08080B9A
	ldr r7, _08080BBC @ =gUnknown_030058D0
	ldr r4, _08080BC0 @ =0x0000030A
_08080B7A:
	ldr r0, _08080BC4 @ =gUnknown_030059A0
	adds r0, r5, r0
	ldrb r0, [r0]
	ldr r1, [r7]
	adds r1, r1, r0
	str r4, [sp]
	movs r0, #0
	movs r2, #0x40
	ldr r3, _08080BC8 @ =gUnknown_0848B6E6
	bl PutSprite
	adds r4, #8
	adds r5, #1
	ldr r0, [r6, #0x58]
	cmp r5, r0
	blt _08080B7A
_08080B9A:
	mov r0, sb
	ldrh r1, [r0]
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0x4f
	bgt _08080BCC
	adds r0, r1, #1
	mov r3, sb
	strh r0, [r3]
	b _08080BE0
	.align 2, 0
_08080BB0: .4byte 0x000011CA
_08080BB4: .4byte gUnknown_0848B688
_08080BB8: .4byte 0x000003BA
_08080BBC: .4byte gUnknown_030058D0
_08080BC0: .4byte 0x0000030A
_08080BC4: .4byte gUnknown_030059A0
_08080BC8: .4byte gUnknown_0848B6E6
_08080BCC:
	movs r0, #0
	mov r1, sb
	strh r0, [r1]
	adds r1, r6, #0
	adds r1, #0x4e
	movs r0, #0x1e
	strh r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_08080BE0:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

