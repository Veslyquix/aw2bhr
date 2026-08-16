	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080366DC
sub_080366DC: @ 0x080366DC
	ldr r0, _080366E4 @ =gUnknown_030040EC
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080366E4: .4byte gUnknown_030040EC

