	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C270
sub_0802C270: @ 0x0802C270
	push {lr}
	ldr r0, _0802C27C @ =sub_080184A4
	bl sub_08011AAC
	pop {r0}
	bx r0
	.align 2, 0
_0802C27C: .4byte sub_080184A4

