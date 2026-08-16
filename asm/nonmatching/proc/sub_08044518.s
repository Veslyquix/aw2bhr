	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08044518
sub_08044518: @ 0x08044518
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl sub_08029978
	adds r0, r4, #0
	movs r1, #0
	bl sub_08029A48
	pop {r4}
	pop {r0}
	bx r0

