	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078EC4
sub_08078EC4: @ 0x08078EC4
	push {lr}
	ldr r0, _08078ED0 @ =0x000001A1
	bl sub_0803B524
	pop {r0}
	bx r0
	.align 2, 0
_08078ED0: .4byte 0x000001A1

