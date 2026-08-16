	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808B02C
sub_0808B02C: @ 0x0808B02C
	push {r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r7, r2, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r6, #0
	b _0808B040
_0808B03A:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_0808B040:
	cmp r6, #2
	bhi _0808B068
	ldr r0, _0808B070 @ =gUnknown_03005C74
	ldr r2, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	bl _call_via_r2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	bne _0808B03A
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl sub_0808AF74
	adds r3, r0, #0
	cmp r3, #0
	bne _0808B03A
_0808B068:
	adds r0, r3, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0808B070: .4byte gUnknown_03005C74

