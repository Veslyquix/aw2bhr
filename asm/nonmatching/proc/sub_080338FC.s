	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080338FC
sub_080338FC: @ 0x080338FC
	push {lr}
	movs r1, #0xbe
	lsls r1, r1, #1
	movs r0, #0
	movs r2, #7
	bl sub_08043BA4
	pop {r0}
	bx r0
	.align 2, 0

