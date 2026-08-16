	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08011B18
sub_08011B18: @ 0x08011B18
	movs r1, #0
	ldr r3, _08011B30 @ =gUnknown_03000000
	movs r2, #0
_08011B1E:
	lsls r0, r1, #2
	adds r0, r0, r3
	str r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xf
	bls _08011B1E
	bx lr
	.align 2, 0
_08011B30: .4byte gUnknown_03000000

