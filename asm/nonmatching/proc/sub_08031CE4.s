	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08031CE4
sub_08031CE4: @ 0x08031CE4
	push {lr}
	ldr r0, _08031CF0 @ =gUnknown_0849B294
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08031CF0: .4byte gUnknown_0849B294

