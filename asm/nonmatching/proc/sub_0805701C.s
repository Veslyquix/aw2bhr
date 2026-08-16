	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805701C
sub_0805701C: @ 0x0805701C
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	lsls r3, r3, #0x10
	ldr r4, _08057040 @ =gUnknown_08551A04
	ldr r4, [r4]
	lsrs r1, r1, #0xf
	adds r1, r1, r4
	lsrs r2, r2, #4
	lsrs r3, r3, #6
	orrs r2, r3
	adds r0, r0, r2
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08057040: .4byte gUnknown_08551A04

