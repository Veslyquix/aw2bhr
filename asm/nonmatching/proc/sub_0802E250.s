	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802E250
sub_0802E250: @ 0x0802E250
	push {lr}
	movs r0, #0x76
	bl sub_0803B4DC
	bl sub_0802C2B4
	pop {r0}
	bx r0

