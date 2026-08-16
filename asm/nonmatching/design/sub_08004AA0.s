	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08004AA0
sub_08004AA0: @ 0x08004AA0
	push {lr}
	bl sub_0801A168
	ldr r0, _08004AB8 @ =gUnknown_084873BC
	movs r1, #0
	bl sub_080152EC
	bl sub_08000654
	pop {r0}
	bx r0
	.align 2, 0
_08004AB8: .4byte gUnknown_084873BC

