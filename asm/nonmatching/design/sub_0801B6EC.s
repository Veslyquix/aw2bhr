	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801B6EC
sub_0801B6EC: @ 0x0801B6EC
	push {lr}
	ldr r1, _0801B6F8 @ =gUnknown_0300619D
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_0801B6F8: .4byte gUnknown_0300619D

