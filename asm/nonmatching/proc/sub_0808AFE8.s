	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808AFE8
sub_0808AFE8: @ 0x0808AFE8
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r6, #0
	b _0808AFFA
_0808AFF4:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_0808AFFA:
	cmp r6, #2
	bhi _0808B020
	ldr r0, _0808B028 @ =gUnknown_03005C74
	ldr r2, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	bl _call_via_r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	bne _0808AFF4
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0808AF00
	adds r2, r0, #0
	cmp r2, #0
	bne _0808AFF4
_0808B020:
	adds r0, r2, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0808B028: .4byte gUnknown_03005C74

