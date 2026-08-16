	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803CB8C
sub_0803CB8C: @ 0x0803CB8C
	ldr r1, _0803CB9C @ =gUnknown_030033F4
	movs r2, #0
	adds r0, r1, #3
_0803CB92:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _0803CB92
	bx lr
	.align 2, 0
_0803CB9C: .4byte gUnknown_030033F4

