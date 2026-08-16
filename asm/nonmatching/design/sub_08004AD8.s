	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08004AD8
sub_08004AD8: @ 0x08004AD8
	push {lr}
	bl sub_0801A168
	ldr r0, _08004AF0 @ =gUnknown_0848744C
	movs r1, #0
	bl sub_080152EC
	bl sub_08000654
	pop {r0}
	bx r0
	.align 2, 0
_08004AF0: .4byte gUnknown_0848744C

