	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806AA64
sub_0806AA64: @ 0x0806AA64
	push {lr}
	ldr r0, _0806AA78 @ =gUnknown_085815D0
	bl Proc_EndEach
	ldr r0, _0806AA7C @ =gUnknown_085815E8
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0806AA78: .4byte gUnknown_085815D0
_0806AA7C: .4byte gUnknown_085815E8

