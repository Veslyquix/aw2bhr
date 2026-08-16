	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080364E0
sub_080364E0: @ 0x080364E0
	push {lr}
	ldr r0, _080364F0 @ =gUnknown_0849D10C
	movs r1, #0
	bl sub_080152C0
	pop {r0}
	bx r0
	.align 2, 0
_080364F0: .4byte gUnknown_0849D10C

