	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C2A0
sub_0802C2A0: @ 0x0802C2A0
	ldr r1, _0802C2AC @ =gUnknown_0849A8F0
	cmp r0, r1
	beq _0802C2B0
	movs r0, #0
	b _0802C2B2
	.align 2, 0
_0802C2AC: .4byte gUnknown_0849A8F0
_0802C2B0:
	movs r0, #1
_0802C2B2:
	bx lr

