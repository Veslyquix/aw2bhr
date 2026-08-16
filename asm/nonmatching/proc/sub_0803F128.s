	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803F128
sub_0803F128: @ 0x0803F128
	cmp r0, #3
	beq _0803F130
	cmp r0, #4
	beq _0803F138
_0803F130:
	ldr r0, _0803F134 @ =gUnknown_0810A3E8
	b _0803F13A
	.align 2, 0
_0803F134: .4byte gUnknown_0810A3E8
_0803F138:
	ldr r0, _0803F13C @ =gUnknown_0810AFC8
_0803F13A:
	bx lr
	.align 2, 0
_0803F13C: .4byte gUnknown_0810AFC8

