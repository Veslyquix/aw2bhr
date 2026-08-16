	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08012B00
sub_08012B00: @ 0x08012B00
	adds r3, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	cmp r1, #0
	beq _08012B20
_08012B0E:
	ldrh r0, [r3]
	adds r0, r2, r0
	strh r0, [r3]
	adds r3, #2
	subs r0, r1, #2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _08012B0E
_08012B20:
	bx lr
	.align 2, 0

