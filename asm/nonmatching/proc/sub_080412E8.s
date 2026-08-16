	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080412E8
sub_080412E8: @ 0x080412E8
	push {lr}
	movs r0, #0x6e
	bl sub_0803B4DC
	pop {r0}
	bx r0

