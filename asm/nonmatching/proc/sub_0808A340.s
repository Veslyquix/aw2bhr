	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808A340
sub_0808A340: @ 0x0808A340
	push {lr}
	ldr r2, _0808A360 @ =gUnknown_03001FE8
	ldrb r1, [r2, #1]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r1, _0808A364 @ =gUnknown_03005908
	movs r0, #0
	str r0, [r1]
	bl sub_0808A5C4
	pop {r0}
	bx r0
	.align 2, 0
_0808A360: .4byte gUnknown_03001FE8
_0808A364: .4byte gUnknown_03005908

