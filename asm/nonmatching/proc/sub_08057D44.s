	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08057D44
sub_08057D44: @ 0x08057D44
	ldr r2, _08057D54 @ =gUnknown_08555450
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08057D54: .4byte gUnknown_08555450

