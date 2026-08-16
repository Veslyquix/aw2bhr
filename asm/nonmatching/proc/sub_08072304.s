	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072304
sub_08072304: @ 0x08072304
	push {lr}
	ldr r0, _08072310 @ =gUnknown_08613EE4
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08072310: .4byte gUnknown_08613EE4

