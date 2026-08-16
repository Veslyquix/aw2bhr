	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08011218
sub_08011218: @ 0x08011218
	push {lr}
	ldr r0, _08011224 @ =gUnknown_0848927C
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08011224: .4byte gUnknown_0848927C

