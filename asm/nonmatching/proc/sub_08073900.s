	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08073900
sub_08073900: @ 0x08073900
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08073914 @ =gUnknown_086141B4
	movs r1, #0
	bl Proc_Start
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073914: .4byte gUnknown_086141B4

