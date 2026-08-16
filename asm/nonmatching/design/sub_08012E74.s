	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08012E74
sub_08012E74: @ 0x08012E74
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsrs r1, r1, #0xb
	adds r1, r1, r0
	ldr r0, _08012E98 @ =gUnknown_08499578
	ldr r0, [r0]
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r3, #0xc0
	lsls r3, r3, #8
	adds r0, r3, #0
	orrs r2, r0
	strh r2, [r1]
	bx lr
	.align 2, 0
_08012E98: .4byte gUnknown_08499578

