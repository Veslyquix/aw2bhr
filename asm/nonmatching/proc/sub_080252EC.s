	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080252EC
sub_080252EC: @ 0x080252EC
	push {lr}
	ldr r0, _08025300 @ =gUnknown_030013D0
	bl sub_080252E8
	ldr r0, _08025304 @ =gUnknown_030013B0
	bl sub_080252E8
	pop {r0}
	bx r0
	.align 2, 0
_08025300: .4byte gUnknown_030013D0
_08025304: .4byte gUnknown_030013B0

