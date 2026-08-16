	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08004B10
sub_08004B10: @ 0x08004B10
	push {lr}
	bl sub_0801A168
	ldr r0, _08004B28 @ =gUnknown_084874DC
	movs r1, #0
	bl sub_080152EC
	bl sub_08000654
	pop {r0}
	bx r0
	.align 2, 0
_08004B28: .4byte gUnknown_084874DC

