	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808B678
sub_0808B678: @ 0x0808B678
	adds r3, r0, #0
	adds r2, r3, #0
	b _0808B684
_0808B67E:
	strb r0, [r2]
	adds r1, #1
	adds r2, #1
_0808B684:
	ldrb r0, [r1]
	cmp r0, #0
	bne _0808B67E
	movs r0, #0
	strb r0, [r2]
	adds r0, r3, #0
	bx lr
	.align 2, 0

