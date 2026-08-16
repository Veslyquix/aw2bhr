	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08015BD0
sub_08015BD0: @ 0x08015BD0
	adds r2, r0, #0
	movs r1, #0
	ldr r3, _08015BEC @ =gUnknown_03001470
_08015BD6:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r3
	ldr r0, [r0]
	cmp r0, r2
	bne _08015BF0
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	b _08015BFE
	.align 2, 0
_08015BEC: .4byte gUnknown_03001470
_08015BF0:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x1d
	bls _08015BD6
	movs r0, #1
	rsbs r0, r0, #0
_08015BFE:
	bx lr

