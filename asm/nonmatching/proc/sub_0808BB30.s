	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808BB30
sub_0808BB30: @ 0x0808BB30
	push {r4, lr}
	ldr r1, _0808BB54 @ =gUnknown_086170E4
	ldr r0, [r1]
	ldr r0, [r0]
	cmp r0, #0
	beq _0808BB52
	adds r4, r1, #0
_0808BB3E:
	ldr r1, [r4]
	adds r0, r1, #4
	str r0, [r4]
	ldr r0, [r1]
	bl _call_via_r0
	ldr r0, [r4]
	ldr r0, [r0]
	cmp r0, #0
	bne _0808BB3E
_0808BB52:
	pop {r4, pc}
	.align 2, 0
_0808BB54: .4byte gUnknown_086170E4

