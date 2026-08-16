	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08016E5C
sub_08016E5C: @ 0x08016E5C
	ldr r0, _08016E6C @ =gUnknown_0200C420
	ldrb r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08016E70
	movs r0, #1
	b _08016E72
	.align 2, 0
_08016E6C: .4byte gUnknown_0200C420
_08016E70:
	movs r0, #0
_08016E72:
	bx lr

