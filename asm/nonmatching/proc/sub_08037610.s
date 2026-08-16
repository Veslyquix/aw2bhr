	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08037610
sub_08037610: @ 0x08037610
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08037624 @ =gUnknown_0849D41C
	movs r1, #0
	bl sub_080152EC
	str r4, [r0, #0x18]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08037624: .4byte gUnknown_0849D41C

