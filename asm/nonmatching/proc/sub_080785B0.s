	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080785B0
sub_080785B0: @ 0x080785B0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08019260
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080785C4
	adds r0, r4, #0
	bl Proc_Break
_080785C4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

