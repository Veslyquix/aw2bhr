	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806AAC4
sub_0806AAC4: @ 0x0806AAC4
	push {lr}
	ldr r0, _0806AAD8 @ =gUnknown_0858168C
	bl Proc_Find
	cmp r0, #0
	beq _0806AAD2
	movs r0, #1
_0806AAD2:
	pop {r1}
	bx r1
	.align 2, 0
_0806AAD8: .4byte gUnknown_0858168C

