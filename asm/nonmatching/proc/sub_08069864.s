	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08069864
sub_08069864: @ 0x08069864
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, _08069908 @ =gUnknown_0202F204
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_080674F4
	str r0, [r4, #0x2c]
	ldr r0, _0806990C @ =gUnknown_08581438
	bl sub_080670F8
	ldr r2, _08069910 @ =gUnknown_030030CC
	ldrb r1, [r2]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	ldrb r0, [r2, #1]
	movs r4, #1
	orrs r0, r4
	movs r5, #2
	orrs r0, r5
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r3, _08069914 @ =gUnknown_03002B6C
	ldrb r2, [r3]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3]
	ldr r3, _08069918 @ =gUnknown_03001FE8
	ldrb r2, [r3]
	adds r0, r1, #0
	ands r0, r2
	orrs r0, r4
	strb r0, [r3]
	ldr r2, _0806991C @ =gUnknown_0300251C
	ldrb r0, [r2]
	ands r1, r0
	orrs r1, r5
	strb r1, [r2]
	ldr r2, _08069920 @ =gUnknown_030030B4
	ldrb r0, [r2]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2]
	bl sub_08012358
	bl sub_080697CC
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_08072C40
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl sub_08072C40
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl sub_08072C40
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl sub_08072C40
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069908: .4byte gUnknown_0202F204
_0806990C: .4byte gUnknown_08581438
_08069910: .4byte gUnknown_030030CC
_08069914: .4byte gUnknown_03002B6C
_08069918: .4byte gUnknown_03001FE8
_0806991C: .4byte gUnknown_0300251C
_08069920: .4byte gUnknown_030030B4

