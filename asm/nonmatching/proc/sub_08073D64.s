	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08073D64
sub_08073D64: @ 0x08073D64
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	movs r0, #0
	cmp r0, r3
	bge _08073D90
_08073D72:
	adds r2, r0, #1
	cmp r5, #0
	ble _08073D8A
	lsls r0, r0, #6
	adds r0, r0, r6
	adds r1, r5, #0
_08073D7E:
	strh r4, [r0]
	adds r4, #1
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bne _08073D7E
_08073D8A:
	adds r0, r2, #0
	cmp r0, r3
	blt _08073D72
_08073D90:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

