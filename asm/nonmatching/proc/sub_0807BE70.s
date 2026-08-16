	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807BE70
sub_0807BE70: @ 0x0807BE70
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0807C278
	adds r0, r4, #0
	bl sub_0807C2D4
	ldr r0, [r4, #0x60]
	cmp r0, #0xe
	ble _0807BE8A
	adds r0, r4, #0
	bl Proc_Break
_0807BE8A:
	pop {r4}
	pop {r0}
	bx r0

