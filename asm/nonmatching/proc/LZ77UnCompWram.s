	.include "macro.inc"
	.syntax unified

	thumb_func_start LZ77UnCompWram
LZ77UnCompWram: @ 0x0808AAC0
	svc #0x11
	bx lr

