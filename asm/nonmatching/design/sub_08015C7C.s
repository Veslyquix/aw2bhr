	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08015C7C
sub_08015C7C: @ 0x08015C7C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08015C90 @ =gUnknown_03001470
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r2, #8
	adds r1, r1, r2
	ldr r0, [r1]
	bx lr
	.align 2, 0
_08015C90: .4byte gUnknown_03001470

