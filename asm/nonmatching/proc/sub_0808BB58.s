	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808BB58
sub_0808BB58: @ 0x0808BB58
	push {r4, r5, lr}
	ldr r2, _0808BB9C @ =gUnknown_086170EC
	ldr r1, [r2]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0808BB7A
	movs r1, #0
	ldr r0, [r2, #4]
	cmp r0, #0
	beq _0808BB7A
	adds r2, #4
_0808BB70:
	adds r2, #4
	adds r1, #1
	ldr r0, [r2]
	cmp r0, #0
	bne _0808BB70
_0808BB7A:
	adds r5, r1, #0
	cmp r5, #0
	beq _0808BB94
	ldr r1, _0808BB9C @ =gUnknown_086170EC
	lsls r0, r5, #2
	adds r4, r0, r1
_0808BB86:
	ldr r0, [r4]
	bl _call_via_r0
	subs r4, #4
	subs r5, #1
	cmp r5, #0
	bne _0808BB86
_0808BB94:
	ldr r0, _0808BBA0 @ =sub_0808BB30
	bl sub_0808D680
	pop {r4, r5, pc}
	.align 2, 0
_0808BB9C: .4byte gUnknown_086170EC
_0808BBA0: .4byte sub_0808BB30

