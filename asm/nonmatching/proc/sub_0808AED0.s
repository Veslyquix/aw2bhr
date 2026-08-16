	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808AED0
sub_0808AED0: @ 0x0808AED0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r3, r1, #0
	subs r4, r2, #1
	cmp r2, #0
	beq _0808AEF6
	movs r2, #1
	rsbs r2, r2, #0
_0808AEE0:
	ldrb r1, [r3]
	ldrb r0, [r5]
	adds r5, #1
	adds r3, #1
	cmp r1, r0
	beq _0808AEF0
	subs r0, r3, #1
	b _0808AEF8
_0808AEF0:
	subs r4, #1
	cmp r4, r2
	bne _0808AEE0
_0808AEF6:
	movs r0, #0
_0808AEF8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

