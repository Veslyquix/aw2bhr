	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08037678
sub_08037678: @ 0x08037678
	push {lr}
	ldr r0, _08037688 @ =sub_08037790
	bl sub_08011B5C
	bl sub_08037628
	pop {r0}
	bx r0
	.align 2, 0
_08037688: .4byte sub_08037790

