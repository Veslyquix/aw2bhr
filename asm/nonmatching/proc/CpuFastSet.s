	.include "macro.inc"
	.syntax unified

	thumb_func_start CpuFastSet
CpuFastSet: @ 0x0808AAA4
	svc #0xc
	bx lr

