	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08071B88
sub_08071B88: @ 0x08071B88
	push {lr}
	ldr r0, _08071B94 @ =gUnknown_08613E54
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08071B94: .4byte gUnknown_08613E54

