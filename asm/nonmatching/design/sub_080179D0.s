	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080179D0
sub_080179D0: @ 0x080179D0
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0
	movs r5, #0
_080179D8:
	movs r0, #0
	lsls r3, r1, #0x10
	asrs r2, r3, #0xa
_080179DE:
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #1
	adds r0, r0, r4
	adds r0, r2, r0
	strh r5, [r0]
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x16
	ble _080179DE
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r3, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _080179D8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

