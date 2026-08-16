	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08018EE4
sub_08018EE4: @ 0x08018EE4
	ldr r2, _08018F00 @ =gUnknown_0200C528
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r2, #4
	adds r1, r1, r2
	ldr r0, [r1]
	adds r0, #0x10
	str r0, [r1]
	movs r0, #1
	bx lr
	.align 2, 0
_08018F00: .4byte gUnknown_0200C528

