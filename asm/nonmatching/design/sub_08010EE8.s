	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08010EE8
sub_08010EE8: @ 0x08010EE8
	lsls r0, r0, #0x10
	ldr r2, _08010EF4 @ =gUnknown_03003050
	lsrs r0, r0, #0xe
	adds r0, r0, r2
	str r1, [r0]
	bx lr
	.align 2, 0
_08010EF4: .4byte gUnknown_03003050

