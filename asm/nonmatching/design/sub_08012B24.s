	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08012B24
sub_08012B24: @ 0x08012B24
	push {r4, lr}
	adds r4, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	cmp r2, #0
	beq _08012B48
_08012B34:
	ldrh r0, [r4]
	adds r0, r3, r0
	strh r0, [r1]
	adds r4, #2
	adds r1, #2
	subs r0, r2, #2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	bne _08012B34
_08012B48:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

