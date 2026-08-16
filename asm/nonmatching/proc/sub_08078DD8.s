	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078DD8
sub_08078DD8: @ 0x08078DD8
	ldr r0, _08078DF8 @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08078DF4
	ldr r1, _08078DFC @ =gUnknown_0300200C
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r1, _08078E00 @ =gUnknown_03002000
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_08078DF4:
	bx lr
	.align 2, 0
_08078DF8: .4byte gUnknown_03004008
_08078DFC: .4byte gUnknown_0300200C
_08078E00: .4byte gUnknown_03002000

