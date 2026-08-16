	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802BF80
sub_0802BF80: @ 0x0802BF80
	push {lr}
	ldr r0, _0802BF90 @ =gUnknown_0849A3C0
	movs r1, #0
	bl sub_080152EC
	pop {r0}
	bx r0
	.align 2, 0
_0802BF90: .4byte gUnknown_0849A3C0

