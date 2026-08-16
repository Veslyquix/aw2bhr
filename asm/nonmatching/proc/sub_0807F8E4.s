	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807F8E4
sub_0807F8E4: @ 0x0807F8E4
	push {lr}
	ldr r0, _0807F8F8 @ =gUnknown_08616740
	bl Proc_Find
	cmp r0, #0
	beq _0807F8F2
	movs r0, #1
_0807F8F2:
	pop {r1}
	bx r1
	.align 2, 0
_0807F8F8: .4byte gUnknown_08616740

