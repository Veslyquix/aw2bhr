	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805A9AC
sub_0805A9AC: @ 0x0805A9AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r0, _0805A9EC @ =0x00007FFF
	str r0, [sp, #0x14]
	ldr r1, _0805A9F0 @ =gUnknown_0816D9AC
	add r0, sp, #4
	movs r2, #8
	bl sub_0808B6E8
	ldr r5, _0805A9F4 @ =gUnknown_0816D9B4
	ldr r0, [r5]
	ldr r0, [r0]
	ldr r1, _0805A9F8 @ =0x00002852
	adds r0, r0, r1
	bl sub_0801F92C
	ldr r4, _0805A9FC @ =gUnknown_0816D9B8
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_08058224
	ldr r1, _0805AA00 @ =gUnknown_0816D9BC
	ldr r0, [r1]
	ldrh r2, [r0]
	adds r0, r2, #0
	b _0805AC08
	.align 2, 0
_0805A9EC: .4byte 0x00007FFF
_0805A9F0: .4byte gUnknown_0816D9AC
_0805A9F4: .4byte gUnknown_0816D9B4
_0805A9F8: .4byte 0x00002852
_0805A9FC: .4byte gUnknown_0816D9B8
_0805AA00: .4byte gUnknown_0816D9BC
_0805AA04:
	ldr r0, _0805AAA8 @ =gUnknown_08499594
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	ldr r0, [r0]
	adds r5, r0, r1
	ldrb r0, [r5]
	adds r3, r2, #1
	str r3, [sp, #0x1c]
	cmp r0, #0
	bne _0805AA1C
	b _0805AC02
_0805AA1C:
	cmp r0, #2
	bls _0805AA22
	b _0805AC02
_0805AA22:
	ldr r0, _0805AAAC @ =gUnknown_03004730
	movs r1, #0x3f
	ands r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0805AA32
	b _0805AC02
_0805AA32:
	ldrb r0, [r5, #9]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1d
	ldr r4, [sp, #0xc]
	lsls r1, r4, #2
	adds r0, r0, r1
	add r0, sp
	adds r0, #4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805AA4A
	b _0805AC02
_0805AA4A:
	ldr r7, _0805AAB0 @ =gUnknown_08499590
	ldr r2, [r7]
	ldrb r1, [r5, #3]
	lsls r1, r1, #1
	ldr r3, _0805AAB4 @ =0x0000417A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrh r1, [r0]
	ldrb r0, [r5, #2]
	adds r1, r1, r0
	ldr r4, _0805AAB8 @ =0x00002D5A
	adds r2, r2, r4
	adds r2, r2, r1
	movs r1, #0
	ldrsb r1, [r2, r1]
	ldr r2, [sp, #0x14]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	ble _0805AA74
	b _0805AC02
_0805AA74:
	ldr r0, _0805AABC @ =gUnknown_030033EC
	ldrh r0, [r0]
	ldrb r1, [r5]
	bl sub_08042D1C
	adds r3, r0, #0
	ldr r4, _0805AAC0 @ =gUnknown_030013EC
	ldrb r0, [r5, #2]
	ldrb r1, [r5, #3]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [sp]
	ldr r4, [r4]
	movs r2, #1
	bl _call_via_r4
	ldr r3, _0805AAC4 @ =0x00007FFF
	str r3, [sp, #0x18]
	ldr r0, _0805AAC8 @ =0xFFFF0000
	ands r6, r0
	ldr r4, _0805AACC @ =0x0000270F
	orrs r6, r4
	movs r0, #0
	mov sl, r0
	ldr r0, [r7]
	b _0805ABC6
	.align 2, 0
_0805AAA8: .4byte gUnknown_08499594
_0805AAAC: .4byte gUnknown_03004730
_0805AAB0: .4byte gUnknown_08499590
_0805AAB4: .4byte 0x0000417A
_0805AAB8: .4byte 0x00002D5A
_0805AABC: .4byte gUnknown_030033EC
_0805AAC0: .4byte gUnknown_030013EC
_0805AAC4: .4byte 0x00007FFF
_0805AAC8: .4byte 0xFFFF0000
_0805AACC: .4byte 0x0000270F
_0805AAD0:
	movs r4, #0
	ldr r0, _0805AAE0 @ =gUnknown_08499590
	ldr r0, [r0]
	mov r1, sl
	adds r1, #1
	str r1, [sp, #0x20]
	b _0805ABB8
	.align 2, 0
_0805AAE0: .4byte gUnknown_08499590
_0805AAE4:
	ldr r1, _0805AC58 @ =gUnknown_03003340
	mov r3, sl
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _0805ABB2
	ldr r7, _0805AC5C @ =gUnknown_08499590
	ldr r3, [r7]
	mov r0, sl
	lsls r5, r0, #1
	ldr r1, _0805AC60 @ =0x0000417A
	mov sb, r1
	adds r0, r3, r1
	adds r0, r0, r5
	ldrh r0, [r0]
	adds r2, r0, r4
	ldr r7, _0805AC64 @ =0x00002D5A
	adds r0, r3, r7
	adds r0, r0, r2
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldr r7, [sp, #0x18]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bgt _0805ABB2
	adds r0, r3, #0
	adds r0, #0x12
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805ABB2
	ldr r0, _0805AC68 @ =gUnknown_030040D8
	ldr r0, [r0]
	ldrb r1, [r0]
	movs r0, #0x5c
	muls r0, r1, r0
	ldr r1, _0805AC6C @ =gUnknown_085D5AD0
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r7, _0805AC70 @ =0x00001432
	adds r0, r3, r7
	adds r3, r0, r2
	ldrb r2, [r3]
	movs r0, #0x1f
	mov r8, r0
	ands r0, r2
	adds r1, #0x1a
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0805ABB2
	ldr r0, _0805AC74 @ =gUnknown_03003F38
	ldrb r0, [r0]
	ldrb r1, [r3]
	bl sub_08026FD0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0805AB8A
	ldr r2, _0805AC5C @ =gUnknown_08499590
	ldr r1, [r2]
	mov r3, sb
	adds r0, r1, r3
	adds r0, r0, r5
	ldrh r0, [r0]
	adds r0, r0, r4
	adds r1, r1, r7
	adds r1, r1, r0
	ldrb r1, [r1]
	mov r0, r8
	ands r0, r1
	ldr r7, _0805AC78 @ =gUnknown_085767B8
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805ABB2
_0805AB8A:
	lsls r0, r4, #0x10
	mov r2, sl
	lsls r1, r2, #0x10
	lsrs r6, r0, #0x10
	orrs r6, r1
	ldr r3, _0805AC5C @ =gUnknown_08499590
	ldr r1, [r3]
	mov r7, sb
	adds r0, r1, r7
	adds r0, r0, r5
	ldrh r0, [r0]
	adds r0, r0, r4
	ldr r2, _0805AC64 @ =0x00002D5A
	adds r1, r1, r2
	adds r1, r1, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x18]
_0805ABB2:
	adds r4, #1
	ldr r0, _0805AC5C @ =gUnknown_08499590
	ldr r0, [r0]
_0805ABB8:
	ldrh r0, [r0]
	cmp r4, r0
	blt _0805AAE4
	ldr r3, [sp, #0x20]
	mov sl, r3
	ldr r0, _0805AC5C @ =gUnknown_08499590
	ldr r0, [r0]
_0805ABC6:
	ldrh r0, [r0, #2]
	cmp sl, r0
	bge _0805ABCE
	b _0805AAD0
_0805ABCE:
	lsls r0, r6, #0x10
	lsrs r3, r0, #0x10
	ldr r4, _0805AC7C @ =0x0000270F
	cmp r3, r4
	beq _0805AC02
	ldr r7, [sp, #0x10]
	strh r6, [r7]
	lsrs r0, r6, #0x10
	strh r0, [r7, #2]
	ldr r0, _0805AC5C @ =gUnknown_08499590
	ldr r2, [r0]
	lsrs r1, r6, #0x10
	lsls r1, r1, #1
	ldr r4, _0805AC60 @ =0x0000417A
	adds r0, r2, r4
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, r0, r3
	ldr r7, _0805AC64 @ =0x00002D5A
	adds r2, r2, r7
	adds r2, r2, r0
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x14]
_0805AC02:
	ldr r2, [sp, #0x1c]
	ldr r0, _0805AC80 @ =gUnknown_03003F2C
	ldrh r0, [r0]
_0805AC08:
	adds r0, #0x40
	cmp r2, r0
	bge _0805AC10
	b _0805AA04
_0805AC10:
	ldr r0, [sp, #0x10]
	ldrh r1, [r0]
	ldr r0, _0805AC7C @ =0x0000270F
	cmp r1, r0
	beq _0805AC46
	ldr r3, _0805AC84 @ =gUnknown_03004730
	ldr r0, _0805AC5C @ =gUnknown_08499590
	ldr r2, [r0]
	ldr r4, [sp, #0x10]
	ldrh r1, [r4, #2]
	lsls r1, r1, #1
	ldr r7, _0805AC60 @ =0x0000417A
	adds r0, r2, r7
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrh r1, [r4]
	adds r0, r0, r1
	adds r2, #0x12
	adds r2, r2, r0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	adds r0, r0, r3
	ldrb r1, [r0]
	adds r1, #1
	ldrb r2, [r0]
	strb r1, [r0]
_0805AC46:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805AC58: .4byte gUnknown_03003340
_0805AC5C: .4byte gUnknown_08499590
_0805AC60: .4byte 0x0000417A
_0805AC64: .4byte 0x00002D5A
_0805AC68: .4byte gUnknown_030040D8
_0805AC6C: .4byte gUnknown_085D5AD0
_0805AC70: .4byte 0x00001432
_0805AC74: .4byte gUnknown_03003F38
_0805AC78: .4byte gUnknown_085767B8
_0805AC7C: .4byte 0x0000270F
_0805AC80: .4byte gUnknown_03003F2C
_0805AC84: .4byte gUnknown_03004730

