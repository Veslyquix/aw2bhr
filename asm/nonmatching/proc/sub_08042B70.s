	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08042B70
sub_08042B70: @ 0x08042B70
	push {lr}
	ldr r0, _08042B80 @ =gUnknown_0849A0F0
	movs r1, #0
	bl sub_080152EC
	pop {r0}
	bx r0
	.align 2, 0
_08042B80: .4byte gUnknown_0849A0F0

