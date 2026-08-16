	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08071CC4
sub_08071CC4: @ 0x08071CC4
	push {r4, lr}
	movs r4, #0
_08071CC8:
	adds r0, r4, #0
	bl sub_08071C84
	adds r4, #1
	cmp r4, #0x1f
	ble _08071CC8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

