	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08071ADC
sub_08071ADC: @ 0x08071ADC
	push {lr}
	ldr r0, [r0, #0x58]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	movs r2, #0
	bl sub_08019818
	pop {r0}
	bx r0

