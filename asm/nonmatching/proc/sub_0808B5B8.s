	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808B5B8
sub_0808B5B8: @ 0x0808B5B8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x40
	adds r7, r1, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0xf
	bls _0808B5D4
	ldr r0, _0808B5D0 @ =0x000080FF
	b _0808B662
	.align 2, 0
_0808B5D0: .4byte 0x000080FF
_0808B5D4:
	mov r0, sp
	bl sub_0808AD6C
	ldr r2, _0808B5FC @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _0808B600 @ =0x0000FFFC
	ands r0, r1
	ldr r1, _0808B604 @ =gUnknown_084856A4
	ldrh r1, [r1, #0x24]
	orrs r0, r1
	strh r0, [r2]
	lsls r0, r4, #0x15
	lsrs r5, r0, #0x10
	ldr r1, _0808B608 @ =gUnknown_03005C7C
	ldr r0, _0808B60C @ =gUnknown_08485678
	ldr r0, [r0, #0x18]
	strh r0, [r1]
	adds r0, r1, #0
	mov r8, r0
	b _0808B624
	.align 2, 0
_0808B5FC: .4byte 0x04000204
_0808B600: .4byte 0x0000FFFC
_0808B604: .4byte gUnknown_084856A4
_0808B608: .4byte gUnknown_03005C7C
_0808B60C: .4byte gUnknown_08485678
_0808B610:
	ldr r0, _0808B630 @ =gUnknown_084856A4
	ldr r1, [r0, #0x18]
	mov r2, r8
	ldrh r0, [r2]
	subs r0, r0, r1
	strh r0, [r2]
	adds r7, r7, r1
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_0808B624:
	mov r1, r8
	ldrh r0, [r1]
	cmp r0, #0
	beq _0808B652
	movs r4, #2
	b _0808B63E
	.align 2, 0
_0808B630: .4byte gUnknown_084856A4
_0808B634:
	subs r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _0808B64E
_0808B63E:
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_0808B540
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0
	bne _0808B634
_0808B64E:
	cmp r6, #0
	beq _0808B610
_0808B652:
	ldr r2, _0808B670 @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _0808B674 @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	adds r0, r6, #0
_0808B662:
	add sp, #0x40
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0808B670: .4byte 0x04000204
_0808B674: .4byte 0x0000FFFC

