	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08004B6C
sub_08004B6C: @ 0x08004B6C
	push {lr}
	ldr r0, _08004B78 @ =gUnknown_084879D4
	bl sub_080193B0
	pop {r0}
	bx r0
	.align 2, 0
_08004B78: .4byte gUnknown_084879D4

