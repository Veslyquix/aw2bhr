	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806CC64
sub_0806CC64: @ 0x0806CC64
	push {lr}
	ldr r0, _0806CC74 @ =gUnknown_0818E590
	ldr r1, _0806CC78 @ =0x06010000
	bl sub_08011CAC
	pop {r0}
	bx r0
	.align 2, 0
_0806CC74: .4byte gUnknown_0818E590
_0806CC78: .4byte 0x06010000

