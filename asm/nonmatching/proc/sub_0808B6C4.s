	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808B6C4
sub_0808B6C4: @ 0x0808B6C4
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r4, #0
	subs r2, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _0808B6DE
_0808B6D4:
	strb r1, [r3]
	adds r3, #1
	subs r2, #1
	cmp r2, r0
	bne _0808B6D4
_0808B6DE:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

