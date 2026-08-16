	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034FC0
sub_08034FC0: @ 0x08034FC0
	ldr r1, _08034FD4 @ =gUnknown_030040E8
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _08034FD0
	subs r0, r2, #1
	strh r0, [r1]
_08034FD0:
	bx lr
	.align 2, 0
_08034FD4: .4byte gUnknown_030040E8

