	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803F540
sub_0803F540: @ 0x0803F540
	push {lr}
	ldr r0, _0803F54C @ =0x000001CB
	bl sub_0803B4DC
	pop {r0}
	bx r0
	.align 2, 0
_0803F54C: .4byte 0x000001CB

