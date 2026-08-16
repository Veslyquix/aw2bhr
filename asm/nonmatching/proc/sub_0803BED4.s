	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803BED4
sub_0803BED4: @ 0x0803BED4
	push {lr}
	ldr r0, _0803BEF0 @ =gUnknown_0849D16C
	bl sub_08012C58
	bl sub_08022A34
	movs r0, #0
	bl sub_0801A5B0
	bl sub_08037F18
	pop {r0}
	bx r0
	.align 2, 0
_0803BEF0: .4byte gUnknown_0849D16C

