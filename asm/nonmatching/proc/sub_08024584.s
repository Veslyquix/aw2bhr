	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08024584
sub_08024584: @ 0x08024584
	push {lr}
	ldr r3, _080245C4 @ =gUnknown_03002B6C
	ldrb r1, [r3]
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r3]
	ldr r3, _080245C8 @ =gUnknown_03001FE8
	ldrb r1, [r3]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r3]
	ldr r1, _080245CC @ =gUnknown_030030B4
	ldrb r0, [r1]
	ands r2, r0
	movs r0, #1
	orrs r2, r0
	strb r2, [r1]
	ldr r2, _080245D0 @ =gUnknown_0300251C
	ldrb r0, [r2]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2]
	bl sub_08012358
	bl sub_0801237C
	pop {r0}
	bx r0
	.align 2, 0
_080245C4: .4byte gUnknown_03002B6C
_080245C8: .4byte gUnknown_03001FE8
_080245CC: .4byte gUnknown_030030B4
_080245D0: .4byte gUnknown_0300251C

