	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802E920
sub_0802E920: @ 0x0802E920
	push {lr}
	ldr r1, _0802E93C @ =gUnknown_03007FF8
	movs r0, #1
	strh r0, [r1]
	bl sub_080128D0
	bl sub_08011FF0
	bl sub_0803B3F8
	bl sub_0803B408
	pop {r0}
	bx r0
	.align 2, 0
_0802E93C: .4byte gUnknown_03007FF8

