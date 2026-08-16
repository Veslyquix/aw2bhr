	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806F334
sub_0806F334: @ 0x0806F334
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	mov sl, r0
	ldr r2, _0806F3F8 @ =gDispIo
	ldrb r0, [r2, #1]
	movs r6, #1
	orrs r0, r6
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	movs r1, #0x10
	mov r8, r1
	mov r3, r8
	orrs r0, r3
	strb r0, [r2, #1]
	ldr r3, _0806F3FC @ =gUnknown_03002B6C
	ldrb r2, [r3]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3]
	ldr r3, _0806F400 @ =gUnknown_03001FE8
	ldrb r2, [r3]
	adds r0, r1, #0
	ands r0, r2
	orrs r0, r6
	strb r0, [r3]
	ldr r2, _0806F404 @ =gUnknown_030030B4
	ldrb r0, [r2]
	ands r1, r0
	movs r5, #2
	orrs r1, r5
	strb r1, [r2]
	ldr r2, _0806F408 @ =gUnknown_0300251C
	ldrb r0, [r2]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0806F40C @ =gUnknown_085819E4
	bl sub_080670F8
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_08072C40
	ldr r0, _0806F410 @ =gUnknown_030030A4
	mov sb, r0
	ldrb r1, [r0, #1]
	orrs r1, r6
	orrs r1, r5
	movs r4, #4
	orrs r1, r4
	movs r3, #8
	orrs r1, r3
	mov r0, r8
	orrs r1, r0
	ldr r2, _0806F414 @ =gUnknown_030030DC
	ldrb r0, [r2]
	orrs r0, r6
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	mov r3, r8
	orrs r0, r3
	strb r0, [r2]
	movs r3, #0x20
	orrs r1, r3
	mov r0, sb
	strb r1, [r0, #1]
	ldrb r0, [r2, #1]
	orrs r0, r3
	strb r0, [r2, #1]
	movs r0, #1
	mov r1, sl
	bl sub_0806E8C8
	ldr r0, _0806F418 @ =gUnknown_0202F2D8
	ldrh r0, [r0]
	movs r1, #0x38
	add sl, r1
	mov r3, sl
	strb r0, [r3]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806F3F8: .4byte gDispIo
_0806F3FC: .4byte gUnknown_03002B6C
_0806F400: .4byte gUnknown_03001FE8
_0806F404: .4byte gUnknown_030030B4
_0806F408: .4byte gUnknown_0300251C
_0806F40C: .4byte gUnknown_085819E4
_0806F410: .4byte gUnknown_030030A4
_0806F414: .4byte gUnknown_030030DC
_0806F418: .4byte gUnknown_0202F2D8

