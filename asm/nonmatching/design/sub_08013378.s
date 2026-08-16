	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08013378
sub_08013378: @ 0x08013378
	push {lr}
	ldr r0, _08013384 @ =gUnknown_084893AC
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08013384: .4byte gUnknown_084893AC

