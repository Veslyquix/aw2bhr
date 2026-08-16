	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B15C
sub_0803B15C: @ 0x0803B15C
	push {lr}
	ldr r0, _0803B168 @ =gUnknown_0849E670
	bl sub_0801537C
	pop {r0}
	bx r0
	.align 2, 0
_0803B168: .4byte gUnknown_0849E670

