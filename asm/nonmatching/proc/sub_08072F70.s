	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072F70
sub_08072F70: @ 0x08072F70
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r7, r0, #0
	movs r0, #0
	mov sl, r0
	ldr r0, [r7, #0x58]
	cmp sl, r0
	bge _08073078
	adds r1, r7, #0
	adds r1, #0x68
	str r1, [sp, #8]
	ldr r2, _080730C0 @ =gSinLut
	str r2, [sp, #0xc]
	adds r4, r7, #0
	adds r4, #0x5f
	str r4, [sp, #0x10]
_08072F98:
	mov r0, sl
	lsls r1, r0, #1
	adds r0, r7, #0
	adds r0, #0x2a
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r3, [r7, #0x64]
	ldr r4, [sp, #8]
	ldrb r0, [r4]
	str r0, [sp]
	movs r0, #0
	movs r2, #0x14
	rsbs r2, r2, #0
	bl Interpolate
	str r0, [sp, #4]
	ldr r3, [r7, #0x64]
	ldrb r0, [r4]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x10
	bl Interpolate
	mov sb, r0
	ldr r0, [sp, #0xc]
	adds r0, #0x80
	movs r1, #0
	ldrsh r6, [r0, r1]
	lsls r6, r6, #4
	adds r0, r6, #0
	mov r1, sb
	bl Div
	mov r8, r0
	mov r2, r8
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r8, r2
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
	adds r0, r6, #0
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r2, [sp, #0x10]
	ldrb r0, [r2]
	add r0, sl
	str r1, [sp]
	mov r1, r8
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldr r0, _080730C4 @ =0x000001FF
	ldr r4, [sp, #4]
	ands r0, r4
	ldr r2, [sp, #0x10]
	ldrb r1, [r2]
	add r1, sl
	lsls r1, r1, #9
	orrs r1, r0
	adds r0, r7, #0
	adds r0, #0x54
	ldrb r2, [r0]
	movs r4, #0x80
	lsls r4, r4, #1
	orrs r2, r4
	adds r0, #8
	mov r4, sl
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
	ldr r3, _080730C8 @ =gUnknown_081CC01C
	bl PutSpriteExt
	movs r0, #1
	add sl, r0
	ldr r0, [r7, #0x58]
	cmp sl, r0
	blt _08072F98
_08073078:
	ldr r0, [r7, #0x64]
	adds r0, #1
	str r0, [r7, #0x64]
	adds r1, r7, #0
	adds r1, #0x68
	ldrb r2, [r1]
	cmp r0, r2
	bne _080730B0
	movs r4, #0
	mov sl, r4
	ldr r0, [r7, #0x58]
	cmp sl, r0
	bge _080730A6
	ldr r3, _080730CC @ =0x0000FFEC
	adds r2, r7, #0
	adds r2, #0x2a
_08073098:
	strh r3, [r2]
	adds r2, #2
	movs r0, #1
	add sl, r0
	ldr r0, [r7, #0x58]
	cmp sl, r0
	blt _08073098
_080730A6:
	movs r0, #0
	strb r0, [r1]
	adds r0, r7, #0
	bl Proc_Break
_080730B0:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080730C0: .4byte gSinLut
_080730C4: .4byte 0x000001FF
_080730C8: .4byte gUnknown_081CC01C
_080730CC: .4byte 0x0000FFEC

