	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08019894
sub_08019894: @ 0x08019894
	ldr r1, _0801989C @ =gUnknown_03003FC0
	movs r0, #0
	strb r0, [r1, #7]
	bx lr
	.align 2, 0
_0801989C: .4byte gUnknown_03003FC0

