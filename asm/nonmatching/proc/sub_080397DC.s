	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080397DC
sub_080397DC: @ 0x080397DC
	push {lr}
	bl sub_08022A34
	ldr r0, _080397F0 @ =gUnknown_030033EC
	ldrh r0, [r0]
	bl sub_0801A5B0
	pop {r0}
	bx r0
	.align 2, 0
_080397F0: .4byte gUnknown_030033EC

