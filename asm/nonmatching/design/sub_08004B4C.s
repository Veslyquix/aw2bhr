	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08004B4C
sub_08004B4C: @ 0x08004B4C
	push {lr}
	ldr r0, _08004B58 @ =gUnknown_08487894
	bl sub_080193B0
	pop {r0}
	bx r0
	.align 2, 0
_08004B58: .4byte gUnknown_08487894

