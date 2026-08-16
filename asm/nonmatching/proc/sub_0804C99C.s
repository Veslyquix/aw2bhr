	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804C99C
sub_0804C99C: @ 0x0804C99C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _0804CA20 @ =gUnknown_0300453C
	strh r4, [r0]
	ldr r2, _0804CA24 @ =gUnknown_0300451C
	ldr r1, _0804CA28 @ =gUnknown_08552148
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldr r1, _0804CA2C @ =gUnknown_03004580
	lsls r0, r4, #4
	adds r0, r0, r1
	ldrh r6, [r0]
	adds r0, r4, #0
	bl sub_0804C400
	ldr r3, _0804CA30 @ =gUnknown_08557CFC
	lsls r5, r6, #1
	adds r5, r5, r6
	lsls r5, r5, #2
	adds r0, r5, r3
	ldr r0, [r0]
	ldr r1, _0804CA34 @ =gUnknown_08552FB0
	lsls r6, r4, #2
	adds r1, r6, r1
	ldr r1, [r1]
	str r3, [sp, #4]
	bl Decompress
	ldr r0, _0804CA38 @ =gUnknown_08552178
	adds r6, r6, r4
	lsls r6, r6, #1
	adds r0, #8
	adds r0, r6, r0
	ldrh r0, [r0]
	lsls r4, r0, #3
	subs r4, r4, r0
	ldr r0, _0804CA3C @ =gUnknown_0855339C
	ldr r3, [sp, #4]
	adds r1, r3, #0
	adds r1, #8
	adds r1, r5, r1
	ldr r2, [r1]
	adds r3, #4
	adds r5, r5, r3
	ldr r3, [r5]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp]
	movs r1, #1
	bl sub_08015410
	ldr r1, _0804CA40 @ =gUnknown_02029668
	adds r1, #8
	adds r6, r6, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r6]
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804CA20: .4byte gUnknown_0300453C
_0804CA24: .4byte gUnknown_0300451C
_0804CA28: .4byte gUnknown_08552148
_0804CA2C: .4byte gUnknown_03004580
_0804CA30: .4byte gUnknown_08557CFC
_0804CA34: .4byte gUnknown_08552FB0
_0804CA38: .4byte gUnknown_08552178
_0804CA3C: .4byte gUnknown_0855339C
_0804CA40: .4byte gUnknown_02029668

