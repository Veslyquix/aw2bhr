	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08011A84
sub_08011A84: @ 0x08011A84
	ldr r1, _08011AA4 @ =gUnknown_030030E8
	movs r0, #0
	strh r0, [r1]
	movs r1, #0
	ldr r3, _08011AA8 @ =gUnknown_03002FA0
	movs r2, #0
_08011A90:
	lsls r0, r1, #2
	adds r0, r0, r3
	str r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xf
	bls _08011A90
	bx lr
	.align 2, 0
_08011AA4: .4byte gUnknown_030030E8
_08011AA8: .4byte gUnknown_03002FA0

