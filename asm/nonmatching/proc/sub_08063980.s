	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08063980
sub_08063980: @ 0x08063980
	ldr r2, _08063990 @ =0x04000004
	ldrb r1, [r2]
	lsls r0, r0, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	strh r1, [r2]
	bx lr
	.align 2, 0
_08063990: .4byte 0x04000004

