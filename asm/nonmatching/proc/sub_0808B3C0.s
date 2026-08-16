	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808B3C0
sub_0808B3C0: @ 0x0808B3C0
	push {r4, r5, r6, lr}
	sub sp, #0x40
	mov r0, sp
	bl sub_0808AD6C
	ldr r5, _0808B418 @ =0x04000204
	ldrh r0, [r5]
	ldr r6, _0808B41C @ =0x0000FFFC
	ands r0, r6
	ldr r1, _0808B420 @ =gUnknown_084856A4
	ldrh r1, [r1, #0x24]
	orrs r0, r1
	strh r0, [r5]
	ldr r1, _0808B424 @ =0x0E005555
	movs r4, #0xaa
	strb r4, [r1]
	ldr r3, _0808B428 @ =0x0E002AAA
	movs r2, #0x55
	strb r2, [r3]
	movs r0, #0x80
	strb r0, [r1]
	strb r4, [r1]
	strb r2, [r3]
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0808B42C @ =gUnknown_03005C70
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
_0808B418: .4byte 0x04000204
_0808B41C: .4byte 0x0000FFFC
_0808B420: .4byte gUnknown_084856A4
_0808B424: .4byte 0x0E005555
_0808B428: .4byte 0x0E002AAA
_0808B42C: .4byte gUnknown_03005C70

