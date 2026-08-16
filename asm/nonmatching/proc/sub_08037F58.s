	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08037F58
sub_08037F58: @ 0x08037F58
	push {lr}
	bl sub_08037F18
	ldr r0, _08037F6C @ =gUnknown_0849D55C
	movs r1, #0
	bl sub_080152C0
	pop {r0}
	bx r0
	.align 2, 0
_08037F6C: .4byte gUnknown_0849D55C

