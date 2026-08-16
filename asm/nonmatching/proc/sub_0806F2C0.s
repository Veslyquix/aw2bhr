	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806F2C0
sub_0806F2C0: @ 0x0806F2C0
	push {lr}
	ldr r0, _0806F2D4 @ =gUnknown_08614200
	bl Proc_EndEach
	ldr r0, _0806F2D8 @ =sub_080735B0
	bl sub_08011AAC
	pop {r0}
	bx r0
	.align 2, 0
_0806F2D4: .4byte gUnknown_08614200
_0806F2D8: .4byte sub_080735B0

