	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C78C
sub_0802C78C: @ 0x0802C78C
	ldr r0, _0802C798 @ =gUnknown_03003FC0
	ldrb r0, [r0, #0xc]
	cmp r0, #1
	beq _0802C79C
	movs r0, #1
	b _0802C79E
	.align 2, 0
_0802C798: .4byte gUnknown_03003FC0
_0802C79C:
	movs r0, #0
_0802C79E:
	bx lr

