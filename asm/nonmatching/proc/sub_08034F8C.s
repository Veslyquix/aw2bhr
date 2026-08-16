	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034F8C
sub_08034F8C: @ 0x08034F8C
	ldr r1, _08034FA0 @ =gUnknown_030030F0
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08034F9C
	subs r0, r2, #1
	strb r0, [r1]
_08034F9C:
	bx lr
	.align 2, 0
_08034FA0: .4byte gUnknown_030030F0

