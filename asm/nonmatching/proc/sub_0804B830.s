	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804B830
sub_0804B830: @ 0x0804B830
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #8
	bne _0804B84A
	ldr r0, _0804B84C @ =gUnknown_030045A8
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #0x15
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_0804B84A:
	bx lr
	.align 2, 0
_0804B84C: .4byte gUnknown_030045A8

