	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806780C
sub_0806780C: @ 0x0806780C
	push {lr}
	ldr r0, _0806781C @ =gUnknown_08580FE4
	bl Proc_Find
	movs r1, #1
	str r1, [r0, #0x5c]
	pop {r0}
	bx r0
	.align 2, 0
_0806781C: .4byte gUnknown_08580FE4

