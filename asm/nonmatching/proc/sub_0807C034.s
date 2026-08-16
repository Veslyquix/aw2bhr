	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807C034
sub_0807C034: @ 0x0807C034
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov r8, r0
	ldr r1, _0807C084 @ =gUnknown_030058F8
	mov r5, r8
	adds r5, #0x66
	movs r2, #0
	ldrsh r0, [r5, r2]
	str r0, [r1]
	ldr r4, _0807C088 @ =gUnknown_081D9334
	ldr r0, [r4]
	adds r0, #0x80
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r7, r0, #4
	movs r2, #0
	ldrsh r0, [r5, r2]
	movs r1, #0xa
	bl DivRem
	lsls r1, r0, #4
	subs r1, r1, r0
	movs r6, #0xf0
	lsls r6, r6, #1
	mov sb, r4
	cmp r1, r6
	beq _0807C08C
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r1, #0xa
	bl DivRem
	lsls r1, r0, #4
	subs r1, r1, r0
	subs r1, r6, r1
	b _0807C08E
	.align 2, 0
_0807C084: .4byte gUnknown_030058F8
_0807C088: .4byte gUnknown_081D9334
_0807C08C:
	movs r1, #2
_0807C08E:
	adds r0, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	mov r2, sb
	ldr r0, [r2]
	movs r1, #0
	ldrsh r0, [r0, r1]
	rsbs r0, r0, #0
	lsls r6, r0, #4
	mov r4, r8
	adds r4, #0x66
	movs r2, #0
	ldrsh r0, [r4, r2]
	movs r1, #0xa
	bl DivRem
	lsls r1, r0, #4
	subs r1, r1, r0
	movs r5, #0xf0
	lsls r5, r5, #1
	cmp r1, r5
	beq _0807C0D2
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #0xa
	bl DivRem
	lsls r1, r0, #4
	subs r1, r1, r0
	subs r1, r5, r1
	b _0807C0D4
_0807C0D2:
	movs r1, #2
_0807C0D4:
	adds r0, r6, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
	mov r2, sb
	ldr r0, [r2]
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r6, r0, #4
	movs r2, #0
	ldrsh r0, [r4, r2]
	movs r1, #0xa
	bl DivRem
	lsls r1, r0, #4
	subs r1, r1, r0
	movs r5, #0xf0
	lsls r5, r5, #1
	cmp r1, r5
	beq _0807C112
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #0xa
	bl DivRem
	lsls r1, r0, #4
	subs r1, r1, r0
	subs r1, r5, r1
	b _0807C114
_0807C112:
	movs r1, #2
_0807C114:
	adds r0, r6, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	mov r2, sb
	ldr r0, [r2]
	adds r0, #0x80
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r6, r0, #4
	movs r2, #0
	ldrsh r0, [r4, r2]
	movs r1, #0xa
	bl DivRem
	lsls r1, r0, #4
	subs r1, r1, r0
	movs r5, #0xf0
	lsls r5, r5, #1
	cmp r1, r5
	beq _0807C152
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #0xa
	bl DivRem
	lsls r1, r0, #4
	subs r1, r1, r0
	subs r1, r5, r1
	b _0807C154
_0807C152:
	movs r1, #2
_0807C154:
	adds r0, r6, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #1
	ldr r1, [sp, #4]
	mov r2, sl
	adds r3, r7, #0
	bl SetObjAffine
	movs r2, #0
	mov sb, r2
	mov r0, r8
	adds r0, #0x4c
	movs r2, #0
	ldrsh r1, [r0, r2]
	str r0, [sp, #8]
	cmp sb, r1
	bge _0807C250
	mov sl, r4
	movs r0, #0x80
	mov r8, r0
	movs r7, #0xa
	ldr r6, _0807C1EC @ =gUnknown_0202FF78
	movs r5, #0
_0807C18A:
	mov r1, sl
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, r5
	blt _0807C204
	cmp r0, r7
	bge _0807C208
	movs r1, #0xa
	bl Div
	ldr r1, _0807C1F0 @ =gUnknown_0300590C
	str r0, [r1]
	adds r0, #1
	ldr r1, _0807C1EC @ =gUnknown_0202FF78
	adds r0, r0, r1
	ldrb r2, [r0]
	ldrb r0, [r6]
	subs r2, r2, r0
	subs r2, #8
	ldr r0, _0807C1F4 @ =gUnknown_03005960
	str r2, [r0]
	movs r1, #0xd0
	subs r1, r1, r2
	movs r0, #0x80
	lsls r0, r0, #2
	orrs r1, r0
	mov r2, r8
	str r2, [sp]
	movs r0, #0
	movs r2, #0xc2
	lsls r2, r2, #2
	ldr r3, _0807C1F8 @ =gUnknown_0848B6E6
	bl PutSpriteExt
	mov r1, sl
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, r5
	bne _0807C238
	ldr r0, _0807C1FC @ =gUnknown_08616570
	bl Proc_Find
	cmp r0, #0
	bne _0807C238
	ldr r0, _0807C200 @ =0x000001CD
	bl sub_0803B4DC
	b _0807C238
	.align 2, 0
_0807C1EC: .4byte gUnknown_0202FF78
_0807C1F0: .4byte gUnknown_0300590C
_0807C1F4: .4byte gUnknown_03005960
_0807C1F8: .4byte gUnknown_0848B6E6
_0807C1FC: .4byte gUnknown_08616570
_0807C200: .4byte 0x000001CD
_0807C204:
	cmp r0, r7
	blt _0807C238
_0807C208:
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #0xa
	bl Div
	ldr r1, _0807C268 @ =gUnknown_0300590C
	str r0, [r1]
	adds r0, #1
	ldr r2, _0807C26C @ =gUnknown_0202FF78
	adds r0, r0, r2
	ldrb r2, [r0]
	ldrb r0, [r6]
	subs r2, r2, r0
	ldr r0, _0807C270 @ =gUnknown_03005960
	str r2, [r0]
	movs r1, #0xe0
	subs r1, r1, r2
	mov r2, r8
	str r2, [sp]
	movs r0, #0
	movs r2, #0x18
	ldr r3, _0807C274 @ =gUnknown_0848B6E6
	bl PutSprite
_0807C238:
	movs r0, #8
	add r8, r0
	adds r7, #0xa
	adds r6, #1
	adds r5, #0xa
	movs r1, #1
	add sb, r1
	ldr r2, [sp, #8]
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp sb, r0
	blt _0807C18A
_0807C250:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807C268: .4byte gUnknown_0300590C
_0807C26C: .4byte gUnknown_0202FF78
_0807C270: .4byte gUnknown_03005960
_0807C274: .4byte gUnknown_0848B6E6

