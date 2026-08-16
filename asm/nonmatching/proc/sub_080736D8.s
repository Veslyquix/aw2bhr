	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080736D8
sub_080736D8: @ 0x080736D8
	push {lr}
	ldr r0, _080736EC @ =gUnknown_0861418C
	bl Proc_EndEach
	ldr r0, _080736F0 @ =sub_080735B0
	bl sub_08011AAC
	pop {r0}
	bx r0
	.align 2, 0
_080736EC: .4byte gUnknown_0861418C
_080736F0: .4byte sub_080735B0

