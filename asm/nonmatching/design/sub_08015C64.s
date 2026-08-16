	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08015C64
sub_08015C64: @ 0x08015C64
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _08015C78 @ =gUnknown_03001470
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #5
	adds r3, #8
	adds r2, r2, r3
	str r1, [r2]
	bx lr
	.align 2, 0
_08015C78: .4byte gUnknown_03001470

