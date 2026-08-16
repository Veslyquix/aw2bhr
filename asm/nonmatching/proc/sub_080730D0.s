	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080730D0
sub_080730D0: @ 0x080730D0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	movs r0, #0
	mov sl, r0
	ldr r0, [r7, #0x58]
	cmp sl, r0
	bge _080731CA
	adds r1, r7, #0
	adds r1, #0x68
	str r1, [sp, #8]
	ldr r2, _0807321C @ =gSinLut
	str r2, [sp, #0xc]
_080730F2:
	mov r4, sl
	lsls r1, r4, #1
	adds r0, r7, #0
	adds r0, #0x2a
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, r7, #0
	adds r0, #0x46
	add r0, sl
	ldrb r2, [r0]
	ldr r3, [r7, #0x64]
	ldr r4, [sp, #8]
	ldrb r0, [r4]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	str r0, [sp, #4]
	ldr r3, [r7, #0x64]
	ldrb r0, [r4]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0x80
	lsls r2, r2, #1
	bl Interpolate
	mov sb, r0
	ldr r0, [sp, #0xc]
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
	ldr r0, [sp, #0xc]
	movs r1, #0
	ldrsh r4, [r0, r1]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
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
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	mov r0, sl
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldr r0, _08073220 @ =0x000001FF
	ldr r2, [sp, #4]
	ands r0, r2
	mov r4, sl
	lsls r1, r4, #9
	orrs r1, r0
	adds r0, r7, #0
	adds r0, #0x54
	ldrb r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	orrs r2, r0
	adds r0, r7, #0
	adds r0, #0x5c
	lsls r3, r4, #3
	ldrh r0, [r0]
	adds r3, r3, r0
	adds r0, r7, #0
	adds r0, #0x5e
	ldrb r0, [r0]
	lsls r0, r0, #0xc
	adds r3, r3, r0
	str r3, [sp]
	movs r0, #1
	ldr r3, _08073224 @ =gUnknown_081CC01C
	bl PutSpriteExt
	movs r1, #1
	add sl, r1
	ldr r0, [r7, #0x58]
	cmp sl, r0
	blt _080730F2
_080731CA:
	ldr r0, [r7, #0x64]
	adds r0, #1
	str r0, [r7, #0x64]
	adds r1, r7, #0
	adds r1, #0x68
	ldrb r2, [r1]
	cmp r0, r2
	bne _0807320A
	movs r4, #0
	mov sl, r4
	ldr r0, [r7, #0x58]
	cmp sl, r0
	bge _08073200
	adds r3, r7, #0
	adds r3, #0x46
	adds r2, r7, #0
	adds r2, #0x2a
_080731EC:
	mov r4, sl
	adds r0, r3, r4
	ldrb r0, [r0]
	strh r0, [r2]
	adds r2, #2
	movs r0, #1
	add sl, r0
	ldr r0, [r7, #0x58]
	cmp sl, r0
	blt _080731EC
_08073200:
	movs r0, #0
	strb r0, [r1]
	adds r0, r7, #0
	bl Proc_Break
_0807320A:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807321C: .4byte gSinLut
_08073220: .4byte 0x000001FF
_08073224: .4byte gUnknown_081CC01C

