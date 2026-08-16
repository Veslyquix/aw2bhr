	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801A604
sub_0801A604: @ 0x0801A604
	ldr r1, _0801A60C @ =gUnknown_03002F24
	ldr r0, _0801A610 @ =gUnknown_03002F50
	str r0, [r1]
	bx lr
	.align 2, 0
_0801A60C: .4byte gUnknown_03002F24
_0801A610: .4byte gUnknown_03002F50

