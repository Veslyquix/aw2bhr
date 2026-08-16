	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08041E94
sub_08041E94: @ 0x08041E94
	push {lr}
	ldr r0, _08041EA4 @ =gUnknown_030040D8
	ldr r0, [r0]
	bl sub_080743E8
	pop {r0}
	bx r0
	.align 2, 0
_08041EA4: .4byte gUnknown_030040D8

