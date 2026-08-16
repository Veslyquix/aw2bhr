	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08010F94
sub_08010F94: @ 0x08010F94
	ldr r1, _08010F9C @ =gUnknown_03002B5C
	movs r0, #1
	strh r0, [r1]
	bx lr
	.align 2, 0
_08010F9C: .4byte gUnknown_03002B5C

