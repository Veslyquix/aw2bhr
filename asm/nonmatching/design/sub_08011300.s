	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08011300
sub_08011300: @ 0x08011300
	ldr r1, _08011348 @ =gDispIo
	ldrb r0, [r1, #1]
	movs r3, #0x20
	orrs r0, r3
	strb r0, [r1, #1]
	ldr r2, _0801134C @ =gUnknown_030030A4
	ldrb r1, [r2]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2]
	ldr r2, _08011350 @ =gUnknown_030030DC
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	orrs r0, r3
	strb r0, [r2]
	bx lr
	.align 2, 0
_08011348: .4byte gDispIo
_0801134C: .4byte gUnknown_030030A4
_08011350: .4byte gUnknown_030030DC

