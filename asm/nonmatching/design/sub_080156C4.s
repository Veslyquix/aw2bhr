	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080156C4
sub_080156C4: @ 0x080156C4
	push {lr}
	ldr r2, _080156E4 @ =gUnknown_03001470
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r1, r1, r2
	ldrh r0, [r1, #0x26]
	bl sub_0801DA54
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
_080156E4: .4byte gUnknown_03001470

