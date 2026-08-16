	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804C268
sub_0804C268: @ 0x0804C268
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	mov r8, r0
	mov sb, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	ldr r0, _0804C320 @ =gUnknown_0300453C
	mov r2, r8
	strh r2, [r0]
	ldr r0, _0804C324 @ =gUnknown_0300451C
	strh r1, [r0]
	ldr r1, _0804C328 @ =gUnknown_03004580
	mov r3, r8
	lsls r2, r3, #4
	adds r0, r1, #4
	adds r0, r2, r0
	ldrh r0, [r0]
	mov ip, r0
	adds r1, #2
	adds r2, r2, r1
	ldrh r0, [r2]
	lsls r1, r0, #1
	adds r1, r1, r0
	ldr r2, _0804C32C @ =gUnknown_08552178
	lsls r0, r3, #2
	add r0, r8
	add r0, sb
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r4, r0, #3
	subs r4, r4, r0
	adds r4, #4
	ldr r5, _0804C330 @ =gUnknown_02029BA8
	lsls r6, r3, #5
	adds r0, r6, r5
	ldr r3, [r0]
	ldr r0, _0804C334 @ =gUnknown_08552FB8
	mov sl, r0
	mov r0, ip
	lsls r2, r0, #1
	add r2, ip
	ldr r0, _0804C338 @ =gUnknown_085D6A48
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r1, [r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	adds r0, r0, r2
	lsls r0, r0, #2
	add r0, sl
	ldr r0, [r0]
	adds r5, #4
	adds r6, r6, r5
	ldr r2, [r6]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp]
	movs r1, #1
	bl sub_08015410
	ldr r3, _0804C33C @ =gUnknown_02029A10
	mov r2, sb
	lsls r1, r2, #3
	add r1, sb
	lsls r1, r1, #2
	movs r2, #0xb4
	mov r4, r8
	muls r4, r2, r4
	adds r2, r4, #0
	adds r1, r1, r2
	adds r1, r1, r3
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #0x18]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804C320: .4byte gUnknown_0300453C
_0804C324: .4byte gUnknown_0300451C
_0804C328: .4byte gUnknown_03004580
_0804C32C: .4byte gUnknown_08552178
_0804C330: .4byte gUnknown_02029BA8
_0804C334: .4byte gUnknown_08552FB8
_0804C338: .4byte gUnknown_085D6A48
_0804C33C: .4byte gUnknown_02029A10

