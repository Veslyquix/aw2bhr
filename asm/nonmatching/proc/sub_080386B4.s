	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080386B4
sub_080386B4: @ 0x080386B4
	ldr r0, _080386C0 @ =gUnknown_03003FC0
	ldrb r0, [r0, #1]
	cmp r0, #2
	beq _080386C4
	movs r0, #0
	b _080386C6
	.align 2, 0
_080386C0: .4byte gUnknown_03003FC0
_080386C4:
	movs r0, #1
_080386C6:
	bx lr

