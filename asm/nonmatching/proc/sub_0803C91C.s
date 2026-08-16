	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803C91C
sub_0803C91C: @ 0x0803C91C
	push {r4, lr}
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	bl sub_080206B0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r1, _0803C94C @ =gUnknown_02028030
	lsrs r0, r0, #0x13
	adds r1, #0x12
	adds r0, r0, r1
	movs r1, #7
	ands r3, r1
	movs r2, #1
	lsls r2, r3
	ldrb r1, [r0]
	bics r1, r2
	lsls r4, r3
	orrs r1, r4
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803C94C: .4byte gUnknown_02028030

