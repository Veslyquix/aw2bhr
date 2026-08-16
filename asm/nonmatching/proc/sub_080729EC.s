	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080729EC
sub_080729EC: @ 0x080729EC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	lsls r7, r2, #5
	cmp r3, #0
	ble _08072A12
	adds r4, r3, #0
_080729FA:
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl sub_08012F6C
	adds r6, r6, r7
	movs r0, #0x80
	lsls r0, r0, #3
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bne _080729FA
_08072A12:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

