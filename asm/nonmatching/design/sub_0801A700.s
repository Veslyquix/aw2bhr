	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801A700
sub_0801A700: @ 0x0801A700
	ldr r2, _0801A710 @ =gUnknown_030020A8
	ldr r1, [r2, #4]
	cmp r1, #0
	beq _0801A714
	ldr r0, [r1, #4]
	str r0, [r2, #4]
	ldr r0, [r1]
	b _0801A716
	.align 2, 0
_0801A710: .4byte gUnknown_030020A8
_0801A714:
	movs r0, #0
_0801A716:
	bx lr

