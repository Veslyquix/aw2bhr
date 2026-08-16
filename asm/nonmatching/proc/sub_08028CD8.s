	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08028CD8
sub_08028CD8: @ 0x08028CD8
	ldr r2, _08028CEC @ =gUnknown_030032D8
	ldrh r1, [r2]
	cmp r1, #0x10
	beq _08028CE8
	ldr r0, _08028CF0 @ =gUnknown_030044DC
	strh r1, [r0]
	movs r0, #0x10
	strh r0, [r2]
_08028CE8:
	bx lr
	.align 2, 0
_08028CEC: .4byte gUnknown_030032D8
_08028CF0: .4byte gUnknown_030044DC

