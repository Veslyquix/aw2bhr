	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08026798
sub_08026798: @ 0x08026798
	push {lr}
	ldr r1, _080267A8 @ =gUnknown_030032C0
	movs r0, #0
	strh r0, [r1]
	bl sub_08020984
	pop {r0}
	bx r0
	.align 2, 0
_080267A8: .4byte gUnknown_030032C0

