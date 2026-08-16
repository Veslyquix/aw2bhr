	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08004ABC
sub_08004ABC: @ 0x08004ABC
	push {lr}
	bl sub_0801A168
	ldr r0, _08004AD4 @ =gUnknown_08487404
	movs r1, #0
	bl sub_080152EC
	bl sub_08000654
	pop {r0}
	bx r0
	.align 2, 0
_08004AD4: .4byte gUnknown_08487404

