	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08037D80
sub_08037D80: @ 0x08037D80
	adds r1, r0, #0
	cmp r1, #0xc7
	bgt _08037D8A
	movs r0, #2
	b _08037DA2
_08037D8A:
	cmp r1, #0xf9
	bgt _08037D92
	movs r0, #3
	b _08037DA2
_08037D92:
	ldr r0, _08037D9C @ =0x00000117
	cmp r1, r0
	ble _08037DA0
	movs r0, #5
	b _08037DA2
	.align 2, 0
_08037D9C: .4byte 0x00000117
_08037DA0:
	movs r0, #4
_08037DA2:
	bx lr

