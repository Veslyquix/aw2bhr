	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803ACB8
sub_0803ACB8: @ 0x0803ACB8
	push {lr}
	bl sub_080116E8
	ldr r0, _0803ACCC @ =gUnknown_0849E600
	movs r1, #0
	bl sub_080152EC
	pop {r0}
	bx r0
	.align 2, 0
_0803ACCC: .4byte gUnknown_0849E600

