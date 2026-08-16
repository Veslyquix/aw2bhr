	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08004E38
sub_08004E38: @ 0x08004E38
	push {lr}
	bl sub_0808B678
	pop {r0}
	bx r0
	.align 2, 0

