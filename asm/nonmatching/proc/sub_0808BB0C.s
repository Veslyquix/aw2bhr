	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808BB0C
sub_0808BB0C: @ 0x0808BB0C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0808BB20 @ =0x00000000
	bl __ltsf2
	cmp r0, #0
	blt _0808BB24
	adds r0, r4, #0
	b _0808BB2A
	.align 2, 0
_0808BB20: .4byte 0x00000000
_0808BB24:
	adds r0, r4, #0
	bl __negsf2
_0808BB2A:
	pop {r4}
	pop {r1}
	bx r1

