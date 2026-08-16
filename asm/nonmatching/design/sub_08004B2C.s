	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08004B2C
sub_08004B2C: @ 0x08004B2C
	push {lr}
	ldr r0, _08004B38 @ =gUnknown_08487754
	bl sub_080193B0
	pop {r0}
	bx r0
	.align 2, 0
_08004B38: .4byte gUnknown_08487754

