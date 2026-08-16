	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808B2E0
sub_0808B2E0: @ 0x0808B2E0
	adds r2, r0, #0
	ldr r0, _0808B2EC @ =gUnknown_03005C78
	ldr r0, [r0]
	ldr r1, [r0, #4]
	b _0808B2F2
	.align 2, 0
_0808B2EC: .4byte gUnknown_03005C78
_0808B2F0:
	subs r1, #1
_0808B2F2:
	cmp r1, #0
	beq _0808B2FE
	ldrb r0, [r2]
	adds r2, #1
	cmp r0, #0xff
	beq _0808B2F0
_0808B2FE:
	adds r0, r1, #0
	bx lr
	.align 2, 0

