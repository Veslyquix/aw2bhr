	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08042B84
sub_08042B84: @ 0x08042B84
	push {lr}
	ldr r0, _08042B98 @ =gUnknown_0849A0F0
	movs r1, #0
	bl sub_080152EC
	movs r1, #1
	strh r1, [r0, #0x20]
	pop {r0}
	bx r0
	.align 2, 0
_08042B98: .4byte gUnknown_0849A0F0

