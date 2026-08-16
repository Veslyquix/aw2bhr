	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08086058
sub_08086058: @ 0x08086058
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0808606C
	adds r0, r4, #0
	bl sub_08086688
	pop {r4}
	pop {r0}
	bx r0

