	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034A44
sub_08034A44: @ 0x08034A44
	push {lr}
	bl sub_0808B6B0
	adds r1, r0, #0
	lsls r1, r1, #3
	movs r0, #0xf0
	subs r0, r0, r1
	lsrs r0, r0, #1
	pop {r1}
	bx r1

