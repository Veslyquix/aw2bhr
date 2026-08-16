	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080245D4
sub_080245D4: @ 0x080245D4
	push {r4, lr}
	ldr r3, _08024640 @ =gUnknown_03002B6C
	ldrb r2, [r3]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3]
	ldr r3, _08024644 @ =gUnknown_03001FE8
	ldrb r2, [r3]
	adds r0, r1, #0
	ands r0, r2
	movs r4, #2
	orrs r0, r4
	strb r0, [r3]
	ldr r2, _08024648 @ =gUnknown_030030B4
	ldrb r0, [r2]
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r2]
	ldr r2, _0802464C @ =gUnknown_0300251C
	ldrb r0, [r2]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2]
	bl sub_08012358
	ldr r2, _08024650 @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	orrs r0, r4
	strb r0, [r2]
	ldrb r0, [r2, #1]
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r1, _08024654 @ =gUnknown_03002020
	movs r0, #6
	strh r0, [r1]
	ldr r1, _08024658 @ =gUnknown_03002B28
	movs r0, #0x10
	strh r0, [r1]
	bl sub_0801237C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08024640: .4byte gUnknown_03002B6C
_08024644: .4byte gUnknown_03001FE8
_08024648: .4byte gUnknown_030030B4
_0802464C: .4byte gUnknown_0300251C
_08024650: .4byte gUnknown_030030E0
_08024654: .4byte gUnknown_03002020
_08024658: .4byte gUnknown_03002B28

