	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08073D1C
sub_08073D1C: @ 0x08073D1C
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	movs r2, #7
_08073D26:
	ldrb r0, [r3, #7]
	lsls r0, r0, #4
	ldrb r1, [r3, #6]
	orrs r0, r1
	lsls r0, r0, #4
	ldrb r1, [r3, #5]
	orrs r0, r1
	lsls r0, r0, #4
	ldrb r1, [r3, #4]
	orrs r0, r1
	lsls r0, r0, #4
	ldrb r1, [r3, #3]
	orrs r0, r1
	lsls r0, r0, #4
	ldrb r1, [r3, #2]
	orrs r0, r1
	lsls r0, r0, #4
	ldrb r1, [r3, #1]
	orrs r0, r1
	lsls r0, r0, #4
	ldrb r1, [r3]
	orrs r0, r1
	stm r5!, {r0}
	lsls r0, r4, #3
	adds r3, r3, r0
	subs r2, #1
	cmp r2, #0
	bge _08073D26
	pop {r4, r5}
	pop {r0}
	bx r0

