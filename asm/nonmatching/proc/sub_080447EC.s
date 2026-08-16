	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080447EC
sub_080447EC: @ 0x080447EC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xc4
	bl sub_0803B4DC
	adds r0, r4, #0
	bl sub_080443C4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

