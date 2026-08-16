	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08043D74
sub_08043D74: @ 0x08043D74
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #0xb
	bne _08043D80
	movs r0, #0xa
_08043D80:
	bx lr
	.align 2, 0

