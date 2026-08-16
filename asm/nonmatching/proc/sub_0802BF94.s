	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802BF94
sub_0802BF94: @ 0x0802BF94
	push {lr}
	ldr r0, _0802BFA4 @ =gUnknown_0849A3F0
	movs r1, #0
	bl sub_080152EC
	pop {r0}
	bx r0
	.align 2, 0
_0802BFA4: .4byte gUnknown_0849A3F0

