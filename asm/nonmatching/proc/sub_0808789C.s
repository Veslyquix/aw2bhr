	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808789C
sub_0808789C: @ 0x0808789C
	push {lr}
	ldr r0, [r0, #0x54]
	bl sub_08087B74
	pop {r0}
	bx r0

