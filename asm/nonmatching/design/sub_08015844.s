	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08015844
sub_08015844: @ 0x08015844
	push {r4, r5, lr}
	ldr r5, _08015870 @ =gUnknown_0200E438
	ldr r4, _08015874 @ =gUnknown_03001470
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r3, r0, #1
	adds r3, r3, r0
	lsls r3, r3, #5
	adds r3, r3, r4
	ldrh r0, [r3, #0x26]
	movs r4, #0x4c
	muls r0, r4, r0
	adds r0, r0, r5
	strh r1, [r0, #0x3c]
	ldrh r0, [r3, #0x26]
	muls r0, r4, r0
	adds r0, r0, r5
	strh r2, [r0, #0x3e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08015870: .4byte gUnknown_0200E438
_08015874: .4byte gUnknown_03001470

