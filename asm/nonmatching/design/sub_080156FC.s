	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080156FC
sub_080156FC: @ 0x080156FC
	push {r4, lr}
	lsls r1, r1, #0x10
	ldr r4, _08015730 @ =gUnknown_0200E438
	ldr r3, _08015734 @ =gUnknown_03001470
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #5
	adds r2, r2, r3
	ldrh r2, [r2, #0x26]
	movs r0, #0x4c
	muls r2, r0, r2
	adds r2, r2, r4
	movs r0, #0
	strh r0, [r2, #0x1c]
	ldr r0, [r2, #0x48]
	lsrs r1, r1, #0xe
	adds r1, r1, r0
	ldr r0, [r1, #4]
	str r0, [r2, #4]
	str r0, [r2, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08015730: .4byte gUnknown_0200E438
_08015734: .4byte gUnknown_03001470

