	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045984
sub_08045984: @ 0x08045984
	ldr r0, _08045994 @ =gUnknown_08499598
	ldr r0, [r0]
	adds r0, #0x4f
	ldrb r0, [r0]
	cmp r0, #8
	beq _08045998
	movs r0, #1
	b _0804599A
	.align 2, 0
_08045994: .4byte gUnknown_08499598
_08045998:
	movs r0, #0
_0804599A:
	bx lr

