	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801B690
sub_0801B690: @ 0x0801B690
	adds r3, r0, #0
	cmp r2, #0
	beq _0801B6A4
_0801B696:
	ldrb r0, [r3]
	strb r0, [r1]
	adds r3, #1
	adds r1, #1
	subs r2, #1
	cmp r2, #0
	bne _0801B696
_0801B6A4:
	bx lr
	.align 2, 0

