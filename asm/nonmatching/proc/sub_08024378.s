	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08024378
sub_08024378: @ 0x08024378
	push {r4, r5, lr}
	ldr r3, _080243E8 @ =gUnknown_03002B6C
	ldrb r2, [r3]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3]
	ldr r3, _080243EC @ =gUnknown_03001FE8
	ldrb r2, [r3]
	adds r0, r1, #0
	ands r0, r2
	movs r5, #2
	orrs r0, r5
	strb r0, [r3]
	ldr r2, _080243F0 @ =gUnknown_030030B4
	ldrb r0, [r2]
	ands r1, r0
	movs r4, #1
	orrs r1, r4
	strb r1, [r2]
	ldr r2, _080243F4 @ =gUnknown_0300251C
	ldrb r0, [r2]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2]
	bl sub_08012358
	ldr r2, _080243F8 @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	orrs r0, r4
	strb r0, [r2]
	ldrb r0, [r2, #1]
	orrs r0, r5
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r1, _080243FC @ =gUnknown_03002020
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08024400 @ =gUnknown_03002B28
	movs r0, #0x10
	strh r0, [r1]
	bl sub_0801237C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080243E8: .4byte gUnknown_03002B6C
_080243EC: .4byte gUnknown_03001FE8
_080243F0: .4byte gUnknown_030030B4
_080243F4: .4byte gUnknown_0300251C
_080243F8: .4byte gUnknown_030030E0
_080243FC: .4byte gUnknown_03002020
_08024400: .4byte gUnknown_03002B28

