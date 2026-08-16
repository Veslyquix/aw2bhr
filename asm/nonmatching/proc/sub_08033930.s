	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08033930
sub_08033930: @ 0x08033930
	ldr r2, _08033994 @ =gUnknown_030030A4
	ldrb r0, [r2, #1]
	movs r3, #1
	orrs r0, r3
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	ldr r2, _08033998 @ =gUnknown_030030DC
	ldrb r0, [r2]
	orrs r0, r3
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0803399C @ =gUnknown_03002B68
	movs r0, #0
	strb r0, [r1]
	ldr r1, _080339A0 @ =gUnknown_03002B30
	movs r0, #0x90
	strb r0, [r1]
	ldr r1, _080339A4 @ =gUnknown_030024E4
	movs r0, #0xf0
	strb r0, [r1]
	ldr r1, _080339A8 @ =gUnknown_030020B8
	movs r0, #0xa0
	strb r0, [r1]
	ldr r2, _080339AC @ =gUnknown_030030CC
	ldrb r1, [r2, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	bx lr
	.align 2, 0
_08033994: .4byte gUnknown_030030A4
_08033998: .4byte gUnknown_030030DC
_0803399C: .4byte gUnknown_03002B68
_080339A0: .4byte gUnknown_03002B30
_080339A4: .4byte gUnknown_030024E4
_080339A8: .4byte gUnknown_030020B8
_080339AC: .4byte gUnknown_030030CC

