	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808B1BC
sub_0808B1BC: @ 0x0808B1BC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x60
	mov sb, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	cmp r0, #0xf
	bls _0808B1DC
	ldr r0, _0808B1D8 @ =0x000080FF
	b _0808B2CA
	.align 2, 0
_0808B1D8: .4byte 0x000080FF
_0808B1DC:
	ldr r0, _0808B1FC @ =gUnknown_03005C78
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	mov r7, r8
	lsls r7, r0
	movs r0, #0xe0
	lsls r0, r0, #0x14
	adds r7, r7, r0
	ldr r1, _0808B200 @ =sub_0808B2E0
	movs r0, #1
	adds r3, r1, #0
	eors r3, r0
	mov r2, sp
	ldr r0, _0808B204 @ =sub_0808B304
	subs r0, r0, r1
	b _0808B212
	.align 2, 0
_0808B1FC: .4byte gUnknown_03005C78
_0808B200: .4byte sub_0808B2E0
_0808B204: .4byte sub_0808B304
_0808B208:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r0, r1, #2
_0808B212:
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _0808B208
	movs r4, #0
	b _0808B228
_0808B21E:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x51
	beq _0808B2C8
_0808B228:
	mov r0, r8
	bl sub_0808B0E8
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _0808B21E
	adds r0, r7, #0
	mov r1, sp
	adds r1, #1
	bl sub_0808B304
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _0808B21E
	movs r6, #1
	cmp r4, #0
	beq _0808B250
	movs r6, #6
_0808B250:
	movs r4, #1
	cmp r4, r6
	bhi _0808B266
_0808B256:
	mov r0, r8
	bl sub_0808B0E8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r6
	bls _0808B256
_0808B266:
	mov r0, sp
	bl sub_0808AD6C
	ldr r3, _0808B288 @ =0x04000204
	ldrh r1, [r3]
	ldr r0, _0808B28C @ =0x0000FFFC
	ands r1, r0
	ldr r0, _0808B290 @ =gUnknown_03005C78
	ldr r2, [r0]
	ldrh r0, [r2, #0x10]
	orrs r1, r0
	strh r1, [r3]
	ldr r1, _0808B294 @ =gUnknown_03005C7C
	ldr r0, [r2, #4]
	strh r0, [r1]
	adds r4, r1, #0
	b _0808B2A4
	.align 2, 0
_0808B288: .4byte 0x04000204
_0808B28C: .4byte 0x0000FFFC
_0808B290: .4byte gUnknown_03005C78
_0808B294: .4byte gUnknown_03005C7C
_0808B298:
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	movs r0, #1
	add sb, r0
	adds r7, #1
_0808B2A4:
	ldrh r0, [r4]
	cmp r0, #0
	beq _0808B2BA
	mov r0, sb
	adds r1, r7, #0
	bl sub_0808B184
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0808B298
_0808B2BA:
	ldr r2, _0808B2D8 @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _0808B2DC @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
_0808B2C8:
	adds r0, r5, #0
_0808B2CA:
	add sp, #0x60
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0808B2D8: .4byte 0x04000204
_0808B2DC: .4byte 0x0000FFFC

