	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08060684
sub_08060684: @ 0x08060684
	push {lr}
	bl sub_0802C0CC
	ldr r0, _0806069C @ =gUnknown_030040D8
	ldr r2, [r0]
	ldrb r1, [r2, #1]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2, #1]
	pop {r0}
	bx r0
	.align 2, 0
_0806069C: .4byte gUnknown_030040D8

