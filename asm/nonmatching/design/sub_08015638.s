	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08015638
sub_08015638: @ 0x08015638
	push {r4, lr}
	ldr r3, _08015664 @ =gUnknown_0200E438
	ldr r4, _08015668 @ =gUnknown_03001470
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r1, #1
	adds r2, r2, r1
	lsls r2, r2, #5
	adds r2, r2, r4
	ldrh r2, [r2, #0x26]
	movs r1, #0x4c
	muls r1, r2, r1
	adds r3, #0x30
	adds r1, r1, r3
	ldr r2, [r1, #4]
	ldr r1, [r1]
	str r1, [r0]
	str r2, [r0, #4]
	pop {r4}
	pop {r2}
	bx r2
	.align 2, 0
_08015664: .4byte gUnknown_0200E438
_08015668: .4byte gUnknown_03001470

