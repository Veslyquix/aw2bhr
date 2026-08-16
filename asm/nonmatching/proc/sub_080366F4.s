	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080366F4
sub_080366F4: @ 0x080366F4
	push {lr}
	ldr r0, _08036708 @ =gUnknown_030040D0
	ldr r0, [r0]
	cmp r0, #0
	beq _08036702
	bl _call_via_r0
_08036702:
	pop {r0}
	bx r0
	.align 2, 0
_08036708: .4byte gUnknown_030040D0

