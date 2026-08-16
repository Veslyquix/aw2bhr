	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080157A4
sub_080157A4: @ 0x080157A4
	push {r4, lr}
	ldr r4, _080157C8 @ =gUnknown_0200E438
	ldr r3, _080157CC @ =gUnknown_03001470
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #5
	adds r2, r2, r3
	ldrh r2, [r2, #0x26]
	movs r0, #0x4c
	muls r0, r2, r0
	adds r0, r0, r4
	strh r1, [r0, #0x3c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080157C8: .4byte gUnknown_0200E438
_080157CC: .4byte gUnknown_03001470

