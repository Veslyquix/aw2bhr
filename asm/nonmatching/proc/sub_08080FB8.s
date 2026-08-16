	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08080FB8
sub_08080FB8: @ 0x08080FB8
	ldr r0, _08080FD0 @ =gUnknown_03005920
	ldr r0, [r0]
	cmp r0, #0
	beq _08080FCC
	ldr r1, _08080FD4 @ =gUnknown_030033FC
	ldr r0, [r1]
	cmp r0, #6
	bne _08080FCC
	movs r0, #0xc
	str r0, [r1]
_08080FCC:
	bx lr
	.align 2, 0
_08080FD0: .4byte gUnknown_03005920
_08080FD4: .4byte gUnknown_030033FC

