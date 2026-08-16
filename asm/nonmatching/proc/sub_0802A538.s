	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802A538
sub_0802A538: @ 0x0802A538
	push {lr}
	ldr r0, _0802A548 @ =gUnknown_0849A128
	movs r1, #0
	bl sub_080152C0
	pop {r0}
	bx r0
	.align 2, 0
_0802A548: .4byte gUnknown_0849A128

