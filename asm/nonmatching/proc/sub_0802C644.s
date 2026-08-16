	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C644
sub_0802C644: @ 0x0802C644
	ldr r0, _0802C654 @ =gUnknown_03003FC0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802C658
	movs r0, #1
	b _0802C65A
	.align 2, 0
_0802C654: .4byte gUnknown_03003FC0
_0802C658:
	movs r0, #0
_0802C65A:
	bx lr

