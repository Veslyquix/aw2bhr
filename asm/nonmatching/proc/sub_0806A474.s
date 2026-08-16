	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806A474
sub_0806A474: @ 0x0806A474
	push {lr}
	ldr r0, _0806A488 @ =gUnknown_08581500
	bl Proc_Find
	cmp r0, #0
	beq _0806A482
	movs r0, #1
_0806A482:
	pop {r1}
	bx r1
	.align 2, 0
_0806A488: .4byte gUnknown_08581500

