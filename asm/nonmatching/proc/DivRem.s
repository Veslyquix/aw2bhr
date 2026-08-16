	.include "macro.inc"
	.syntax unified

	thumb_func_start DivRem
DivRem: @ 0x0808AAB0
	svc #6
	adds r0, r1, #0
	bx lr
	.align 2, 0

