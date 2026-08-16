	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808B184
sub_0808B184: @ 0x0808B184
	push {r4, lr}
	ldr r4, _0808B1B0 @ =0x0E005555
	movs r2, #0xaa
	strb r2, [r4]
	ldr r3, _0808B1B4 @ =0x0E002AAA
	movs r2, #0x55
	strb r2, [r3]
	movs r2, #0xa0
	strb r2, [r4]
	ldrb r2, [r0]
	strb r2, [r1]
	ldr r3, _0808B1B8 @ =gUnknown_03005C70
	ldrb r2, [r0]
	ldr r3, [r3]
	movs r0, #1
	bl _call_via_r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808B1B0: .4byte 0x0E005555
_0808B1B4: .4byte 0x0E002AAA
_0808B1B8: .4byte gUnknown_03005C70

