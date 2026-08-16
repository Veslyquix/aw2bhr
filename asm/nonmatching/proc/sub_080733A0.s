	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080733A0
sub_080733A0: @ 0x080733A0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080733B4 @ =gUnknown_086140D4
	bl Proc_Find
	adds r0, #0x68
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080733B4: .4byte gUnknown_086140D4

