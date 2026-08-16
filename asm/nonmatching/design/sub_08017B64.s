	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08017B64
sub_08017B64: @ 0x08017B64
	ldr r2, _08017B88 @ =gUnknown_0200C528
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r2, #4
	adds r1, r1, r2
	ldr r0, [r1]
	ldr r2, [r0, #4]
	ldr r0, [r0, #0xc]
	strb r0, [r2]
	ldr r0, [r1]
	adds r0, #0x10
	str r0, [r1]
	movs r0, #1
	bx lr
	.align 2, 0
_08017B88: .4byte gUnknown_0200C528

