	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806E6C8
sub_0806E6C8: @ 0x0806E6C8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806E6DC @ =gUnknown_08582BB4
	bl Proc_StartBlocking
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806E6DC: .4byte gUnknown_08582BB4

