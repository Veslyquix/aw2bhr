	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08015900
sub_08015900: @ 0x08015900
	ldr r3, _08015920 @ =gUnknown_0200E438
	ldr r2, _08015924 @ =gUnknown_03001470
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
	adds r0, #0x40
	movs r1, #0
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_08015920: .4byte gUnknown_0200E438
_08015924: .4byte gUnknown_03001470

