	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08067DD4
sub_08067DD4: @ 0x08067DD4
	push {lr}
	adds r1, r0, #0
	ldr r0, _08067DE4 @ =gUnknown_085810E4
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08067DE4: .4byte gUnknown_085810E4

