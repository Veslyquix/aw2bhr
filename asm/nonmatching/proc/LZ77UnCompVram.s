	.include "macro.inc"
	.syntax unified

	thumb_func_start LZ77UnCompVram
LZ77UnCompVram: @ 0x0808AABC
	svc #0x12
	bx lr

