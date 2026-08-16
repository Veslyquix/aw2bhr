	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808AA88
sub_0808AA88: @ 0x0808AA88
	push {lr}
	ldr r0, _0808AA9C @ =gUnknown_08616FD4
	bl Proc_Find
	cmp r0, #0
	beq _0808AA96
	movs r0, #1
_0808AA96:
	pop {r1}
	bx r1
	.align 2, 0
_0808AA9C: .4byte gUnknown_08616FD4

