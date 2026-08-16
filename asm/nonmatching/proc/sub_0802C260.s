	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C260
sub_0802C260: @ 0x0802C260
	push {lr}
	ldr r0, _0802C26C @ =sub_080184C8
	bl sub_08011AAC
	pop {r0}
	bx r0
	.align 2, 0
_0802C26C: .4byte sub_080184C8

