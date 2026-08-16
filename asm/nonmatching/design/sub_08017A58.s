	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08017A58
sub_08017A58: @ 0x08017A58
	ldr r2, _08017A7C @ =gUnknown_0200C528
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r3, r1, r2
	adds r2, #4
	adds r1, r1, r2
	ldr r0, [r1]
	ldr r0, [r0, #0xc]
	strh r0, [r3, #0xc]
	ldr r0, [r1]
	adds r0, #0x10
	str r0, [r1]
	movs r0, #0
	bx lr
	.align 2, 0
_08017A7C: .4byte gUnknown_0200C528

