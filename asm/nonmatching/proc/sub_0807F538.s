	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807F538
sub_0807F538: @ 0x0807F538
	push {lr}
	ldr r0, _0807F54C @ =gUnknown_086165C0
	bl Proc_Find
	cmp r0, #0
	beq _0807F546
	movs r0, #1
_0807F546:
	pop {r1}
	bx r1
	.align 2, 0
_0807F54C: .4byte gUnknown_086165C0

