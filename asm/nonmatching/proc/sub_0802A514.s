	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802A514
sub_0802A514: @ 0x0802A514
	push {lr}
	ldr r0, _0802A524 @ =gUnknown_0849A108
	movs r1, #1
	bl sub_080152C0
	pop {r0}
	bx r0
	.align 2, 0
_0802A524: .4byte gUnknown_0849A108

