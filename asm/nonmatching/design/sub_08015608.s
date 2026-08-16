	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08015608
sub_08015608: @ 0x08015608
	push {r4, r5, lr}
	ldr r4, _08015630 @ =gUnknown_0200E438
	ldr r5, _08015634 @ =gUnknown_03001470
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r3, r0, #1
	adds r3, r3, r0
	lsls r3, r3, #5
	adds r3, r3, r5
	ldrh r3, [r3, #0x26]
	movs r0, #0x4c
	muls r0, r3, r0
	adds r4, #0x30
	adds r0, r0, r4
	str r1, [r0]
	str r2, [r0, #4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08015630: .4byte gUnknown_0200E438
_08015634: .4byte gUnknown_03001470

