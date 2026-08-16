	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807EEEC
sub_0807EEEC: @ 0x0807EEEC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	movs r5, #0
	b _0807EFC4
_0807EEFE:
	adds r0, r7, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r3, [r0, r1]
	lsls r1, r5, #5
	adds r4, r5, #1
	cmp r3, r1
	blt _0807EFC2
	adds r0, r1, #0
	adds r0, #0x10
	cmp r3, r0
	bge _0807EF4C
	subs r3, r3, r1
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	movs r1, #0x78
	movs r2, #0
	bl Interpolate
	str r0, [r7, #0x34]
	adds r0, r5, #0
	movs r1, #2
	bl DivRem
	lsls r2, r4, #0xc
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #6
	orrs r2, r1
	ldr r0, [r7, #0x34]
	adds r0, #0xb0
	ldr r1, _0807EF48 @ =0x000001FF
	ands r0, r1
	movs r1, #1
	str r1, [sp]
	b _0807EF70
	.align 2, 0
_0807EF48: .4byte 0x000001FF
_0807EF4C:
	cmp r3, r1
	blt _0807EFC2
	adds r0, r1, #0
	adds r0, #0x14
	cmp r3, r0
	bge _0807EF7A
	adds r0, r5, #0
	movs r1, #2
	bl DivRem
	lsls r2, r4, #0xc
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #6
	orrs r2, r1
	movs r0, #1
	str r0, [sp]
	movs r0, #0xb0
_0807EF70:
	movs r1, #0xa0
	movs r3, #0
	bl sub_08043C28
	b _0807EFC2
_0807EF7A:
	cmp r3, r1
	blt _0807EFC2
	adds r0, r1, #0
	adds r0, #0x34
	cmp r3, r0
	bge _0807EFC2
	movs r2, #0xf0
	rsbs r2, r2, #0
	subs r3, #0x14
	subs r3, r3, r1
	movs r0, #0x20
	str r0, [sp]
	movs r0, #2
	movs r1, #0
	bl Interpolate
	str r0, [r7, #0x34]
	adds r0, r5, #0
	movs r1, #2
	bl DivRem
	lsls r2, r4, #0xc
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #6
	orrs r2, r1
	ldr r0, [r7, #0x34]
	adds r0, #0xb0
	ldr r1, _0807EFD8 @ =0x000001FF
	ands r0, r1
	movs r1, #1
	str r1, [sp]
	movs r1, #0xa0
	movs r3, #0
	bl sub_08043C28
_0807EFC2:
	adds r5, r4, #0
_0807EFC4:
	bl sub_0803BD14
	cmp r5, r0
	blt _0807EEFE
	movs r5, #0
	movs r2, #0x4c
	adds r2, r2, r7
	mov r8, r2
	b _0807F072
	.align 2, 0
_0807EFD8: .4byte 0x000001FF
_0807EFDC:
	mov r0, r8
	movs r1, #0
	ldrsh r3, [r0, r1]
	lsls r1, r5, #5
	adds r0, r1, #0
	adds r0, #0x14
	cmp r3, r0
	bge _0807F020
	bl sub_0803BD14
	adds r1, r0, #0
	subs r1, #3
	subs r1, r5, r1
	lsls r1, r1, #4
	adds r1, #0x6f
	ldr r0, _0807F01C @ =0x000001FF
	ands r1, r0
	lsls r2, r5, #1
	adds r2, r2, r5
	lsls r2, r2, #2
	movs r0, #0xf0
	lsls r0, r0, #2
	adds r2, r2, r0
	movs r0, #0x90
	lsls r0, r0, #8
	orrs r2, r0
	movs r0, #0xc0
	movs r3, #0
	bl sub_08043B60
	b _0807F070
	.align 2, 0
_0807F01C: .4byte 0x000001FF
_0807F020:
	cmp r3, r1
	blt _0807F070
	adds r0, r1, #0
	adds r0, #0x34
	cmp r3, r0
	bge _0807F070
	movs r2, #0x30
	rsbs r2, r2, #0
	subs r3, #0x14
	subs r3, r3, r1
	movs r0, #0x20
	str r0, [sp]
	movs r0, #2
	movs r1, #0xc0
	bl Interpolate
	adds r4, r0, #0
	str r4, [r7, #0x2c]
	bl sub_0803BD14
	adds r1, r0, #0
	subs r1, #3
	subs r1, r5, r1
	lsls r1, r1, #4
	adds r1, #0x6f
	ldr r0, _0807F0F8 @ =0x000001FF
	ands r1, r0
	lsls r2, r5, #1
	adds r2, r2, r5
	lsls r2, r2, #2
	movs r0, #0xf0
	lsls r0, r0, #2
	adds r2, r2, r0
	movs r0, #0x90
	lsls r0, r0, #8
	orrs r2, r0
	adds r0, r4, #0
	movs r3, #0
	bl sub_08043B60
_0807F070:
	adds r5, #1
_0807F072:
	bl sub_0803BD14
	cmp r5, r0
	blt _0807EFDC
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0x34
	bne _0807F09E
	ldr r0, _0807F0FC @ =gUnknown_030058D4
	ldrb r4, [r0, #2]
	movs r0, #2
	movs r1, #2
	bl DivRem
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #6
	adds r0, r4, #0
	movs r2, #3
	bl sub_08043BA4
_0807F09E:
	mov r0, r8
	movs r1, #0
	ldrsh r4, [r0, r1]
	bl sub_0803BD14
	lsls r0, r0, #5
	adds r0, #0x14
	cmp r4, r0
	bne _0807F0BA
	movs r0, #0x14
	movs r1, #0x30
	adds r2, r7, #0
	bl sub_08071B0C
_0807F0BA:
	mov r2, r8
	movs r0, #0
	ldrsh r4, [r2, r0]
	bl sub_0803BD14
	lsls r0, r0, #5
	adds r0, #0x14
	cmp r4, r0
	bge _0807F104
	movs r6, #0xa0
	lsls r6, r6, #2
	movs r4, #0x38
	movs r5, #1
_0807F0D4:
	ldr r1, _0807F0F8 @ =0x000001FF
	ands r1, r4
	movs r0, #0x80
	lsls r0, r0, #7
	orrs r0, r6
	str r0, [sp]
	movs r0, #0
	movs r2, #0x30
	ldr r3, _0807F100 @ =gUnknown_0848B6A0
	bl PutSprite
	adds r6, #0x40
	adds r4, #0x40
	subs r5, #1
	cmp r5, #0
	bge _0807F0D4
	b _0807F1F2
	.align 2, 0
_0807F0F8: .4byte 0x000001FF
_0807F0FC: .4byte gUnknown_030058D4
_0807F100: .4byte gUnknown_0848B6A0
_0807F104:
	bl sub_0803BD14
	mov r1, r8
	movs r2, #0
	ldrsh r3, [r1, r2]
	subs r3, #0x14
	lsls r0, r0, #5
	subs r3, r3, r0
	movs r4, #0x3c
	str r4, [sp]
	movs r0, #5
	movs r1, #0
	movs r2, #0x80
	bl Interpolate
	str r0, [r7, #0x38]
	bl sub_0803BD14
	mov r1, r8
	movs r2, #0
	ldrsh r3, [r1, r2]
	subs r3, #0x14
	lsls r0, r0, #5
	subs r3, r3, r0
	str r4, [sp]
	movs r0, #5
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	str r0, [r7, #0x30]
	ldr r4, _0807F210 @ =gSinLut
	adds r0, r4, #0
	adds r0, #0x80
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	mov sb, r0
	ldr r0, [r7, #0x38]
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r0, r5
	cmp r1, #0
	bne _0807F15E
	movs r1, #2
_0807F15E:
	mov r0, sb
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
	movs r2, #0
	ldrsh r4, [r4, r2]
	rsbs r0, r4, #0
	lsls r2, r0, #4
	ldr r0, [r7, #0x38]
	adds r1, r0, r5
	cmp r1, #0
	bne _0807F17C
	movs r1, #2
_0807F17C:
	adds r0, r2, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	lsls r2, r4, #4
	ldr r0, [r7, #0x38]
	adds r1, r0, r5
	cmp r1, #0
	bne _0807F192
	movs r1, #2
_0807F192:
	adds r0, r2, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	ldr r0, [r7, #0x38]
	adds r1, r0, r5
	cmp r1, #0
	bne _0807F1A6
	movs r1, #2
_0807F1A6:
	mov r0, sb
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	mov r1, sl
	adds r2, r6, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldr r0, [r7, #0x30]
	movs r1, #0x19
	subs r1, r1, r0
	ldr r4, _0807F214 @ =0x000001FF
	ands r1, r4
	movs r5, #0xc4
	lsls r5, r5, #2
	ldr r6, _0807F218 @ =gUnknown_0848B6A0
	movs r0, #0x85
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl PutSpriteExt
	ldr r1, [r7, #0x30]
	adds r1, #0x58
	ands r1, r4
	ldr r0, _0807F21C @ =0x000042C0
	str r0, [sp]
	movs r0, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl PutSpriteExt
_0807F1F2:
	mov r0, r8
	movs r1, #0
	ldrsh r4, [r0, r1]
	bl sub_0803BD14
	lsls r0, r0, #5
	adds r0, #0x50
	cmp r4, r0
	bge _0807F220
	mov r2, r8
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	b _0807F226
	.align 2, 0
_0807F210: .4byte gSinLut
_0807F214: .4byte 0x000001FF
_0807F218: .4byte gUnknown_0848B6A0
_0807F21C: .4byte 0x000042C0
_0807F220:
	adds r0, r7, #0
	bl Proc_Break
_0807F226:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

