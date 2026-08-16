	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808AA74
sub_0808AA74: @ 0x0808AA74
	push {lr}
	ldr r0, _0808AA84 @ =gUnknown_08616FD4
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0808AA84: .4byte gUnknown_08616FD4

