	.include "macro.inc"
	.syntax unified

	thumb_func_start CpuSet
CpuSet: @ 0x0808AAA8
	svc #0xb
	bx lr

