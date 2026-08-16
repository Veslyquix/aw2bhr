	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802813C
sub_0802813C: @ 0x0802813C
	ldr r1, _0802814C @ =gUnknown_08499E38
	ldr r0, _08028150 @ =gUnknown_02028E40
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0802814C: .4byte gUnknown_08499E38
_08028150: .4byte gUnknown_02028E40

