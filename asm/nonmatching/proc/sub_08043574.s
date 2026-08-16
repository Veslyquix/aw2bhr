	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08043574
sub_08043574: @ 0x08043574
	cmp r0, #0xcf
	ble _08043584
	cmp r1, #0x7f
	ble _08043580
	adds r2, #2
	b _0804358A
_08043580:
	adds r2, #1
	b _0804358A
_08043584:
	cmp r1, #0x7f
	ble _0804358A
	adds r2, #3
_0804358A:
	adds r0, r2, #0
	bx lr
	.align 2, 0

