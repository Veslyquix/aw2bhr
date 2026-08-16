	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080129E0
sub_080129E0: @ 0x080129E0
	ldr r1, _080129F4 @ =gUnknown_03001FD4
	ldr r2, [r1]
	lsls r2, r2, #2
	adds r0, r2, #2
	adds r2, #3
	muls r0, r2, r0
	lsrs r0, r0, #2
	str r0, [r1]
	bx lr
	.align 2, 0
_080129F4: .4byte gUnknown_03001FD4

