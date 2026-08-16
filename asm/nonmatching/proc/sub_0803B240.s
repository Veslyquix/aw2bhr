	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B240
sub_0803B240: @ 0x0803B240
	push {lr}
	ldr r0, _0803B250 @ =gUnknown_0849E6D4
	movs r1, #0
	bl sub_080152C0
	pop {r0}
	bx r0
	.align 2, 0
_0803B250: .4byte gUnknown_0849E6D4

