	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08075F1C
sub_08075F1C: @ 0x08075F1C
	lsls r1, r1, #0x12
	movs r2, #0xa4
	lsls r2, r2, #0xe
	adds r1, r1, r2
	lsrs r1, r1, #0x10
	strh r1, [r0]
	adds r0, #2
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	strh r1, [r0]
	adds r0, #0x3e
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	strh r1, [r0]
	adds r1, #1
	strh r1, [r0, #2]
	bx lr
	.align 2, 0

