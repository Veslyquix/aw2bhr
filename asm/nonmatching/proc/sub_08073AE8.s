	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08073AE8
sub_08073AE8: @ 0x08073AE8
	ldr r2, _08073AF8 @ =gUnknown_0202FDDC
	ldr r3, [r2]
	ldr r1, _08073AFC @ =gUnknown_0202FDE0
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	bx lr
	.align 2, 0
_08073AF8: .4byte gUnknown_0202FDDC
_08073AFC: .4byte gUnknown_0202FDE0

