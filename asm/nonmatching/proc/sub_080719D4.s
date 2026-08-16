	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080719D4
sub_080719D4: @ 0x080719D4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #0x58]
	str r0, [r4, #0x5c]
	bl sub_08034F6C
	adds r4, #0x64
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

