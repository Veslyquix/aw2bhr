	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08029C28
sub_08029C28: @ 0x08029C28
	push {lr}
	ldrh r2, [r0, #0x20]
	ldrh r1, [r0, #0x22]
	adds r0, r2, #0
	bl sub_0802723C
	pop {r0}
	bx r0

