	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08028168
sub_08028168: @ 0x08028168
	push {lr}
	ldr r0, _08028178 @ =gUnknown_030033EC
	ldrh r0, [r0]
	bl sub_0801A5B0
	pop {r0}
	bx r0
	.align 2, 0
_08028178: .4byte gUnknown_030033EC

