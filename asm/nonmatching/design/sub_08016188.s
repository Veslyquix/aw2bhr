	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08016188
sub_08016188: @ 0x08016188
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080161B0 @ =gUnknown_03001470
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #5
	adds r1, #4
	adds r4, r4, r1
	ldr r0, [r4]
	ldrh r0, [r0, #4]
	bl sub_08011684
	ldr r0, [r4]
	adds r0, #8
	str r0, [r4]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080161B0: .4byte gUnknown_03001470

