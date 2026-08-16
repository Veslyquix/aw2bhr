	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08015DA0
sub_08015DA0: @ 0x08015DA0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08015DC4 @ =gUnknown_03001470
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r3, r1, r2
	adds r2, #4
	adds r1, r1, r2
	ldr r0, [r1]
	ldrh r0, [r0, #4]
	strh r0, [r3, #0x10]
	ldr r0, [r1]
	adds r0, #8
	str r0, [r1]
	movs r0, #0
	bx lr
	.align 2, 0
_08015DC4: .4byte gUnknown_03001470

