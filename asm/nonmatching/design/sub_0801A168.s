	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801A168
sub_0801A168: @ 0x0801A168
	push {lr}
	ldr r0, _0801A174 @ =gUnknown_0848A42C
	bl sub_0801537C
	pop {r1}
	bx r1
	.align 2, 0
_0801A174: .4byte gUnknown_0848A42C

