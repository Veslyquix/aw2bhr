	.include "macro.inc"
	.syntax unified

	thumb_func_start Div
Div: @ 0x0808AAAC
	svc #6
	bx lr

