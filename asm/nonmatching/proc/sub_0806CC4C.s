	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806CC4C
sub_0806CC4C: @ 0x0806CC4C
	push {lr}
	ldr r2, _0806CC60 @ =gUnknown_08581D40
	movs r0, #0x28
	movs r1, #0x8c
	movs r3, #0
	bl sub_0801BD00
	pop {r0}
	bx r0
	.align 2, 0
_0806CC60: .4byte gUnknown_08581D40

