	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08012FA4
sub_08012FA4: @ 0x08012FA4
	cmp r1, #0
	beq _08012FB4
	movs r2, #0
_08012FAA:
	strb r2, [r0]
	adds r0, #1
	subs r1, #1
	cmp r1, #0
	bne _08012FAA
_08012FB4:
	bx lr
	.align 2, 0

