	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803CF3C
sub_0803CF3C: @ 0x0803CF3C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_0803CF04
	ldr r0, _0803CF50 @ =gUnknown_02000000
	bl sub_0803D238
	pop {r0}
	bx r0
	.align 2, 0
_0803CF50: .4byte gUnknown_02000000

