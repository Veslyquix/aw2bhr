	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808A664
sub_0808A664: @ 0x0808A664
	push {lr}
	ldr r0, _0808A694 @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0808A68E
	ldr r1, _0808A698 @ =gUnknown_0300200C
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldrh r0, [r1]
	movs r1, #2
	bl DivRem
	cmp r0, #0
	beq _0808A68E
	ldr r1, _0808A69C @ =gUnknown_03002000
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_0808A68E:
	pop {r0}
	bx r0
	.align 2, 0
_0808A694: .4byte gUnknown_03004008
_0808A698: .4byte gUnknown_0300200C
_0808A69C: .4byte gUnknown_03002000

