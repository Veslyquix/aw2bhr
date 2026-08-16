	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808603C
sub_0808603C: @ 0x0808603C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0808606C
	adds r0, r4, #0
	bl sub_080860DC
	adds r0, r4, #0
	bl sub_08086688
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

