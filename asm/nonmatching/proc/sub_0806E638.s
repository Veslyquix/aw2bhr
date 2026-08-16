	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806E638
sub_0806E638: @ 0x0806E638
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806E654 @ =gUnknown_08582B2C
	bl Proc_Find
	ldr r1, [r4, #0x5c]
	strh r1, [r0, #0x34]
	movs r1, #0
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806E654: .4byte gUnknown_08582B2C

