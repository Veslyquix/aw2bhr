	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806A4DC
sub_0806A4DC: @ 0x0806A4DC
	ldr r2, _0806A528 @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	movs r3, #0x11
	rsbs r3, r3, #0
	ands r0, r3
	strb r0, [r2]
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	ands r0, r3
	strb r0, [r2, #1]
	ldr r1, _0806A52C @ =gUnknown_03002020
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0806A530 @ =gUnknown_03002B28
	movs r0, #0x10
	strh r0, [r1]
	bx lr
	.align 2, 0
_0806A528: .4byte gUnknown_030030E0
_0806A52C: .4byte gUnknown_03002020
_0806A530: .4byte gUnknown_03002B28

