	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08071CDC
sub_08071CDC: @ 0x08071CDC
	push {r4, lr}
	movs r4, #0
_08071CE0:
	adds r0, r4, #0
	bl sub_08071CA4
	adds r4, #1
	cmp r4, #0x1f
	ble _08071CE0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

