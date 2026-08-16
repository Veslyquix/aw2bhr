	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C130
sub_0802C130: @ 0x0802C130
	push {lr}
	ldr r0, _0802C140 @ =gUnknown_0849A4A0
	movs r1, #0
	bl sub_080152EC
	pop {r0}
	bx r0
	.align 2, 0
_0802C140: .4byte gUnknown_0849A4A0

