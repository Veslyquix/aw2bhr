	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801B6FC
sub_0801B6FC: @ 0x0801B6FC
	push {lr}
	ldr r1, _0801B708 @ =gUnknown_03006511
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_0801B708: .4byte gUnknown_03006511

