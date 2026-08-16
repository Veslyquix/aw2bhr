	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08011C58
sub_08011C58: @ 0x08011C58
	push {lr}
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x11
	bl CpuSet
	pop {r0}
	bx r0
	.align 2, 0

