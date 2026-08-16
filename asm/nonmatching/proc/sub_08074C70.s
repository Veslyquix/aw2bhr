	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08074C70
sub_08074C70: @ 0x08074C70
	adds r1, r0, #0
	subs r1, #0x50
	movs r0, #0
	cmp r1, #0
	blt _08074C82
	adds r0, r1, #0
	cmp r0, #0x60
	ble _08074C82
	movs r0, #0x60
_08074C82:
	bx lr

