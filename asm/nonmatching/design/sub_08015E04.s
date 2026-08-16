	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08015E04
sub_08015E04: @ 0x08015E04
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _08015E28 @ =gUnknown_03001470
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r0, r3, #4
	adds r0, r1, r0
	ldr r2, [r0]
	ldr r2, [r2]
	str r2, [r0]
	adds r1, r1, r3
	movs r0, #0
	strh r0, [r1, #0x10]
	strh r0, [r1, #0x38]
	movs r0, #1
	bx lr
	.align 2, 0
_08015E28: .4byte gUnknown_03001470

