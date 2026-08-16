	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045448
sub_08045448: @ 0x08045448
	push {lr}
	adds r1, r0, #0
	ldr r0, _0804545C @ =gUnknown_084A09CC
	bl Proc_StartBlocking
	movs r1, #1
	str r1, [r0, #0x54]
	pop {r0}
	bx r0
	.align 2, 0
_0804545C: .4byte gUnknown_084A09CC

