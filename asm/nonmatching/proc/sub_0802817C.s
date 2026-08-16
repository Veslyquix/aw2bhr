	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802817C
sub_0802817C: @ 0x0802817C
	push {lr}
	ldr r0, _0802818C @ =gUnknown_08499E4C
	movs r1, #0
	bl sub_080152EC
	pop {r0}
	bx r0
	.align 2, 0
_0802818C: .4byte gUnknown_08499E4C

