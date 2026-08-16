	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08080F90
sub_08080F90: @ 0x08080F90
	ldr r0, _08080FA8 @ =gUnknown_03005968
	movs r1, #0
	str r1, [r0]
	ldr r0, _08080FAC @ =gUnknown_03005920
	str r1, [r0]
	ldr r2, _08080FB0 @ =gUnknown_03005924
	movs r0, #6
	str r0, [r2]
	ldr r0, _08080FB4 @ =gUnknown_030058FC
	str r1, [r0]
	bx lr
	.align 2, 0
_08080FA8: .4byte gUnknown_03005968
_08080FAC: .4byte gUnknown_03005920
_08080FB0: .4byte gUnknown_03005924
_08080FB4: .4byte gUnknown_030058FC

