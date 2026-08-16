	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080281C4
sub_080281C4: @ 0x080281C4
	push {lr}
	ldr r0, _080281D4 @ =gUnknown_08499EE4
	movs r1, #0
	bl sub_080152EC
	pop {r0}
	bx r0
	.align 2, 0
_080281D4: .4byte gUnknown_08499EE4

