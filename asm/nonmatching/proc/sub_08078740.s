	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078740
sub_08078740: @ 0x08078740
	ldr r1, _08078754 @ =gUnknown_030059C0
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x10
_08078748:
	str r2, [r0]
	subs r0, #4
	cmp r0, r1
	bge _08078748
	bx lr
	.align 2, 0
_08078754: .4byte gUnknown_030059C0

