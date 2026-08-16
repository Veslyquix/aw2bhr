	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080397BC
sub_080397BC: @ 0x080397BC
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x54]
	ldr r1, [r2, #0x58]
	bl sub_08044B28
	pop {r0}
	bx r0

