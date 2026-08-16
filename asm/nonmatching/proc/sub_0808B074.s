	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808B074
sub_0808B074: @ 0x0808B074
	push {r4, r5, r6, lr}
	sub sp, #0x40
	ldr r5, _0808B0D0 @ =0x04000204
	ldrh r1, [r5]
	ldr r6, _0808B0D4 @ =0x0000FFFC
	ands r1, r6
	ldr r0, _0808B0D8 @ =gUnknown_03005C78
	ldr r0, [r0]
	ldrh r0, [r0, #0x10]
	orrs r1, r0
	strh r1, [r5]
	ldr r1, _0808B0DC @ =0x0E005555
	movs r4, #0xaa
	strb r4, [r1]
	ldr r3, _0808B0E0 @ =0x0E002AAA
	movs r2, #0x55
	strb r2, [r3]
	movs r0, #0x80
	strb r0, [r1]
	strb r4, [r1]
	strb r2, [r3]
	movs r0, #0x10
	strb r0, [r1]
	mov r0, sp
	bl sub_0808AD6C
	ldr r0, _0808B0E4 @ =gUnknown_03005C70
	movs r1, #0xe0
	lsls r1, r1, #0x14
	ldr r3, [r0]
	movs r0, #3
	movs r2, #0xff
	bl _call_via_r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r5]
	ands r1, r6
	movs r2, #3
	orrs r1, r2
	strh r1, [r5]
	add sp, #0x40
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0808B0D0: .4byte 0x04000204
_0808B0D4: .4byte 0x0000FFFC
_0808B0D8: .4byte gUnknown_03005C78
_0808B0DC: .4byte 0x0E005555
_0808B0E0: .4byte 0x0E002AAA
_0808B0E4: .4byte gUnknown_03005C70

