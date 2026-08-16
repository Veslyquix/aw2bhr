	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08033548
sub_08033548: @ 0x08033548
	push {lr}
	ldr r0, _08033558 @ =gUnknown_03004008
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0802F8FC
	pop {r0}
	bx r0
	.align 2, 0
_08033558: .4byte gUnknown_03004008

