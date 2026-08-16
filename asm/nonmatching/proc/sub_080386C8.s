	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080386C8
sub_080386C8: @ 0x080386C8
	ldr r0, _080386D4 @ =gUnknown_03003FC0
	ldrb r0, [r0, #1]
	cmp r0, #3
	beq _080386D8
	movs r0, #0
	b _080386DA
	.align 2, 0
_080386D4: .4byte gUnknown_03003FC0
_080386D8:
	movs r0, #1
_080386DA:
	bx lr

