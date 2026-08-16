	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803433C
sub_0803433C: @ 0x0803433C
	push {lr}
	adds r1, r0, #0
	ldr r0, _0803434C @ =gUnknown_0849BC98
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0803434C: .4byte gUnknown_0849BC98

