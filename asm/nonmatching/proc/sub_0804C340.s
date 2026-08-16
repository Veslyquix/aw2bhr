	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804C340
sub_0804C340: @ 0x0804C340
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _0804C3E0 @ =gUnknown_0300453C
	mov sb, r1
	strh r0, [r1]
	ldr r7, _0804C3E4 @ =gUnknown_0300451C
	ldr r1, _0804C3E8 @ =gUnknown_08552148
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r7]
	ldr r2, _0804C3EC @ =gUnknown_03004580
	mov r0, sb
	ldrh r4, [r0]
	lsls r1, r4, #4
	adds r0, r2, #4
	adds r0, r1, r0
	ldrh r6, [r0]
	adds r2, #2
	adds r1, r1, r2
	ldrh r0, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	movs r2, #0
	mov sl, r2
	ldr r5, _0804C3F0 @ =gUnknown_02029BA8
	lsls r4, r4, #5
	adds r0, r4, r5
	ldr r3, [r0]
	ldr r0, _0804C3F4 @ =gUnknown_08552FB8
	mov r8, r0
	lsls r2, r6, #1
	adds r2, r2, r6
	ldr r0, _0804C3F8 @ =gUnknown_085D6A48
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r1, [r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	adds r0, r0, r2
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	adds r5, #4
	adds r4, r4, r5
	ldr r2, [r4]
	mov r1, sl
	str r1, [sp]
	movs r1, #1
	bl sub_08015410
	ldr r4, _0804C3FC @ =gUnknown_02029A10
	ldrh r2, [r7]
	lsls r1, r2, #3
	adds r1, r1, r2
	lsls r1, r1, #2
	mov r2, sb
	ldrh r3, [r2]
	movs r2, #0xb4
	muls r2, r3, r2
	adds r1, r1, r2
	adds r1, r1, r4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #0x18]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C3E0: .4byte gUnknown_0300453C
_0804C3E4: .4byte gUnknown_0300451C
_0804C3E8: .4byte gUnknown_08552148
_0804C3EC: .4byte gUnknown_03004580
_0804C3F0: .4byte gUnknown_02029BA8
_0804C3F4: .4byte gUnknown_08552FB8
_0804C3F8: .4byte gUnknown_085D6A48
_0804C3FC: .4byte gUnknown_02029A10

