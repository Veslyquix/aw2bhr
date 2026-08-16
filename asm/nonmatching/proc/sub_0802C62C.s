	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C62C
sub_0802C62C: @ 0x0802C62C
	ldr r0, _0802C63C @ =gUnknown_03003FC0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802C640
	movs r0, #1
	b _0802C642
	.align 2, 0
_0802C63C: .4byte gUnknown_03003FC0
_0802C640:
	movs r0, #0
_0802C642:
	bx lr

