	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08035CF4
sub_08035CF4: @ 0x08035CF4
	ldr r0, _08035D04 @ =gUnknown_03003FC0
	adds r0, #0x2c
	ldrb r0, [r0]
	cmp r0, #1
	beq _08035D08
	movs r0, #0
	b _08035D0A
	.align 2, 0
_08035D04: .4byte gUnknown_03003FC0
_08035D08:
	movs r0, #1
_08035D0A:
	bx lr

