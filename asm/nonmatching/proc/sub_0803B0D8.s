	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B0D8
sub_0803B0D8: @ 0x0803B0D8
	push {lr}
	ldr r0, _0803B0E8 @ =gUnknown_0849E648
	movs r1, #0
	bl sub_080152EC
	pop {r0}
	bx r0
	.align 2, 0
_0803B0E8: .4byte gUnknown_0849E648

