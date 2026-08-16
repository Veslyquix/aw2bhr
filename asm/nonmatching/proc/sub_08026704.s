	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08026704
sub_08026704: @ 0x08026704
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_0802670A:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #5
	bne _08026716
	movs r4, #1
_08026716:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802670A
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1

