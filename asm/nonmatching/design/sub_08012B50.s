	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08012B50
sub_08012B50: @ 0x08012B50
	adds r3, r0, #0
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	cmp r0, #0
	beq _08012B6C
_08012B5E:
	strh r2, [r3]
	adds r3, #2
	subs r0, #2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _08012B5E
_08012B6C:
	bx lr
	.align 2, 0

