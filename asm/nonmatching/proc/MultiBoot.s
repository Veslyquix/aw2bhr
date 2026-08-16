	.include "macro.inc"
	.syntax unified

	thumb_func_start MultiBoot
MultiBoot: @ 0x0808AAC4
	movs r1, #1
	svc #0x25
	bx lr
	.align 2, 0

