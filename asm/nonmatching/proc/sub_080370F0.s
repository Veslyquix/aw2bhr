	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080370F0
sub_080370F0: @ 0x080370F0
	push {lr}
	ldr r0, _08037104 @ =sub_08036884
	bl sub_080366D0
	ldr r0, _08037108 @ =sub_080368E8
	bl sub_080366C4
	pop {r0}
	bx r0
	.align 2, 0
_08037104: .4byte sub_08036884
_08037108: .4byte sub_080368E8

