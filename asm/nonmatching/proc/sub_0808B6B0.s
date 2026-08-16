	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808B6B0
sub_0808B6B0: @ 0x0808B6B0
	adds r1, r0, #0
	movs r2, #0
	b _0808B6B8
_0808B6B6:
	adds r2, #1
_0808B6B8:
	ldrb r0, [r1]
	adds r1, #1
	cmp r0, #0
	bne _0808B6B6
	adds r0, r2, #0
	bx lr

