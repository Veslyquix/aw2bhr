	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080155E8
sub_080155E8: @ 0x080155E8
	push {r4, lr}
	ldr r4, _08015604 @ =gUnknown_03001470
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r3, r0, #1
	adds r3, r3, r0
	lsls r3, r3, #5
	adds r3, r3, r4
	ldrh r0, [r3, #0x26]
	bl sub_0801D9E4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08015604: .4byte gUnknown_03001470

