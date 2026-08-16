	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C1F0
sub_0802C1F0: @ 0x0802C1F0
	push {r4, lr}
	adds r3, r0, #0
	subs r2, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _0802C20E
	adds r4, r0, #0
_0802C200:
	ldrb r0, [r3]
	strb r0, [r1]
	adds r3, #1
	adds r1, #1
	subs r2, #1
	cmp r2, r4
	bne _0802C200
_0802C20E:
	pop {r4}
	pop {r0}
	bx r0

