	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08015C94
sub_08015C94: @ 0x08015C94
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _08015CB0 @ =gUnknown_03001470
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #5
	adds r0, r3, #4
	adds r0, r2, r0
	str r1, [r0]
	adds r2, r2, r3
	movs r0, #0
	strh r0, [r2, #0x10]
	bx lr
	.align 2, 0
_08015CB0: .4byte gUnknown_03001470

