	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803C2E8
sub_0803C2E8: @ 0x0803C2E8
	push {lr}
	ldr r0, _0803C2F8 @ =gUnknown_0849ECE0
	movs r1, #0
	bl sub_080152EC
	pop {r0}
	bx r0
	.align 2, 0
_0803C2F8: .4byte gUnknown_0849ECE0

