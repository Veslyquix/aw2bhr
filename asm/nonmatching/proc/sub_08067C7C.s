	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08067C7C
sub_08067C7C: @ 0x08067C7C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08067C90 @ =gUnknown_08581068
	bl Proc_Find
	str r4, [r0, #0x38]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08067C90: .4byte gUnknown_08581068

