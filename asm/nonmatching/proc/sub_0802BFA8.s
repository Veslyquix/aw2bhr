	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802BFA8
sub_0802BFA8: @ 0x0802BFA8
	push {lr}
	ldr r0, _0802BFB8 @ =gUnknown_0849A428
	movs r1, #0
	bl sub_080152EC
	pop {r0}
	bx r0
	.align 2, 0
_0802BFB8: .4byte gUnknown_0849A428

