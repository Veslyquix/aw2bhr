	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808A64C
sub_0808A64C: @ 0x0808A64C
	push {lr}
	ldr r0, _0808A660 @ =gUnknown_08616DFC
	bl Proc_Find
	cmp r0, #0
	beq _0808A65A
	movs r0, #1
_0808A65A:
	pop {r1}
	bx r1
	.align 2, 0
_0808A660: .4byte gUnknown_08616DFC

