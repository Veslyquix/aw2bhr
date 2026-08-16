	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803F110
sub_0803F110: @ 0x0803F110
	cmp r0, #3
	beq _0803F118
	cmp r0, #4
	beq _0803F120
_0803F118:
	ldr r0, _0803F11C @ =gUnknown_081095A4
	b _0803F122
	.align 2, 0
_0803F11C: .4byte gUnknown_081095A4
_0803F120:
	ldr r0, _0803F124 @ =gUnknown_0810A6F0
_0803F122:
	bx lr
	.align 2, 0
_0803F124: .4byte gUnknown_0810A6F0

