	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803F3C8
sub_0803F3C8: @ 0x0803F3C8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xec
	lsls r0, r0, #1
	bl sub_0803B4DC
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	adds r2, r4, #0
	bl sub_0803F3E4
	pop {r4}
	pop {r0}
	bx r0

