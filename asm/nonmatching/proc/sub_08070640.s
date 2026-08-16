	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08070640
sub_08070640: @ 0x08070640
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, [r2, #0x34]
	ldr r0, _08070660 @ =0x68736D53
	cmp r3, r0
	bne _0807065E
	strh r1, [r2, #0x26]
	strh r1, [r2, #0x24]
	movs r0, #2
	strh r0, [r2, #0x28]
	ldr r0, [r2, #4]
	ldr r1, _08070664 @ =0x7FFFFFFF
	ands r0, r1
	str r0, [r2, #4]
_0807065E:
	bx lr
	.align 2, 0
_08070660: .4byte 0x68736D53
_08070664: .4byte 0x7FFFFFFF

