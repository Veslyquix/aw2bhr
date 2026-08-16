	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807F564
sub_0807F564: @ 0x0807F564
	push {lr}
	ldr r0, _0807F578 @ =gUnknown_086166C8
	bl Proc_Find
	cmp r0, #0
	beq _0807F572
	movs r0, #1
_0807F572:
	pop {r1}
	bx r1
	.align 2, 0
_0807F578: .4byte gUnknown_086166C8

