	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808B0E8
sub_0808B0E8: @ 0x0808B0E8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x40
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0xf
	bhi _0808B170
	ldr r6, _0808B158 @ =0x04000204
	ldrh r1, [r6]
	ldr r0, _0808B15C @ =0x0000FFFC
	mov r8, r0
	ands r1, r0
	ldr r0, _0808B160 @ =gUnknown_03005C78
	ldr r2, [r0]
	ldrh r0, [r2, #0x10]
	orrs r1, r0
	strh r1, [r6]
	ldrb r4, [r2, #8]
	lsls r3, r4
	adds r4, r3, #0
	movs r2, #0xe0
	lsls r2, r2, #0x14
	adds r4, r4, r2
	ldr r1, _0808B164 @ =0x0E005555
	movs r5, #0xaa
	strb r5, [r1]
	ldr r3, _0808B168 @ =0x0E002AAA
	movs r2, #0x55
	strb r2, [r3]
	movs r0, #0x80
	strb r0, [r1]
	strb r5, [r1]
	strb r2, [r3]
	movs r0, #0x30
	strb r0, [r4]
	mov r0, sp
	bl sub_0808AD6C
	ldr r0, _0808B16C @ =gUnknown_03005C70
	ldr r3, [r0]
	movs r0, #2
	adds r1, r4, #0
	movs r2, #0xff
	bl _call_via_r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r6]
	mov r2, r8
	ands r1, r2
	movs r2, #3
	orrs r1, r2
	strh r1, [r6]
	b _0808B172
	.align 2, 0
_0808B158: .4byte 0x04000204
_0808B15C: .4byte 0x0000FFFC
_0808B160: .4byte gUnknown_03005C78
_0808B164: .4byte 0x0E005555
_0808B168: .4byte 0x0E002AAA
_0808B16C: .4byte gUnknown_03005C70
_0808B170:
	ldr r0, _0808B180 @ =0x000080FF
_0808B172:
	add sp, #0x40
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0808B180: .4byte 0x000080FF

