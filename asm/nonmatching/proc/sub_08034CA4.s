	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034CA4
sub_08034CA4: @ 0x08034CA4
	push {lr}
	bl sub_0802A538
	ldr r1, _08034CB4 @ =gUnknown_030032D8
	movs r0, #0xa
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08034CB4: .4byte gUnknown_030032D8

