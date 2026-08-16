	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808B694
sub_0808B694: @ 0x0808B694
	adds r3, r0, #0
_0808B696:
	ldrb r0, [r3]
	adds r3, #1
	ldrb r2, [r1]
	adds r1, #1
	cmp r0, r2
	beq _0808B6A6
	subs r0, r0, r2
	b _0808B6AC
_0808B6A6:
	cmp r0, #0
	bne _0808B696
	movs r0, #0
_0808B6AC:
	bx lr
	.align 2, 0

