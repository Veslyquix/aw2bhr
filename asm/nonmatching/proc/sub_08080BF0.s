	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08080BF0
sub_08080BF0: @ 0x08080BF0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x4c
	movs r1, #0
	ldrsh r0, [r7, r1]
	cmp r0, #0x10
	bgt _08080C2C
	adds r3, r0, #0
	movs r4, #0x10
	str r4, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0x60
	bl Interpolate
	str r0, [r6, #0x2c]
	movs r0, #0
	ldrsh r3, [r7, r0]
	str r4, [sp]
	movs r0, #1
	movs r1, #0x1e
	movs r2, #0
	bl Interpolate
	str r0, [r6, #0x30]
_08080C2C:
	ldr r2, _08080D0C @ =0x000011CA
	movs r0, #1
	str r0, [sp]
	movs r0, #0xa8
	movs r1, #0xa0
	movs r3, #0
	bl sub_08043C28
	movs r5, #0
	ldr r0, [r6, #0x30]
	mov sb, r7
	cmp r5, r0
	bge _08080C78
	ldr r1, _08080D10 @ =gUnknown_0848B688
	mov r8, r1
	ldr r7, _08080D14 @ =0x000003BA
_08080C4C:
	lsls r4, r5, #3
	str r7, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x88
	lsls r2, r2, #3
	mov r3, r8
	bl PutSpriteExt
	movs r1, #0xe8
	subs r1, r1, r4
	str r7, [sp]
	movs r0, #0
	movs r2, #0x8b
	lsls r2, r2, #3
	mov r3, r8
	bl PutSpriteExt
	adds r5, #1
	ldr r0, [r6, #0x30]
	cmp r5, r0
	blt _08080C4C
_08080C78:
	movs r5, #0
	ldr r0, [r6, #0x58]
	cmp r5, r0
	bge _08080CD8
	ldr r7, _08080D18 @ =gUnknown_030058D0
_08080C82:
	adds r0, r5, #0
	movs r1, #4
	bl DivRem
	ldr r1, _08080D1C @ =gUnknown_030059A0
	adds r1, r5, r1
	ldrb r1, [r1]
	ldr r4, [r7]
	adds r4, r4, r1
	ldr r1, _08080D20 @ =gUnknown_0861695C
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, [r6, #0x2c]
	muls r0, r1, r0
	adds r4, r4, r0
	adds r0, r5, #0
	movs r1, #4
	bl DivRem
	ldr r1, _08080D24 @ =gUnknown_08616964
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, [r6, #0x2c]
	adds r2, r0, #0
	muls r2, r1, r2
	adds r2, #0x40
	lsls r0, r5, #3
	ldr r1, _08080D28 @ =0x0000030A
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	ldr r3, _08080D2C @ =gUnknown_0848B6E6
	bl PutSprite
	adds r5, #1
	ldr r0, [r6, #0x58]
	cmp r5, r0
	blt _08080C82
_08080CD8:
	mov r4, sb
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #0x30
	bne _08080CE8
	adds r0, r6, #0
	bl sub_08080E40
_08080CE8:
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0x40
	bne _08080CF6
	adds r0, r6, #0
	bl Proc_Break
_08080CF6:
	mov r2, sb
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080D0C: .4byte 0x000011CA
_08080D10: .4byte gUnknown_0848B688
_08080D14: .4byte 0x000003BA
_08080D18: .4byte gUnknown_030058D0
_08080D1C: .4byte gUnknown_030059A0
_08080D20: .4byte gUnknown_0861695C
_08080D24: .4byte gUnknown_08616964
_08080D28: .4byte 0x0000030A
_08080D2C: .4byte gUnknown_0848B6E6

