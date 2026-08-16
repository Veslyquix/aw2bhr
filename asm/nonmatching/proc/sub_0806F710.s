	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806F710
sub_0806F710: @ 0x0806F710
	push {lr}
	adds r1, r0, #0
	ldr r0, _0806F720 @ =gUnknown_08582D74
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_0806F720: .4byte gUnknown_08582D74

