	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08073C88
sub_08073C88: @ 0x08073C88
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08073C9C @ =gUnknown_086141DC
	movs r1, #0
	bl Proc_Start
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073C9C: .4byte gUnknown_086141DC

