	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08073F90
sub_08073F90: @ 0x08073F90
	ldr r2, _08073FA0 @ =gUnknown_0202FDE8
	ldrh r2, [r2]
	strh r2, [r0]
	ldr r0, _08073FA4 @ =gUnknown_0202FDEA
	ldrh r0, [r0]
	strh r0, [r1]
	bx lr
	.align 2, 0
_08073FA0: .4byte gUnknown_0202FDE8
_08073FA4: .4byte gUnknown_0202FDEA

