	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B33C
sub_0803B33C: @ 0x0803B33C
	push {lr}
	ldr r0, _0803B348 @ =gUnknown_0849E700
	bl sub_0801537C
	pop {r0}
	bx r0
	.align 2, 0
_0803B348: .4byte gUnknown_0849E700

