	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08056D70
sub_08056D70: @ 0x08056D70
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	cmp r0, #0xd
	bne _08056D88
	movs r2, #2
	cmp r1, #1
	bne _08056D88
	movs r2, #1
_08056D88:
	adds r0, r2, #0
	bx lr

