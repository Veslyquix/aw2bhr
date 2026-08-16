	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08063518
sub_08063518: @ 0x08063518
	ldrb r0, [r0, #0x18]
	cmp r0, #0xe9
	beq _08063522
	movs r0, #0
	b _08063524
_08063522:
	movs r0, #1
_08063524:
	bx lr
	.align 2, 0

