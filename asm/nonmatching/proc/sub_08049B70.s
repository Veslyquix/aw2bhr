	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08049B70
sub_08049B70: @ 0x08049B70
	push {lr}
	ldr r0, _08049B7C @ =sub_08049BAC
	bl sub_08011B34
	pop {r0}
	bx r0
	.align 2, 0
_08049B7C: .4byte sub_08049BAC

