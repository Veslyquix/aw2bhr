	.include "macro.inc"
	.syntax unified

	thumb_func_start RLUnCompVram
RLUnCompVram: @ 0x0808AACC
	svc #0x15
	bx lr

