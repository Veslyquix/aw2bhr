	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801BB00
sub_0801BB00: @ 0x0801BB00
	ldr r2, _0801BB0C @ =gUnknown_03002FE0
	lsls r0, r0, #2
	adds r0, r0, r2
	str r1, [r0]
	bx lr
	.align 2, 0
_0801BB0C: .4byte gUnknown_03002FE0

