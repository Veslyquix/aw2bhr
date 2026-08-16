	.include "macro.inc"
	.syntax unified

	thumb_func_start RLUnCompWram
RLUnCompWram: @ 0x0808AAD0
	svc #0x14
	bx lr

