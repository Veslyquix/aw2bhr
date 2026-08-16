	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08014BD4
sub_08014BD4: @ 0x08014BD4
	push {lr}
	adds r1, r0, #0
	ldr r0, _08014BE4 @ =gUnknown_0848A150
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08014BE4: .4byte gUnknown_0848A150

