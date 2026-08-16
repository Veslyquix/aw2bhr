	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080160DC
sub_080160DC: @ 0x080160DC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080160FC @ =gUnknown_03002F1C
	movs r1, #1
	strh r1, [r2]
	ldr r2, _08016100 @ =gUnknown_03001470
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r2, #4
	adds r1, r1, r2
	ldr r0, [r1]
	adds r0, #8
	str r0, [r1]
	movs r0, #1
	bx lr
	.align 2, 0
_080160FC: .4byte gUnknown_03002F1C
_08016100: .4byte gUnknown_03001470

