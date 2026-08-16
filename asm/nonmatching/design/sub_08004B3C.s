	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08004B3C
sub_08004B3C: @ 0x08004B3C
	push {lr}
	ldr r0, _08004B48 @ =gUnknown_084877F4
	bl sub_080193B0
	pop {r0}
	bx r0
	.align 2, 0
_08004B48: .4byte gUnknown_084877F4

