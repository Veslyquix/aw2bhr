	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807A984
sub_0807A984: @ 0x0807A984
	push {lr}
	ldr r0, _0807A998 @ =gUnknown_08615CB0
	bl Proc_Find
	cmp r0, #0
	beq _0807A992
	movs r0, #1
_0807A992:
	pop {r1}
	bx r1
	.align 2, 0
_0807A998: .4byte gUnknown_08615CB0

