	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08070620
sub_08070620: @ 0x08070620
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, [r2, #0x34]
	ldr r0, _08070638 @ =0x68736D53
	cmp r3, r0
	bne _08070636
	strh r1, [r2, #0x26]
	strh r1, [r2, #0x24]
	ldr r0, _0807063C @ =0x00000101
	strh r0, [r2, #0x28]
_08070636:
	bx lr
	.align 2, 0
_08070638: .4byte 0x68736D53
_0807063C: .4byte 0x00000101

