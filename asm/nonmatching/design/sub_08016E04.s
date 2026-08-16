	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08016E04
sub_08016E04: @ 0x08016E04
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08016E0E
	movs r0, #1
	b _08016E10
_08016E0E:
	movs r0, #0
_08016E10:
	bx lr
	.align 2, 0

