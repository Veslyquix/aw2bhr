	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C430
sub_0802C430: @ 0x0802C430
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08024268
	bl sub_08013C00
	bl sub_08013AEC
	bl sub_08037678
	movs r0, #6
	strh r0, [r4, #0x1e]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

