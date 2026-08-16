	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808A82C
sub_0808A82C: @ 0x0808A82C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08014824
	cmp r0, #0
	bne _0808A83E
	adds r0, r4, #0
	bl Proc_Break
_0808A83E:
	pop {r4}
	pop {r0}
	bx r0

