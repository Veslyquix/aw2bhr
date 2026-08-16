	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806A4B0
sub_0806A4B0: @ 0x0806A4B0
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0806A4C8 @ =gUnknown_08581108
	bl Proc_Find
	adds r0, #0x3d
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A4C8: .4byte gUnknown_08581108

