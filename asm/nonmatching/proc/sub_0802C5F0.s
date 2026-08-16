	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C5F0
sub_0802C5F0: @ 0x0802C5F0
	ldr r0, _0802C5FC @ =gUnknown_03003FC0
	ldrb r0, [r0, #1]
	cmp r0, #3
	beq _0802C600
	movs r0, #1
	b _0802C602
	.align 2, 0
_0802C5FC: .4byte gUnknown_03003FC0
_0802C600:
	movs r0, #0
_0802C602:
	bx lr

