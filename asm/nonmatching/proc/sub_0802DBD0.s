	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802DBD0
sub_0802DBD0: @ 0x0802DBD0
	push {lr}
	movs r0, #1
	bl sub_0802776C
	bl sub_0802428C
	bl sub_08034F8C
	pop {r0}
	bx r0

