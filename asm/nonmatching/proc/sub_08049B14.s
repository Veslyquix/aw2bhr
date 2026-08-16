	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08049B14
sub_08049B14: @ 0x08049B14
	push {lr}
	ldr r0, _08049B24 @ =gUnknown_084C3128
	movs r1, #0
	bl sub_080152C0
	pop {r0}
	bx r0
	.align 2, 0
_08049B24: .4byte gUnknown_084C3128

