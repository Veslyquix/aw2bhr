	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808B304
sub_0808B304: @ 0x0808B304
	push {lr}
	bl _call_via_r1
	cmp r0, #0
	bne _0808B312
	movs r0, #0
	b _0808B314
_0808B312:
	ldr r0, _0808B318 @ =0x00008004
_0808B314:
	pop {r1}
	bx r1
	.align 2, 0
_0808B318: .4byte 0x00008004

