	.include "macro.inc"
	.syntax unified

	thumb_func_start BgAffineSet
BgAffineSet: @ 0x0808AAA0
	svc #0xe
	bx lr

