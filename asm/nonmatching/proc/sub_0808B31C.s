	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808B31C
sub_0808B31C: @ 0x0808B31C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x40
	adds r7, r1, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0xf
	bls _0808B334
	ldr r0, _0808B330 @ =0x000080FF
	b _0808B3B0
	.align 2, 0
_0808B330: .4byte 0x000080FF
_0808B334:
	adds r0, r4, #0
	bl sub_0808B0E8
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _0808B3AE
	mov r0, sp
	bl sub_0808AD6C
	ldr r3, _0808B370 @ =0x04000204
	ldrh r1, [r3]
	ldr r0, _0808B374 @ =0x0000FFFC
	ands r1, r0
	ldr r0, _0808B378 @ =gUnknown_03005C78
	ldr r2, [r0]
	ldrh r0, [r2, #0x10]
	orrs r1, r0
	strh r1, [r3]
	ldr r1, _0808B37C @ =gUnknown_03005C7C
	ldr r0, [r2, #4]
	strh r0, [r1]
	ldrb r0, [r2, #8]
	lsls r4, r0
	movs r0, #0xe0
	lsls r0, r0, #0x14
	adds r4, r4, r0
	adds r6, r1, #0
	b _0808B38A
	.align 2, 0
_0808B370: .4byte 0x04000204
_0808B374: .4byte 0x0000FFFC
_0808B378: .4byte gUnknown_03005C78
_0808B37C: .4byte gUnknown_03005C7C
_0808B380:
	ldrh r0, [r6]
	subs r0, #1
	strh r0, [r6]
	adds r7, #1
	adds r4, #1
_0808B38A:
	ldrh r0, [r6]
	cmp r0, #0
	beq _0808B3A0
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_0808B184
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0808B380
_0808B3A0:
	ldr r2, _0808B3B8 @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _0808B3BC @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
_0808B3AE:
	adds r0, r5, #0
_0808B3B0:
	add sp, #0x40
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0808B3B8: .4byte 0x04000204
_0808B3BC: .4byte 0x0000FFFC

