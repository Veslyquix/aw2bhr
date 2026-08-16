	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808B4B4
sub_0808B4B4: @ 0x0808B4B4
	push {r4, r5, r6, lr}
	sub sp, #0x40
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0xf
	bls _0808B4C8
	ldr r0, _0808B4C4 @ =0x000080FF
	b _0808B530
	.align 2, 0
_0808B4C4: .4byte 0x000080FF
_0808B4C8:
	mov r0, sp
	bl sub_0808AD6C
	ldr r2, _0808B4E8 @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _0808B4EC @ =0x0000FFFC
	ands r0, r1
	ldr r1, _0808B4F0 @ =gUnknown_084856A4
	ldrh r1, [r1, #0x24]
	orrs r0, r1
	strh r0, [r2]
	lsls r0, r4, #0x15
	lsrs r5, r0, #0x10
	movs r6, #0
_0808B4E4:
	movs r4, #2
	b _0808B4FE
	.align 2, 0
_0808B4E8: .4byte 0x04000204
_0808B4EC: .4byte 0x0000FFFC
_0808B4F0: .4byte gUnknown_084856A4
_0808B4F4:
	subs r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _0808B50C
_0808B4FE:
	adds r0, r5, #0
	bl sub_0808B430
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	bne _0808B4F4
_0808B50C:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r3, #0
	bne _0808B520
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0x1f
	bls _0808B4E4
_0808B520:
	ldr r2, _0808B538 @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _0808B53C @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	adds r0, r3, #0
_0808B530:
	add sp, #0x40
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0808B538: .4byte 0x04000204
_0808B53C: .4byte 0x0000FFFC

