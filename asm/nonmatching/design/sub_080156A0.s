	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080156A0
sub_080156A0: @ 0x080156A0
	push {lr}
	ldr r2, _080156C0 @ =gUnknown_03001470
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r1, r1, r2
	ldrh r0, [r1, #0x26]
	bl sub_0801DA44
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
_080156C0: .4byte gUnknown_03001470

