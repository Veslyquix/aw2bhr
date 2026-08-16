	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08035568
sub_08035568: @ 0x08035568
	movs r1, #0
	ldr r3, _08035580 @ =gUnknown_03003124
	movs r2, #0
_0803556E:
	adds r0, r1, r3
	strb r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #2
	bls _0803556E
	bx lr
	.align 2, 0
_08035580: .4byte gUnknown_03003124

