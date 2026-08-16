	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C7A0
sub_0802C7A0: @ 0x0802C7A0
	ldr r0, _0802C7AC @ =gUnknown_03003FC0
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	beq _0802C7B0
	movs r0, #1
	b _0802C7B2
	.align 2, 0
_0802C7AC: .4byte gUnknown_03003FC0
_0802C7B0:
	movs r0, #0
_0802C7B2:
	bx lr

