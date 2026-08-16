	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804483C
sub_0804483C: @ 0x0804483C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xfb
	lsls r0, r0, #1
	bl sub_0803B4DC
	adds r0, r4, #0
	bl sub_080443C4
	pop {r4}
	pop {r0}
	bx r0

