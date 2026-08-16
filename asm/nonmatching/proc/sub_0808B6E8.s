	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808B6E8
sub_0808B6E8: @ 0x0808B6E8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r3, r5, #0
	subs r2, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _0808B708
	adds r4, r0, #0
_0808B6FA:
	ldrb r0, [r1]
	strb r0, [r3]
	adds r1, #1
	adds r3, #1
	subs r2, #1
	cmp r2, r4
	bne _0808B6FA
_0808B708:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1

