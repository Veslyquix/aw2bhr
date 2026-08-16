	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080281D8
sub_080281D8: @ 0x080281D8
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, _080281EC @ =gUnknown_08499EE4
	movs r1, #0
	bl sub_080152EC
	str r4, [r0, #0x18]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080281EC: .4byte gUnknown_08499EE4

