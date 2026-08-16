	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803CAD4
sub_0803CAD4: @ 0x0803CAD4
	ldr r1, _0803CAEC @ =gUnknown_02028030
	lsrs r2, r0, #3
	adds r1, #0x2d
	adds r2, r2, r1
	movs r1, #7
	ands r1, r0
	movs r0, #1
	lsls r0, r1
	ldrb r1, [r2]
	ands r0, r1
	bx lr
	.align 2, 0
_0803CAEC: .4byte gUnknown_02028030

