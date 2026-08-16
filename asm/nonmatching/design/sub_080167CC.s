	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080167CC
sub_080167CC: @ 0x080167CC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080167F4 @ =gUnknown_03001470
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #5
	adds r1, #4
	adds r4, r4, r1
	ldr r1, [r4]
	ldr r1, [r1]
	bl sub_080156E8
	ldr r0, [r4]
	adds r0, #8
	str r0, [r4]
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080167F4: .4byte gUnknown_03001470

