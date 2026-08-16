	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08015738
sub_08015738: @ 0x08015738
	push {r4, r5, lr}
	lsls r2, r2, #0x10
	ldr r5, _08015770 @ =gUnknown_0200E438
	ldr r4, _08015774 @ =gUnknown_03001470
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r3, r0, #1
	adds r3, r3, r0
	lsls r3, r3, #5
	adds r3, r3, r4
	ldrh r3, [r3, #0x26]
	movs r0, #0x4c
	muls r0, r3, r0
	adds r0, r0, r5
	movs r3, #0
	strh r3, [r0, #0x1c]
	lsrs r2, r2, #0xe
	adds r2, r2, r1
	ldr r2, [r2, #4]
	str r2, [r0, #4]
	str r2, [r0, #8]
	str r1, [r0, #0x48]
	ldr r1, [r1]
	str r1, [r0, #0x20]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08015770: .4byte gUnknown_0200E438
_08015774: .4byte gUnknown_03001470

