	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801C240
sub_0801C240: @ 0x0801C240
	adds r1, r0, #0
	cmp r1, #0
	beq _0801C250
	ldr r0, [r1]
	cmp r0, #0
	beq _0801C250
	movs r0, #0
	str r0, [r1]
_0801C250:
	bx lr
	.align 2, 0

