	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08013AD4
sub_08013AD4: @ 0x08013AD4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08013AE8 @ =gUnknown_03002F00
	movs r1, #1
	lsls r1, r0
	ldrh r0, [r2]
	orrs r1, r0
	strh r1, [r2]
	bx lr
	.align 2, 0
_08013AE8: .4byte gUnknown_03002F00

