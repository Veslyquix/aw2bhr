	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808ADA4
sub_0808ADA4: @ 0x0808ADA4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	movs r0, #0
	mov r8, r0
	adds r0, r4, #0
	bl sub_0808AC7C
	ldr r7, _0808ADCC @ =gUnknown_03000F6C
	movs r0, #0xc0
	lsls r0, r0, #8
	orrs r4, r0
	lsls r4, r4, #0x10
	b _0808ADF4
	.align 2, 0
_0808ADCC: .4byte gUnknown_03000F6C
_0808ADD0:
	ldr r0, _0808ADE8 @ =gUnknown_03005C78
	ldr r0, [r0]
	ldrh r1, [r0, #0x14]
	ldr r0, _0808ADEC @ =0x00001CC2
	cmp r1, r0
	bne _0808ADE2
	ldr r1, _0808ADF0 @ =0x0E005555
	movs r0, #0xf0
	strb r0, [r1]
_0808ADE2:
	lsrs r4, r4, #0x10
	mov r8, r4
	b _0808AE1C
	.align 2, 0
_0808ADE8: .4byte gUnknown_03005C78
_0808ADEC: .4byte 0x00001CC2
_0808ADF0: .4byte 0x0E005555
_0808ADF4:
	ldr r1, [r7]
	adds r0, r5, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r6
	beq _0808AE1C
	ldr r0, _0808AE2C @ =gUnknown_03000F74
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808ADF4
	ldr r1, [r7]
	adds r0, r5, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r6
	bne _0808ADD0
_0808AE1C:
	bl sub_0808AD24
	mov r0, r8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0808AE2C: .4byte gUnknown_03000F74

