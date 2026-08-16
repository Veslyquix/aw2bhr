	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806E590
sub_0806E590: @ 0x0806E590
	push {lr}
	ldrh r0, [r0, #0x34]
	movs r1, #0x90
	lsls r1, r1, #1
	bl sub_08043BF8
	pop {r0}
	bx r0

