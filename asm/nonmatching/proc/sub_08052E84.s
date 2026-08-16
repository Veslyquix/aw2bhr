	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08052E84
sub_08052E84: @ 0x08052E84
	ldr r0, _08052EA0 @ =0x04000006
	ldrh r1, [r0]
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #0x10
	cmp r0, #0x9f
	bhi _08052E9C
	ldr r0, _08052EA4 @ =0x04000010
	lsrs r1, r1, #0x11
	strh r1, [r0]
	adds r0, #4
	strh r1, [r0]
_08052E9C:
	bx lr
	.align 2, 0
_08052EA0: .4byte 0x04000006
_08052EA4: .4byte 0x04000010

