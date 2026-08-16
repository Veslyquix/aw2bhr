	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08028ED0
sub_08028ED0: @ 0x08028ED0
	push {lr}
	adds r1, r0, #0
	ldr r0, _08028EE0 @ =gUnknown_08499FEC
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_08028EE0: .4byte gUnknown_08499FEC

