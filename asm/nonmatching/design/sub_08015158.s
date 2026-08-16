	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08015158
sub_08015158: @ 0x08015158
	movs r2, #0
	movs r1, #0
	ldr r3, _08015180 @ =gUnknown_03001470
_0801515E:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r3
	ldr r0, [r0]
	cmp r0, #0
	bne _08015172
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_08015172:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x1d
	bls _0801515E
	adds r0, r2, #0
	bx lr
	.align 2, 0
_08015180: .4byte gUnknown_03001470

