	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08004B5C
sub_08004B5C: @ 0x08004B5C
	push {lr}
	ldr r0, _08004B68 @ =gUnknown_08487934
	bl sub_080193B0
	pop {r0}
	bx r0
	.align 2, 0
_08004B68: .4byte gUnknown_08487934

