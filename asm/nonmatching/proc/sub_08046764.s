	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08046764
sub_08046764: @ 0x08046764
	push {lr}
	ldr r0, _08046774 @ =gUnknown_084C1824
	movs r1, #0
	bl sub_080152EC
	pop {r0}
	bx r0
	.align 2, 0
_08046774: .4byte gUnknown_084C1824

