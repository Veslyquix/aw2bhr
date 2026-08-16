	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807F618
sub_0807F618: @ 0x0807F618
	push {lr}
	ldr r0, _0807F62C @ =gUnknown_08616710
	bl Proc_Find
	cmp r0, #0
	beq _0807F626
	movs r0, #1
_0807F626:
	pop {r1}
	bx r1
	.align 2, 0
_0807F62C: .4byte gUnknown_08616710

