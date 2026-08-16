	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08015184
sub_08015184: @ 0x08015184
	movs r1, #0
	ldr r3, _080151A8 @ =gUnknown_03001470
	movs r2, #0
_0801518A:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r3
	str r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x1d
	bls _0801518A
	ldr r1, _080151AC @ =gUnknown_03002F1C
	movs r0, #0
	strh r0, [r1]
	bx lr
	.align 2, 0
_080151A8: .4byte gUnknown_03001470
_080151AC: .4byte gUnknown_03002F1C

