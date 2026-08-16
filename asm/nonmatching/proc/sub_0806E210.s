	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806E210
sub_0806E210: @ 0x0806E210
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806E224 @ =gUnknown_08582AF4
	bl Proc_Start
	adds r4, #1
	str r4, [r0, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806E224: .4byte gUnknown_08582AF4

