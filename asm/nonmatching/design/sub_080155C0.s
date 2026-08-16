	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080155C0
sub_080155C0: @ 0x080155C0
	push {r4, lr}
	ldr r4, _080155E4 @ =gUnknown_03001470
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r3, r0, #1
	adds r3, r3, r0
	lsls r3, r3, #5
	adds r3, r3, r4
	ldrh r0, [r3, #0x26]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl sub_0801D96C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080155E4: .4byte gUnknown_03001470

