	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080736C4
sub_080736C4: @ 0x080736C4
	push {lr}
	ldr r0, _080736D4 @ =gUnknown_0861418C
	movs r1, #0
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080736D4: .4byte gUnknown_0861418C

