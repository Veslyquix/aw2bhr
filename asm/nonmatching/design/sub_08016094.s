	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08016094
sub_08016094: @ 0x08016094
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _080160B4 @ =gUnknown_03002F1C
	ldrh r0, [r1]
	cmp r0, #0
	bne _080160BC
	ldr r0, _080160B8 @ =gUnknown_03001470
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #5
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	adds r0, #8
	str r0, [r1]
	b _080160D2
	.align 2, 0
_080160B4: .4byte gUnknown_03002F1C
_080160B8: .4byte gUnknown_03001470
_080160BC:
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080160D8 @ =gUnknown_03001470
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #5
	adds r1, #4
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r1, [r1]
	str r1, [r0]
_080160D2:
	movs r0, #1
	bx lr
	.align 2, 0
_080160D8: .4byte gUnknown_03001470

