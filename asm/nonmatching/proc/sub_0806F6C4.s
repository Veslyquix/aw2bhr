	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806F6C4
sub_0806F6C4: @ 0x0806F6C4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0803B5E8
	adds r4, #0x64
	movs r0, #0
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

