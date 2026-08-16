	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807AE84
sub_0807AE84: @ 0x0807AE84
	push {lr}
	ldr r0, _0807AE90 @ =0x000001DB
	bl sub_0803B4DC
	pop {r0}
	bx r0
	.align 2, 0
_0807AE90: .4byte 0x000001DB

