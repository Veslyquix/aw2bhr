	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08014BC0
sub_08014BC0: @ 0x08014BC0
	push {lr}
	adds r1, r0, #0
	ldr r0, _08014BD0 @ =gUnknown_0848A140
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08014BD0: .4byte gUnknown_0848A140

