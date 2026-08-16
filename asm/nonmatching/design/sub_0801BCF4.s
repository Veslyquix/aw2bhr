	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801BCF4
sub_0801BCF4: @ 0x0801BCF4
	ldr r0, _0801BCFC @ =gUnknown_03000278
	ldrh r0, [r0, #0xa]
	bx lr
	.align 2, 0
_0801BCFC: .4byte gUnknown_03000278

