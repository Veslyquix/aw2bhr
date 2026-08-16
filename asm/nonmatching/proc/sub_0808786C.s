	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808786C
sub_0808786C: @ 0x0808786C
	push {lr}
	ldr r0, _08087880 @ =gUnknown_08616C54
	bl Proc_Find
	cmp r0, #0
	beq _0808787A
	movs r0, #1
_0808787A:
	pop {r1}
	bx r1
	.align 2, 0
_08087880: .4byte gUnknown_08616C54

