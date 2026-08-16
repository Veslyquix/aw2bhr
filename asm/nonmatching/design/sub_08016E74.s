	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08016E74
sub_08016E74: @ 0x08016E74
	ldr r2, _08016E84 @ =gUnknown_0200C500
	ldr r1, _08016E88 @ =gUnknown_0200C420
	ldr r0, [r1]
	str r0, [r2]
	ldr r0, [r1, #4]
	str r0, [r2, #4]
	bx lr
	.align 2, 0
_08016E84: .4byte gUnknown_0200C500
_08016E88: .4byte gUnknown_0200C420

