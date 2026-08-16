	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08018BAC
sub_08018BAC: @ 0x08018BAC
	ldr r2, _08018BC8 @ =gUnknown_0200C528
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r2, #4
	adds r1, r1, r2
	ldr r0, [r1]
	ldr r0, [r0, #4]
	str r0, [r1]
	movs r0, #1
	bx lr
	.align 2, 0
_08018BC8: .4byte gUnknown_0200C528

