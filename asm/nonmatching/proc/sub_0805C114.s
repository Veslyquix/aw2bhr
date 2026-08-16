	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805C114
sub_0805C114: @ 0x0805C114
	ldr r1, _0805C124 @ =gUnknown_03002EE0
	ldr r1, [r1]
	ldrh r1, [r1, #4]
	ands r1, r0
_0805C11C:
	cmp r1, #0
	beq _0805C11C
	bx lr
	.align 2, 0
_0805C124: .4byte gUnknown_03002EE0

