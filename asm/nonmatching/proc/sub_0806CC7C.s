	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806CC7C
sub_0806CC7C: @ 0x0806CC7C
	push {r4, lr}
	ldr r3, _0806CCD8 @ =gUnknown_030030E0
	ldrb r2, [r3]
	movs r1, #0x3f
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	movs r2, #2
	rsbs r2, r2, #0
	ands r1, r2
	subs r2, #1
	ands r1, r2
	subs r2, #2
	ands r1, r2
	subs r2, #4
	ands r1, r2
	movs r4, #0x11
	rsbs r4, r4, #0
	ands r1, r4
	strb r1, [r3]
	ldrb r1, [r3, #1]
	movs r2, #1
	orrs r1, r2
	movs r2, #2
	orrs r1, r2
	movs r2, #4
	orrs r1, r2
	movs r2, #8
	orrs r1, r2
	ands r1, r4
	strb r1, [r3, #1]
	ldr r2, _0806CCDC @ =gUnknown_03002020
	movs r1, #0
	strh r1, [r2]
	ldr r2, _0806CCE0 @ =gUnknown_03002B28
	movs r1, #0x10
	strh r1, [r2]
	movs r1, #0
	str r1, [r0, #0x34]
	str r1, [r0, #0x2c]
	str r1, [r0, #0x30]
	str r1, [r0, #0x3c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806CCD8: .4byte gUnknown_030030E0
_0806CCDC: .4byte gUnknown_03002020
_0806CCE0: .4byte gUnknown_03002B28

