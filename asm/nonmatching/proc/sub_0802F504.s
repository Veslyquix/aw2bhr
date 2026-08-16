	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802F504
sub_0802F504: @ 0x0802F504
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #0
_0802F50A:
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	bl sub_0802F480
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0802F524
	lsls r0, r5, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r0, r1
	lsrs r5, r0, #0x18
_0802F524:
	adds r4, #1
	cmp r4, #3
	ble _0802F50A
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1

