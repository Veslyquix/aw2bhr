	.include "macro.inc"
	.syntax unified

	thumb_func_start HuffUnComp
HuffUnComp: @ 0x0808AAB8
	svc #0x13
	bx lr

