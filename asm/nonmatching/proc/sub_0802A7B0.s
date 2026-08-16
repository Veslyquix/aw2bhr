	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802A7B0
sub_0802A7B0: @ 0x0802A7B0
	push {lr}
	ldr r0, _0802A7C0 @ =gUnknown_0849A1C0
	movs r1, #0
	bl sub_080152C0
	pop {r0}
	bx r0
	.align 2, 0
_0802A7C0: .4byte gUnknown_0849A1C0

