	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08043AA0
sub_08043AA0: @ 0x08043AA0
	push {r4, r5, lr}
	adds r5, r1, #0
	movs r1, #0x18
	bl __modsi3
	adds r4, r0, #0
	bl GetLoadedCoPalette
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08043AC0
	pop {r4, r5}
	pop {r0}
	bx r0

