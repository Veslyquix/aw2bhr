	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08016E8C
sub_08016E8C: @ 0x08016E8C
	ldr r2, _08016E9C @ =gUnknown_0200C420
	ldr r1, _08016EA0 @ =gUnknown_0200C500
	ldr r0, [r1]
	str r0, [r2]
	ldr r0, [r1, #4]
	str r0, [r2, #4]
	bx lr
	.align 2, 0
_08016E9C: .4byte gUnknown_0200C420
_08016EA0: .4byte gUnknown_0200C500

