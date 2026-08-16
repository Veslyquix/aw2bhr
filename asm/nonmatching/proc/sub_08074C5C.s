	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08074C5C
sub_08074C5C: @ 0x08074C5C
	adds r1, r0, #0
	subs r1, #0x78
	movs r0, #0
	cmp r1, #0
	blt _08074C6E
	adds r0, r1, #0
	cmp r0, #0xc0
	ble _08074C6E
	movs r0, #0xc0
_08074C6E:
	bx lr

