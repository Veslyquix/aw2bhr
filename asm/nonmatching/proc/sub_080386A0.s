	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080386A0
sub_080386A0: @ 0x080386A0
	ldr r0, _080386AC @ =gUnknown_03003FC0
	ldrb r0, [r0, #1]
	cmp r0, #1
	beq _080386B0
	movs r0, #0
	b _080386B2
	.align 2, 0
_080386AC: .4byte gUnknown_03003FC0
_080386B0:
	movs r0, #1
_080386B2:
	bx lr

