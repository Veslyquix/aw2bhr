	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803AF5C
sub_0803AF5C: @ 0x0803AF5C
	push {lr}
	ldr r0, _0803AF6C @ =gUnknown_0849E610
	movs r1, #0
	bl sub_080152EC
	pop {r0}
	bx r0
	.align 2, 0
_0803AF6C: .4byte gUnknown_0849E610

