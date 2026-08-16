	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034890
sub_08034890: @ 0x08034890
	push {lr}
	bl sub_0802150C
	ldr r0, _080348B0 @ =gUnknown_03003FC0
	ldrb r0, [r0, #2]
	bl sub_0802163C
	bl sub_08021598
	bl sub_080215B8
	bl sub_080267AC
	pop {r0}
	bx r0
	.align 2, 0
_080348B0: .4byte gUnknown_03003FC0

