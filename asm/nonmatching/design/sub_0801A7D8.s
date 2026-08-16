	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801A7D8
sub_0801A7D8: @ 0x0801A7D8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xd0
	adds r7, r2, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0801A81C @ =gUnknown_0200CC30
	ldrb r0, [r0]
	ldr r1, _0801A820 @ =gUnknown_0200CC34
	ldr r1, [r1]
	bl sub_0801B598
	str r4, [sp, #0xa4]
	movs r0, #0
	mov sl, r0
	movs r1, #0
	str r1, [sp, #0xa8]
	movs r3, #0
	mov r2, sp
	adds r2, #0x90
	str r2, [sp, #0xb8]
	ldr r2, _0801A824 @ =gUnknown_0200CC38
_0801A80A:
	ldrb r0, [r2]
	cmp r0, r4
	beq _0801A814
	cmp r0, #0
	bne _0801A828
_0801A814:
	movs r0, #0xff
	strb r0, [r2, #0x10]
	b _0801A83E
	.align 2, 0
_0801A81C: .4byte gUnknown_0200CC30
_0801A820: .4byte gUnknown_0200CC34
_0801A824: .4byte gUnknown_0200CC38
_0801A828:
	cmp r0, #0xff
	bne _0801A83E
	add r0, sp, #0x80
	ldr r1, [sp, #0xa8]
	adds r0, r0, r1
	strb r3, [r0]
	adds r0, r1, #0
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xa8]
_0801A83E:
	ldr r0, [sp, #0xb8]
	adds r1, r0, r3
	movs r0, #0
	strb r0, [r1]
	adds r2, #1
	adds r3, #1
	cmp r3, #0xf
	ble _0801A80A
	movs r3, #0
	ldr r1, [sp, #0xa8]
	subs r1, #1
	str r1, [sp, #0xbc]
	cmp r3, r1
	bge _0801A89A
_0801A85A:
	adds r6, r3, #1
	mov sb, r6
	ldr r2, [sp, #0xa8]
	cmp r6, r2
	bge _0801A892
	add r4, sp, #0x80
	mov ip, r4
	adds r5, r4, r3
	ldr r0, _0801A92C @ =gUnknown_0200CCC8
	mov r8, r0
_0801A86E:
	ldrb r2, [r5]
	lsls r1, r2, #2
	add r1, r8
	mov r0, ip
	adds r4, r0, r6
	ldrb r3, [r4]
	lsls r0, r3, #2
	add r0, r8
	ldr r1, [r1]
	ldr r0, [r0]
	cmp r1, r0
	bhs _0801A88A
	strb r2, [r4]
	strb r3, [r5]
_0801A88A:
	adds r6, #1
	ldr r1, [sp, #0xa8]
	cmp r6, r1
	blt _0801A86E
_0801A892:
	mov r3, sb
	ldr r2, [sp, #0xbc]
	cmp r3, r2
	blt _0801A85A
_0801A89A:
	movs r6, #0
	movs r4, #0
	str r4, [sp, #0xa0]
	cmp r7, #0
	beq _0801A8D0
	mov r0, sp
_0801A8A6:
	ldr r2, _0801A930 @ =0x00000FAD
	ldr r1, [sp, #0xa0]
	cmp r1, #0
	bne _0801A8B6
	ldr r4, [sp, #0xa4]
	cmp r4, #0
	bne _0801A8B6
	subs r2, #0x10
_0801A8B6:
	cmp r2, r7
	ble _0801A8BC
	adds r2, r7, #0
_0801A8BC:
	subs r7, r7, r2
	str r2, [r0]
	str r6, [r0, #0x40]
	adds r6, r6, r2
	adds r0, #4
	ldr r1, [sp, #0xa0]
	adds r1, #1
	str r1, [sp, #0xa0]
	cmp r7, #0
	bne _0801A8A6
_0801A8D0:
	movs r2, #0
	str r2, [sp, #0xac]
	ldr r6, [sp, #0xa0]
	subs r6, #1
	cmp r6, #0
	bge _0801A8DE
	b _0801ABA0
_0801A8DE:
	ldr r4, _0801A934 @ =gUnknown_0200CC38
	str r4, [sp, #0xb0]
	lsls r0, r6, #2
	mov r1, sp
	adds r1, r0, r1
	str r1, [sp, #0xc8]
	str r0, [sp, #0xcc]
	ldr r2, _0801A938 @ =gUnknown_0200CC88
	str r2, [sp, #0xb4]
	ldr r4, _0801A93C @ =gUnknown_02002050
	subs r4, #0x50
	mov sb, r4
_0801A8F6:
	ldr r0, [sp, #0xac]
	cmp r0, #0
	beq _0801A910
	cmp r0, #4
	bne _0801A958
	ldr r0, _0801A940 @ =gUnknown_0200CC58
	add r0, sl
	ldrb r2, [r0]
	movs r1, #2
	orrs r1, r2
	strb r1, [r0]
	movs r1, #0
	str r1, [sp, #0xac]
_0801A910:
	ldr r2, [sp, #0xa8]
	cmp r2, #0
	bne _0801A944
	ldr r1, _0801A934 @ =gUnknown_0200CC38
	movs r3, #0xf
_0801A91A:
	ldrb r0, [r1]
	strb r0, [r1, #0x10]
	adds r1, #1
	subs r3, #1
	cmp r3, #0
	bge _0801A91A
	movs r0, #1
	b _0801ABE6
	.align 2, 0
_0801A92C: .4byte gUnknown_0200CCC8
_0801A930: .4byte 0x00000FAD
_0801A934: .4byte gUnknown_0200CC38
_0801A938: .4byte gUnknown_0200CC88
_0801A93C: .4byte gUnknown_02002050
_0801A940: .4byte gUnknown_0200CC58
_0801A944:
	ldr r0, [sp, #0xa8]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xa8]
	add r0, sp, #0x80
	ldr r4, [sp, #0xa8]
	adds r0, r0, r4
	ldrb r0, [r0]
	mov sl, r0
_0801A958:
	ldr r0, [sp, #0xac]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xac]
	mov r1, sl
	lsls r0, r1, #2
	ldr r2, _0801A9C4 @ =gUnknown_0200CCC8
	adds r3, r0, r2
	ldr r2, [r3]
	movs r1, #1
	rsbs r1, r1, #0
	str r0, [sp, #0xc0]
	cmp r2, r1
	beq _0801A97A
	adds r0, r2, #1
	str r0, [r3]
_0801A97A:
	ldr r0, _0801A9C8 @ =gUnknown_0200CC48
	add r0, sl
	add r4, sp, #0xa4
	ldrb r4, [r4]
	strb r4, [r0]
	movs r2, #0
	ldr r4, _0801A9CC @ =0x00000FFF
	add r0, sp, #0x40
	mov r8, r0
	ldr r1, _0801A9D0 @ =gUnknown_0808EF54
	mov ip, r1
	lsls r7, r6, #4
	mov r0, sl
	lsls r0, r0, #0x10
	str r0, [sp, #0xc4]
	ldr r5, _0801A9D4 @ =gUnknown_02002000
	movs r3, #0xff
_0801A99C:
	adds r1, r2, r5
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r2, #1
	cmp r2, r4
	ble _0801A99C
	ldr r1, _0801A9D4 @ =gUnknown_02002000
	ldr r0, _0801A9D8 @ =0x73726132
	str r0, [r1]
	ldr r0, _0801A9DC @ =gUnknown_0200CC78
	add r0, sl
	ldrb r0, [r0]
	cmp r0, #0x55
	bne _0801A9E0
	strb r0, [r1, #4]
	ldr r2, _0801A9CC @ =0x00000FFF
	adds r1, r1, r2
	movs r0, #0xaa
	b _0801A9EA
	.align 2, 0
_0801A9C4: .4byte gUnknown_0200CCC8
_0801A9C8: .4byte gUnknown_0200CC48
_0801A9CC: .4byte 0x00000FFF
_0801A9D0: .4byte gUnknown_0808EF54
_0801A9D4: .4byte gUnknown_02002000
_0801A9D8: .4byte 0x73726132
_0801A9DC: .4byte gUnknown_0200CC78
_0801A9E0:
	movs r0, #0xaa
	strb r0, [r1, #4]
	ldr r4, _0801AA9C @ =0x00000FFF
	adds r1, r1, r4
	movs r0, #0x55
_0801A9EA:
	strb r0, [r1]
	movs r1, #0
	movs r0, #0xf
	mov r2, sb
	strb r0, [r2, #5]
	strb r1, [r2, #6]
	movs r0, #0xff
	strb r0, [r2, #7]
	mov r4, ip
	ldr r0, [r4]
	ldr r0, [r0]
	str r0, [r2, #8]
	ldr r1, [sp, #0xa0]
	adds r0, r7, r1
	subs r0, #1
	strb r0, [r2, #0xc]
	add r4, sp, #0xa4
	ldrb r4, [r4]
	strb r4, [r2, #0xd]
	ldr r0, [sp, #0xcc]
	add r0, r8
	ldr r0, [r0]
	strh r0, [r2, #0xe]
	ldr r2, [sp, #0xb4]
	adds r2, #0x40
	mov r1, sb
	adds r1, #0x10
	movs r3, #0xf
_0801AA22:
	ldm r2!, {r0}
	stm r1!, {r0}
	subs r3, #1
	cmp r3, #0
	bge _0801AA22
	ldr r1, [sp, #0xc8]
	ldr r0, [r1]
	ldr r2, _0801AAA0 @ =gUnknown_02002050
	strh r0, [r2]
	movs r3, #0
	cmp r3, r0
	bge _0801AA5A
	ldr r7, _0801AAA4 @ =gUnknown_02002052
	ldr r4, _0801AAA8 @ =gUnknown_0200CC2C
	ldr r5, [sp, #0xcc]
	add r5, r8
_0801AA42:
	adds r2, r3, r7
	ldr r0, [r4]
	ldr r1, [r5]
	adds r0, r0, r1
	adds r0, r0, r3
	ldrb r0, [r0]
	strb r0, [r2]
	adds r3, #1
	ldr r1, [sp, #0xc8]
	ldr r0, [r1]
	cmp r3, r0
	blt _0801AA42
_0801AA5A:
	cmp r6, #0
	bne _0801AAD8
	ldr r2, [sp, #0xa4]
	cmp r2, #0
	bne _0801AAD8
	ldr r1, _0801AAAC @ =gUnknown_0200CC38
	movs r3, #0xf
_0801AA68:
	ldrb r0, [r1, #0x10]
	strb r0, [r1]
	adds r1, #1
	subs r3, #1
	cmp r3, #0
	bge _0801AA68
	mov r4, ip
	ldr r0, [r4]
	ldr r0, [r0]
	cmp r0, #0
	bne _0801AAC4
	movs r3, #0
	ldr r5, _0801AAAC @ =gUnknown_0200CC38
	ldr r1, _0801AAB0 @ =0x00000FEF
	add r1, sb
	movs r2, #0xff
_0801AA88:
	ldr r4, [sp, #0xb8]
	adds r0, r4, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AAB4
	cmp r3, sl
	beq _0801AAB4
	ldrb r0, [r1]
	orrs r0, r2
	b _0801AAB8
	.align 2, 0
_0801AA9C: .4byte 0x00000FFF
_0801AAA0: .4byte gUnknown_02002050
_0801AAA4: .4byte gUnknown_02002052
_0801AAA8: .4byte gUnknown_0200CC2C
_0801AAAC: .4byte gUnknown_0200CC38
_0801AAB0: .4byte 0x00000FEF
_0801AAB4:
	adds r0, r3, r5
	ldrb r0, [r0]
_0801AAB8:
	strb r0, [r1]
	adds r1, #1
	adds r3, #1
	cmp r3, #0xf
	ble _0801AA88
	b _0801AAD8
_0801AAC4:
	movs r3, #0
	ldr r5, _0801AB60 @ =gUnknown_02002FEF
	ldr r2, _0801AB64 @ =gUnknown_0200CC38
_0801AACA:
	adds r0, r3, r5
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r3, #1
	cmp r3, #0xf
	ble _0801AACA
_0801AAD8:
	movs r1, #0
	movs r3, #0
	ldr r5, _0801AB68 @ =0x00000FFF
	ldr r2, _0801AB6C @ =gUnknown_02002000
_0801AAE0:
	adds r0, r3, r2
	ldrb r0, [r0]
	adds r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r3, #1
	cmp r3, r5
	ble _0801AAE0
	ldr r5, _0801AB6C @ =gUnknown_02002000
	movs r7, #0
	strb r1, [r5, #6]
	mvns r0, r1
	strb r0, [r5, #7]
	ldr r0, [sp, #0xc4]
	lsrs r4, r0, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0801B618
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0801B648
	cmp r0, #0
	bne _0801AB7C
	ldr r2, _0801AB70 @ =gUnknown_0200CC58
	add r2, sl
	ldrb r0, [r2]
	movs r1, #8
	orrs r0, r1
	orrs r0, r7
	movs r1, #0xfb
	ands r0, r1
	strb r0, [r2]
	ldr r0, [sp, #0xb0]
	adds r0, #0x30
	add r0, sl
	ldrb r1, [r5, #0xc]
	strb r1, [r0]
	ldr r1, _0801AB74 @ =gUnknown_0200CC78
	add r1, sl
	ldr r2, _0801AB68 @ =0x00000FFF
	adds r0, r5, r2
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r4, [sp, #0xc0]
	ldr r0, _0801AB78 @ =gUnknown_0200CCC8
	adds r1, r4, r0
	ldr r0, [r5, #8]
	str r0, [r1]
	movs r1, #0
	str r1, [sp, #0xac]
	ldr r1, [sp, #0xb8]
	add r1, sl
	movs r0, #1
	strb r0, [r1]
	ldr r2, [sp, #0xc8]
	subs r2, #4
	str r2, [sp, #0xc8]
	ldr r4, [sp, #0xcc]
	subs r4, #4
	str r4, [sp, #0xcc]
	subs r6, #1
	b _0801AB9A
	.align 2, 0
_0801AB60: .4byte gUnknown_02002FEF
_0801AB64: .4byte gUnknown_0200CC38
_0801AB68: .4byte 0x00000FFF
_0801AB6C: .4byte gUnknown_02002000
_0801AB70: .4byte gUnknown_0200CC58
_0801AB74: .4byte gUnknown_0200CC78
_0801AB78: .4byte gUnknown_0200CCC8
_0801AB7C:
	ldr r1, _0801ABCC @ =gUnknown_0200CC48
	add r1, sl
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, _0801ABD0 @ =gUnknown_0200CC78
	add r1, sl
	ldr r2, _0801ABD4 @ =0x00000FFF
	adds r0, r5, r2
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, [sp, #0xac]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xac]
_0801AB9A:
	cmp r6, #0
	blt _0801ABA0
	b _0801A8F6
_0801ABA0:
	ldr r2, _0801ABD8 @ =gUnknown_0200CD08
	ldr r1, [r2]
	movs r0, #2
	rsbs r0, r0, #0
	cmp r1, r0
	bhi _0801ABB0
	adds r0, r1, #1
	str r0, [r2]
_0801ABB0:
	ldr r4, [sp, #0xa4]
	cmp r4, #0
	beq _0801ABE4
	movs r0, #0
	str r0, [sp, #0xa4]
	ldr r1, _0801ABDC @ =gUnknown_0200CC24
	ldr r0, _0801ABE0 @ =gUnknown_0200CC2C
	ldr r0, [r0]
	ldr r1, [r1]
	bl _call_via_r1
	adds r7, r0, #0
	b _0801A89A
	.align 2, 0
_0801ABCC: .4byte gUnknown_0200CC48
_0801ABD0: .4byte gUnknown_0200CC78
_0801ABD4: .4byte 0x00000FFF
_0801ABD8: .4byte gUnknown_0200CD08
_0801ABDC: .4byte gUnknown_0200CC24
_0801ABE0: .4byte gUnknown_0200CC2C
_0801ABE4:
	movs r0, #0
_0801ABE6:
	add sp, #0xd0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

