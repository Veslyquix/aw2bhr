	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808A638
sub_0808A638: @ 0x0808A638
	push {lr}
	ldr r0, _0808A648 @ =gUnknown_08616DFC
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0808A648: .4byte gUnknown_08616DFC

