	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08073CF4
sub_08073CF4: @ 0x08073CF4
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	cmp r7, #0
	ble _08073D16
	adds r4, r7, #0
_08073D02:
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl sub_08073D1C
	adds r6, #8
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bne _08073D02
_08073D16:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

