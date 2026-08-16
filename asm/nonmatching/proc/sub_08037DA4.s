	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08037DA4
sub_08037DA4: @ 0x08037DA4
	adds r1, r0, #0
	cmp r1, #0xc7
	bgt _08037DAE
	movs r0, #2
	b _08037DC6
_08037DAE:
	cmp r1, #0xf9
	bgt _08037DB6
	movs r0, #3
	b _08037DC6
_08037DB6:
	ldr r0, _08037DC0 @ =0x00000117
	cmp r1, r0
	ble _08037DC4
	movs r0, #5
	b _08037DC6
	.align 2, 0
_08037DC0: .4byte 0x00000117
_08037DC4:
	movs r0, #4
_08037DC6:
	bx lr

