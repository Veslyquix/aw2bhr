	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808B540
sub_0808B540: @ 0x0808B540
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x10
	ldr r3, _0808B5A4 @ =gUnknown_084856A4
	lsrs r0, r0, #0x10
	adds r4, r0, #0
	ldrb r1, [r3, #0x1c]
	lsls r4, r1
	movs r0, #0xe0
	lsls r0, r0, #0x14
	adds r4, r4, r0
	ldr r1, _0808B5A8 @ =0x04000208
	ldrh r0, [r1]
	adds r6, r0, #0
	movs r0, #0
	strh r0, [r1]
	ldr r2, _0808B5AC @ =0x0E005555
	movs r0, #0xaa
	strb r0, [r2]
	ldr r1, _0808B5B0 @ =0x0E002AAA
	movs r0, #0x55
	strb r0, [r1]
	movs r0, #0xa0
	strb r0, [r2]
	ldr r1, [r3, #0x18]
	cmp r1, #0
	beq _0808B584
_0808B576:
	ldrb r0, [r5]
	strb r0, [r4]
	adds r5, #1
	adds r4, #1
	subs r1, #1
	cmp r1, #0
	bne _0808B576
_0808B584:
	subs r4, #1
	subs r5, #1
	ldr r0, _0808B5A8 @ =0x04000208
	strh r6, [r0]
	ldr r0, _0808B5B4 @ =gUnknown_03005C70
	ldrb r2, [r5]
	ldr r3, [r0]
	movs r0, #1
	adds r1, r4, #0
	bl _call_via_r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0808B5A4: .4byte gUnknown_084856A4
_0808B5A8: .4byte 0x04000208
_0808B5AC: .4byte 0x0E005555
_0808B5B0: .4byte 0x0E002AAA
_0808B5B4: .4byte gUnknown_03005C70

