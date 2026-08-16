	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808AE30
sub_0808AE30: @ 0x0808AE30
	push {r4, lr}
	adds r4, r0, #0
	subs r3, r2, #1
	cmp r2, #0
	beq _0808AE4C
	movs r2, #1
	rsbs r2, r2, #0
_0808AE3E:
	ldrb r0, [r4]
	strb r0, [r1]
	adds r4, #1
	adds r1, #1
	subs r3, #1
	cmp r3, r2
	bne _0808AE3E
_0808AE4C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

