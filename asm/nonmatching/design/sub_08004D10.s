	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08004D10
sub_08004D10: @ 0x08004D10
	push {lr}
	bl sub_08001D9C
	bl sub_08003040
	ldr r0, _08004D24 @ =gUnknown_08487D44
	bl sub_080193B0
	pop {r0}
	bx r0
	.align 2, 0
_08004D24: .4byte gUnknown_08487D44

