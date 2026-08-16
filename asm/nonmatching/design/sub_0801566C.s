	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801566C
sub_0801566C: @ 0x0801566C
	push {r4, lr}
	ldr r3, _08015698 @ =gUnknown_0200E438
	ldr r4, _0801569C @ =gUnknown_03001470
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #5
	adds r2, r2, r4
	ldrh r2, [r2, #0x26]
	movs r0, #0x4c
	muls r0, r2, r0
	adds r3, #0x30
	adds r0, r0, r3
	ldr r2, [r0]
	ldr r3, [r0, #4]
	str r2, [r1]
	str r3, [r1, #4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08015698: .4byte gUnknown_0200E438
_0801569C: .4byte gUnknown_03001470

