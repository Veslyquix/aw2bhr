	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034CB8
sub_08034CB8: @ 0x08034CB8
	push {lr}
	movs r0, #0
	bl sub_0802776C
	bl sub_080742FC
	ldr r1, _08034CD0 @ =gUnknown_030032D8
	movs r0, #0xb
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08034CD0: .4byte gUnknown_030032D8

