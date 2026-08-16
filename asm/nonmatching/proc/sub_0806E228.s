	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806E228
sub_0806E228: @ 0x0806E228
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806E23C @ =gUnknown_08582AF4
	bl Proc_Find
	adds r4, #1
	str r4, [r0, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806E23C: .4byte gUnknown_08582AF4

