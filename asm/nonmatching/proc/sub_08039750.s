	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08039750
sub_08039750: @ 0x08039750
	push {lr}
	ldr r0, _0803975C @ =gUnknown_0849D6D4
	bl Proc_BreakEach
	pop {r0}
	bx r0
	.align 2, 0
_0803975C: .4byte gUnknown_0849D6D4

