	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C16C
sub_0802C16C: @ 0x0802C16C
	push {lr}
	ldr r0, _0802C180 @ =gUnknown_030033EC
	ldrh r0, [r0]
	bl sub_0802C154
	bl sub_08028CD8
	pop {r0}
	bx r0
	.align 2, 0
_0802C180: .4byte gUnknown_030033EC

