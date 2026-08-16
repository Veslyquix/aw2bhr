	.include "macro.inc"
	.syntax unified

	thumb_func_start VBlankIntrWait
VBlankIntrWait: @ 0x0808AAEC
	movs r2, #0
	svc #5
	bx lr
	.align 2, 0

