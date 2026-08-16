	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08075304
sub_08075304: @ 0x08075304
	push {lr}
	ldr r0, _08075310 @ =gUnknown_08614390
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08075310: .4byte gUnknown_08614390

