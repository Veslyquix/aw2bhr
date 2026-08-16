	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801B6A8
sub_0801B6A8: @ 0x0801B6A8
	cmp r1, #0
	beq _0801B6B8
	movs r2, #0xff
_0801B6AE:
	strb r2, [r0]
	adds r0, #1
	subs r1, #1
	cmp r1, #0
	bne _0801B6AE
_0801B6B8:
	bx lr
	.align 2, 0

