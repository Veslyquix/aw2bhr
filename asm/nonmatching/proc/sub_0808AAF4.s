	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808AAF4
sub_0808AAF4: @ 0x0808AAF4
	push {r4, r5, lr}
	sub sp, #0x44
	mov r0, sp
	bl sub_0808AD6C
	mov r5, sp
	adds r5, #1
	ldr r2, _0808AB1C @ =0x0E005555
	movs r0, #0xaa
	strb r0, [r2]
	ldr r1, _0808AB20 @ =0x0E002AAA
	movs r0, #0x55
	strb r0, [r1]
	movs r0, #0x90
	strb r0, [r2]
	add r1, sp, #0x40
	ldr r2, _0808AB24 @ =0x00004E20
	adds r0, r2, #0
	b _0808AB2C
	.align 2, 0
_0808AB1C: .4byte 0x0E005555
_0808AB20: .4byte 0x0E002AAA
_0808AB24: .4byte 0x00004E20
_0808AB28:
	ldrh r0, [r1]
	subs r0, #1
_0808AB2C:
	strh r0, [r1]
	ldrh r0, [r1]
	cmp r0, #0
	bne _0808AB28
	ldr r0, _0808AB64 @ =0x0E000001
	bl _call_via_r5
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x10
	movs r0, #0xe0
	lsls r0, r0, #0x14
	bl _call_via_r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	orrs r4, r0
	ldr r2, _0808AB68 @ =0x0E005555
	movs r0, #0xaa
	strb r0, [r2]
	ldr r1, _0808AB6C @ =0x0E002AAA
	movs r0, #0x55
	strb r0, [r1]
	movs r0, #0xf0
	strb r0, [r2]
	add r1, sp, #0x40
	ldr r2, _0808AB70 @ =0x00004E20
	adds r0, r2, #0
	b _0808AB78
	.align 2, 0
_0808AB64: .4byte 0x0E000001
_0808AB68: .4byte 0x0E005555
_0808AB6C: .4byte 0x0E002AAA
_0808AB70: .4byte 0x00004E20
_0808AB74:
	ldrh r0, [r1]
	subs r0, #1
_0808AB78:
	strh r0, [r1]
	ldrh r0, [r1]
	cmp r0, #0
	bne _0808AB74
	adds r0, r4, #0
	add sp, #0x44
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

