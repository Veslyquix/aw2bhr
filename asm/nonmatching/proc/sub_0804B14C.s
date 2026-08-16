	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804B14C
sub_0804B14C: @ 0x0804B14C
	push {lr}
	ldr r0, _0804B15C @ =gUnknown_030044E0
	ldr r0, [r0]
	bl sub_08014ED4
	pop {r0}
	bx r0
	.align 2, 0
_0804B15C: .4byte gUnknown_030044E0

