	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807639C
sub_0807639C: @ 0x0807639C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080763AC @ =gUnknown_08614460
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080763AC: .4byte gUnknown_08614460

