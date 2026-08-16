	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801C7A4
sub_0801C7A4: @ 0x0801C7A4
	push {lr}
	ldr r0, _0801C7B0 @ =gUnknown_0848B5AC
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0801C7B0: .4byte gUnknown_0848B5AC

