	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808B430
sub_0808B430: @ 0x0808B430
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	ldr r3, _0808B4A0 @ =gUnknown_084856A4
	lsrs r0, r0, #0x10
	adds r4, r0, #0
	ldrb r1, [r3, #0x1c]
	lsls r4, r1
	movs r0, #0xe0
	lsls r0, r0, #0x14
	adds r4, r4, r0
	ldr r1, _0808B4A4 @ =0x04000208
	ldrh r0, [r1]
	adds r5, r0, #0
	movs r0, #0
	strh r0, [r1]
	ldr r2, _0808B4A8 @ =0x0E005555
	movs r0, #0xaa
	strb r0, [r2]
	ldr r1, _0808B4AC @ =0x0E002AAA
	movs r0, #0x55
	strb r0, [r1]
	movs r0, #0xa0
	strb r0, [r2]
	ldr r0, [r3, #0x18]
	cmp r0, #0
	beq _0808B470
	movs r1, #0xff
_0808B466:
	strb r1, [r4]
	adds r4, #1
	subs r0, #1
	cmp r0, #0
	bne _0808B466
_0808B470:
	subs r4, #1
	ldr r0, _0808B4A4 @ =0x04000208
	strh r5, [r0]
	ldr r0, _0808B4B0 @ =gUnknown_03005C70
	ldr r3, [r0]
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0xff
	bl _call_via_r3
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _0808B496
	movs r0, #0xff
	lsls r0, r0, #8
	ands r1, r0
	movs r0, #2
	orrs r1, r0
_0808B496:
	adds r0, r1, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808B4A0: .4byte gUnknown_084856A4
_0808B4A4: .4byte 0x04000208
_0808B4A8: .4byte 0x0E005555
_0808B4AC: .4byte 0x0E002AAA
_0808B4B0: .4byte gUnknown_03005C70

