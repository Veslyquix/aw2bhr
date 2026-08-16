	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802A528
sub_0802A528: @ 0x0802A528
	push {lr}
	ldr r0, _0802A534 @ =gUnknown_0849A108
	bl sub_0801537C
	pop {r0}
	bx r0
	.align 2, 0
_0802A534: .4byte gUnknown_0849A108

