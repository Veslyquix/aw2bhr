	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801BA1C
sub_0801BA1C: @ 0x0801BA1C
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r2, #0
	ble _0801BA46
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r4, r0, #1
	adds r3, r5, #0
	adds r3, #0x40
	adds r0, r5, #0
_0801BA34:
	strh r1, [r0]
	strh r4, [r3]
	adds r4, #2
	adds r3, #2
	adds r1, #2
	adds r0, #2
	subs r2, #1
	cmp r2, #0
	bne _0801BA34
_0801BA46:
	pop {r4, r5}
	pop {r0}
	bx r0

