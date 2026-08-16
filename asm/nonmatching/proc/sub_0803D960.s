	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803D960
sub_0803D960: @ 0x0803D960
	push {lr}
	adds r1, r0, #0
	ldr r0, _0803D974 @ =gUnknown_0849F5D0
	bl Proc_StartBlocking
	adds r0, #0x64
	movs r1, #6
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0803D974: .4byte gUnknown_0849F5D0

