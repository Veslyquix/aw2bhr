	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803F374
sub_0803F374: @ 0x0803F374
	push {lr}
	ldr r0, _0803F384 @ =gUnknown_081169D0
	ldr r1, _0803F388 @ =0x06013940
	bl Decompress
	pop {r0}
	bx r0
	.align 2, 0
_0803F384: .4byte gUnknown_081169D0
_0803F388: .4byte 0x06013940

