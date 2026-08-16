	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080272B4
sub_080272B4: @ 0x080272B4
	push {lr}
	ldr r0, _080272C0 @ =gUnknown_08499D2C
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080272C0: .4byte gUnknown_08499D2C

