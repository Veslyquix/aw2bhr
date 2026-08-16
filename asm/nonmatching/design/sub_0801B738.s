	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801B738
sub_0801B738: @ 0x0801B738
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, _0801B74C @ =gUnknown_03005C89
	bl _call_via_r4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801B74C: .4byte gUnknown_03005C89

