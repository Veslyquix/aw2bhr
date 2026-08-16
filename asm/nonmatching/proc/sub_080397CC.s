	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080397CC
sub_080397CC: @ 0x080397CC
	push {lr}
	ldr r0, [r0, #0x54]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_08043DAC
	pop {r0}
	bx r0

