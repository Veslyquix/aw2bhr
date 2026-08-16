	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801B724
sub_0801B724: @ 0x0801B724
	push {lr}
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r3, _0801B734 @ =gUnknown_03005E8D
	bl _call_via_r3
	pop {r0}
	bx r0
	.align 2, 0
_0801B734: .4byte gUnknown_03005E8D

