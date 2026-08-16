	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807B7A4
sub_0807B7A4: @ 0x0807B7A4
	push {lr}
	ldr r0, _0807B7B8 @ =gUnknown_08615FB4
	bl Proc_Find
	cmp r0, #0
	beq _0807B7B2
	movs r0, #1
_0807B7B2:
	pop {r1}
	bx r1
	.align 2, 0
_0807B7B8: .4byte gUnknown_08615FB4

