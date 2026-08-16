	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801224C
sub_0801224C: @ 0x0801224C
	ldr r2, _08012258 @ =gUnknown_03000044
	strh r0, [r2]
	ldr r0, _0801225C @ =gUnknown_03000046
	strh r1, [r0]
	bx lr
	.align 2, 0
_08012258: .4byte gUnknown_03000044
_0801225C: .4byte gUnknown_03000046

