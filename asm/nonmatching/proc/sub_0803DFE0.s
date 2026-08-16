	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803DFE0
sub_0803DFE0: @ 0x0803DFE0
	adds r2, r0, #0
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1c
	cmp r0, #3
	beq _0803E008
	cmp r0, #3
	bgt _0803DFF6
	cmp r0, #1
	beq _0803E000
	b _0803E018
_0803DFF6:
	cmp r0, #4
	beq _0803E000
	cmp r0, #5
	beq _0803E008
	b _0803E018
_0803E000:
	ldrb r0, [r2]
	strh r0, [r1]
	ldrb r0, [r2, #1]
	b _0803E012
_0803E008:
	ldrb r0, [r2]
	adds r0, #1
	strh r0, [r1]
	ldrb r0, [r2, #1]
	adds r0, #2
_0803E012:
	strh r0, [r1, #2]
	movs r0, #1
	b _0803E01A
_0803E018:
	movs r0, #0
_0803E01A:
	bx lr

