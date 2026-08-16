	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803CB0C
sub_0803CB0C: @ 0x0803CB0C
	ldr r1, _0803CB20 @ =gUnknown_02028030
	lsrs r2, r0, #3
	adds r2, r2, r1
	movs r1, #7
	ands r1, r0
	movs r0, #1
	lsls r0, r1
	ldrb r1, [r2]
	ands r0, r1
	bx lr
	.align 2, 0
_0803CB20: .4byte gUnknown_02028030

