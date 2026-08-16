	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08037B84
sub_08037B84: @ 0x08037B84
	ldr r1, _08037B8C @ =gUnknown_03003F68
	str r0, [r1]
	bx lr
	.align 2, 0
_08037B8C: .4byte gUnknown_03003F68

