	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803C950
sub_0803C950: @ 0x0803C950
	push {r4, lr}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _0803C978 @ =gUnknown_02028030
	lsrs r4, r0, #3
	adds r2, #0x10
	adds r4, r4, r2
	movs r3, #7
	ands r3, r0
	movs r2, #1
	lsls r2, r3
	ldrb r0, [r4]
	bics r0, r2
	lsls r1, r3
	orrs r0, r1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803C978: .4byte gUnknown_02028030

