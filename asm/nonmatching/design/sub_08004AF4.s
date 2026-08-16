	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08004AF4
sub_08004AF4: @ 0x08004AF4
	push {lr}
	bl sub_0801A168
	ldr r0, _08004B0C @ =gUnknown_08487494
	movs r1, #0
	bl sub_080152EC
	bl sub_08000654
	pop {r0}
	bx r0
	.align 2, 0
_08004B0C: .4byte gUnknown_08487494

