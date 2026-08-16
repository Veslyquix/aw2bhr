	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08074F1C
sub_08074F1C: @ 0x08074F1C
	push {lr}
	ldr r0, _08074F28 @ =gUnknown_08614344
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08074F28: .4byte gUnknown_08614344

