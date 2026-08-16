	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08031ED0
sub_08031ED0: @ 0x08031ED0
	push {lr}
	movs r1, #0x20
	strh r1, [r0, #0x1e]
	movs r0, #1
	bl sub_08013928
	bl sub_080135A4
	pop {r0}
	bx r0

