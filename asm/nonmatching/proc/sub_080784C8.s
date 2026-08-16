	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080784C8
sub_080784C8: @ 0x080784C8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08019850
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080784DC
	adds r0, r4, #0
	bl Proc_Break
_080784DC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

