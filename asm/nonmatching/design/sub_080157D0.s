	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080157D0
sub_080157D0: @ 0x080157D0
	ldr r3, _080157EC @ =gUnknown_0200E438
	ldr r2, _080157F0 @ =gUnknown_03001470
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r1, r1, r2
	ldrh r1, [r1, #0x26]
	movs r0, #0x4c
	muls r0, r1, r0
	adds r0, r0, r3
	ldrh r0, [r0, #0x3c]
	bx lr
	.align 2, 0
_080157EC: .4byte gUnknown_0200E438
_080157F0: .4byte gUnknown_03001470

