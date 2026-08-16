	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806C888
sub_0806C888: @ 0x0806C888
	push {lr}
	ldr r0, _0806C89C @ =gUnknown_08581AC8
	bl Proc_Find
	cmp r0, #0
	beq _0806C896
	movs r0, #1
_0806C896:
	pop {r1}
	bx r1
	.align 2, 0
_0806C89C: .4byte gUnknown_08581AC8

