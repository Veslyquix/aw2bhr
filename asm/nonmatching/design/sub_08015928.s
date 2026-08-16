	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08015928
sub_08015928: @ 0x08015928
	push {r4, lr}
	ldr r3, _0801594C @ =gUnknown_0200E438
	ldr r4, _08015950 @ =gUnknown_03001470
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #5
	adds r2, r2, r4
	ldrh r2, [r2, #0x26]
	movs r0, #0x4c
	muls r0, r2, r0
	adds r3, #0x44
	adds r0, r0, r3
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801594C: .4byte gUnknown_0200E438
_08015950: .4byte gUnknown_03001470

