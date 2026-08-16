	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080606BC
sub_080606BC: @ 0x080606BC
	push {lr}
	ldr r0, _080606CC @ =gUnknown_030040D8
	ldr r0, [r0]
	bl sub_0804018C
	pop {r0}
	bx r0
	.align 2, 0
_080606CC: .4byte gUnknown_030040D8

