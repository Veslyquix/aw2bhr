	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803D9EC
sub_0803D9EC: @ 0x0803D9EC
	ldr r1, _0803D9F8 @ =gUnknown_030033EC
	ldrh r1, [r1]
	strh r1, [r0, #0x1e]
	movs r1, #1
	strh r1, [r0, #0x20]
	bx lr
	.align 2, 0
_0803D9F8: .4byte gUnknown_030033EC

