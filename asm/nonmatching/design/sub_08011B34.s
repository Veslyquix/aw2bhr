	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08011B34
sub_08011B34: @ 0x08011B34
	adds r2, r0, #0
	ldr r1, _08011B40 @ =gUnknown_03000000
	adds r0, r1, #0
	adds r0, #0x40
	b _08011B48
	.align 2, 0
_08011B40: .4byte gUnknown_03000000
_08011B44:
	adds r1, #4
	ldr r0, _08011B58 @ =gUnknown_03000040
_08011B48:
	cmp r1, r0
	bhs _08011B54
	ldr r0, [r1]
	cmp r0, #0
	bne _08011B44
	str r2, [r1]
_08011B54:
	bx lr
	.align 2, 0
_08011B58: .4byte gUnknown_03000040

