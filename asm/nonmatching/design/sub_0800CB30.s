	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800CB30
sub_0800CB30: @ 0x0800CB30
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sl, r0
	adds r0, r1, #0
	mov r1, sl
	cmp r1, #0
	bne _0800CBF4
	movs r0, #0x28
	bl sub_0800C958
	mvns r0, r0
	asrs r7, r0, #0x1f
	movs r0, #8
	ands r7, r0
	movs r0, #0x48
	bl sub_0800C958
	cmp r0, #0
	blt _0800CB62
	movs r0, #4
	orrs r7, r0
_0800CB62:
	movs r0, #0x68
	bl sub_0800C958
	cmp r0, #0
	blt _0800CB70
	movs r0, #2
	orrs r7, r0
_0800CB70:
	movs r0, #0x88
	bl sub_0800C958
	cmp r0, #0
	blt _0800CB7E
	movs r0, #1
	orrs r7, r0
_0800CB7E:
	ldr r3, _0800CBDC @ =gUnknown_03003FC0
	ldr r2, _0800CBE0 @ =gUnknown_08488948
	ldr r0, _0800CBE4 @ =gUnknown_084888A0
	adds r0, #0x10
	adds r0, r7, r0
	ldrb r0, [r0]
	lsrs r0, r0, #1
	subs r0, #1
	adds r0, r0, r2
	ldrb r1, [r0]
	adds r0, r3, #0
	adds r0, #0x34
	strb r1, [r0]
	ldr r0, _0800CBE8 @ =gUnknown_084888C0
	adds r0, #0x10
	adds r0, r7, r0
	ldrb r0, [r0]
	lsrs r0, r0, #1
	subs r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r1, r3, #0
	adds r1, #0x35
	strb r0, [r1]
	ldr r0, _0800CBEC @ =gUnknown_084888E0
	adds r0, #0x10
	adds r0, r7, r0
	ldrb r0, [r0]
	lsrs r0, r0, #1
	subs r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r1, #1
	strb r0, [r1]
	ldr r0, _0800CBF0 @ =gUnknown_08488900
	adds r0, #0x10
	adds r0, r7, r0
	ldrb r0, [r0]
	lsrs r0, r0, #1
	subs r0, #1
	adds r0, r0, r2
	ldrb r1, [r0]
	adds r0, r3, #0
	adds r0, #0x37
	strb r1, [r0]
	b _0800CC1C
	.align 2, 0
_0800CBDC: .4byte gUnknown_03003FC0
_0800CBE0: .4byte gUnknown_08488948
_0800CBE4: .4byte gUnknown_084888A0
_0800CBE8: .4byte gUnknown_084888C0
_0800CBEC: .4byte gUnknown_084888E0
_0800CBF0: .4byte gUnknown_08488900
_0800CBF4:
	adds r7, r0, #0
	ldr r2, _0800CC40 @ =gUnknown_08499598
	ldr r0, [r2]
	adds r0, #0x56
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x92
	movs r1, #2
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0xce
	movs r1, #3
	strb r1, [r0]
	ldr r0, [r2]
	movs r2, #0x85
	lsls r2, r2, #1
	adds r1, r0, r2
	movs r0, #4
	strb r0, [r1]
_0800CC1C:
	movs r3, #0
	str r3, [sp]
	ldr r1, _0800CC44 @ =gUnknown_0808D888
	ldr r0, [r1]
	ldr r0, [r0]
	mov sb, r1
	ldrh r0, [r0, #2]
	cmp r3, r0
	blt _0800CC30
	b _0800CEDC
_0800CC30:
	movs r0, #0
	mov ip, r0
	ldr r0, [r1]
	ldr r0, [r0]
	ldr r2, [sp]
	adds r2, #1
	str r2, [sp, #4]
	b _0800CEC0
	.align 2, 0
_0800CC40: .4byte gUnknown_08499598
_0800CC44: .4byte gUnknown_0808D888
_0800CC48:
	ldr r0, [r1]
	ldr r1, [r0]
	ldr r3, [sp]
	lsls r2, r3, #1
	ldr r3, _0800CC78 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	add r0, ip
	ldr r3, _0800CC7C @ =0x00001432
	adds r1, r1, r3
	adds r6, r1, r0
	ldrb r5, [r6]
	movs r0, #0xe0
	ands r0, r5
	mov r8, r2
	cmp r0, #0x40
	beq _0800CD08
	cmp r0, #0x40
	bgt _0800CC80
	cmp r0, #0x20
	beq _0800CC8E
	b _0800CEB6
	.align 2, 0
_0800CC78: .4byte 0x0000417A
_0800CC7C: .4byte 0x00001432
_0800CC80:
	cmp r0, #0x60
	bne _0800CC86
	b _0800CD80
_0800CC86:
	cmp r0, #0x80
	bne _0800CC8C
	b _0800CDFE
_0800CC8C:
	b _0800CEB6
_0800CC8E:
	movs r3, #0x1f
	ands r5, r3
	ldr r4, _0800CCBC @ =gUnknown_0808D878
	ldr r1, [r4]
	mov r0, sl
	lsls r2, r0, #4
	adds r0, r7, r2
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #4
	orrs r5, r0
	strb r5, [r6]
	ands r5, r3
	subs r0, r5, #6
	adds r3, r2, #0
	cmp r0, #8
	bls _0800CCB2
	b _0800CDF8
_0800CCB2:
	lsls r0, r0, #2
	ldr r1, _0800CCC0 @ =_0800CCC4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800CCBC: .4byte gUnknown_0808D878
_0800CCC0: .4byte _0800CCC4
_0800CCC4: @ jump table
	.4byte _0800CCF0 @ case 0
	.4byte _0800CDF8 @ case 1
	.4byte _0800CCE8 @ case 2
	.4byte _0800CDF8 @ case 3
	.4byte _0800CD00 @ case 4
	.4byte _0800CE78 @ case 5
	.4byte _0800CDF8 @ case 6
	.4byte _0800CDF8 @ case 7
	.4byte _0800CCF8 @ case 8
_0800CCE8:
	ldr r2, _0800CCEC @ =gUnknown_08488920
	b _0800CE7A
	.align 2, 0
_0800CCEC: .4byte gUnknown_08488920
_0800CCF0:
	ldr r2, _0800CCF4 @ =gUnknown_08488928
	b _0800CE7A
	.align 2, 0
_0800CCF4: .4byte gUnknown_08488928
_0800CCF8:
	ldr r2, _0800CCFC @ =gUnknown_08488930
	b _0800CE7A
	.align 2, 0
_0800CCFC: .4byte gUnknown_08488930
_0800CD00:
	ldr r2, _0800CD04 @ =gUnknown_08488938
	b _0800CE7A
	.align 2, 0
_0800CD04: .4byte gUnknown_08488938
_0800CD08:
	movs r3, #0x1f
	ands r5, r3
	ldr r4, _0800CD34 @ =gUnknown_0808D87C
	ldr r1, [r4]
	mov r0, sl
	lsls r2, r0, #4
	adds r0, r7, r2
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #4
	orrs r5, r0
	strb r5, [r6]
	ands r5, r3
	subs r0, r5, #6
	adds r3, r2, #0
	cmp r0, #8
	bhi _0800CDF8
	lsls r0, r0, #2
	ldr r1, _0800CD38 @ =_0800CD3C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800CD34: .4byte gUnknown_0808D87C
_0800CD38: .4byte _0800CD3C
_0800CD3C: @ jump table
	.4byte _0800CD68 @ case 0
	.4byte _0800CDF8 @ case 1
	.4byte _0800CD60 @ case 2
	.4byte _0800CDF8 @ case 3
	.4byte _0800CD78 @ case 4
	.4byte _0800CE78 @ case 5
	.4byte _0800CDF8 @ case 6
	.4byte _0800CDF8 @ case 7
	.4byte _0800CD70 @ case 8
_0800CD60:
	ldr r2, _0800CD64 @ =gUnknown_08488920
	b _0800CE7A
	.align 2, 0
_0800CD64: .4byte gUnknown_08488920
_0800CD68:
	ldr r2, _0800CD6C @ =gUnknown_08488928
	b _0800CE7A
	.align 2, 0
_0800CD6C: .4byte gUnknown_08488928
_0800CD70:
	ldr r2, _0800CD74 @ =gUnknown_08488930
	b _0800CE7A
	.align 2, 0
_0800CD74: .4byte gUnknown_08488930
_0800CD78:
	ldr r2, _0800CD7C @ =gUnknown_08488938
	b _0800CE7A
	.align 2, 0
_0800CD7C: .4byte gUnknown_08488938
_0800CD80:
	movs r3, #0x1f
	ands r5, r3
	ldr r4, _0800CDAC @ =gUnknown_0808D880
	ldr r1, [r4]
	mov r0, sl
	lsls r2, r0, #4
	adds r0, r7, r2
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #4
	orrs r5, r0
	strb r5, [r6]
	ands r5, r3
	subs r0, r5, #6
	adds r3, r2, #0
	cmp r0, #8
	bhi _0800CDF8
	lsls r0, r0, #2
	ldr r1, _0800CDB0 @ =_0800CDB4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800CDAC: .4byte gUnknown_0808D880
_0800CDB0: .4byte _0800CDB4
_0800CDB4: @ jump table
	.4byte _0800CDE0 @ case 0
	.4byte _0800CDF8 @ case 1
	.4byte _0800CDD8 @ case 2
	.4byte _0800CDF8 @ case 3
	.4byte _0800CDF0 @ case 4
	.4byte _0800CE78 @ case 5
	.4byte _0800CDF8 @ case 6
	.4byte _0800CDF8 @ case 7
	.4byte _0800CDE8 @ case 8
_0800CDD8:
	ldr r2, _0800CDDC @ =gUnknown_08488920
	b _0800CE7A
	.align 2, 0
_0800CDDC: .4byte gUnknown_08488920
_0800CDE0:
	ldr r2, _0800CDE4 @ =gUnknown_08488928
	b _0800CE7A
	.align 2, 0
_0800CDE4: .4byte gUnknown_08488928
_0800CDE8:
	ldr r2, _0800CDEC @ =gUnknown_08488930
	b _0800CE7A
	.align 2, 0
_0800CDEC: .4byte gUnknown_08488930
_0800CDF0:
	ldr r2, _0800CDF4 @ =gUnknown_08488938
	b _0800CE7A
	.align 2, 0
_0800CDF4: .4byte gUnknown_08488938
_0800CDF8:
	movs r2, #1
	rsbs r2, r2, #0
	b _0800CEB6
_0800CDFE:
	movs r3, #0x1f
	ands r5, r3
	ldr r4, _0800CE2C @ =gUnknown_0808D884
	ldr r1, [r4]
	mov r0, sl
	lsls r2, r0, #4
	adds r0, r7, r2
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #4
	orrs r5, r0
	strb r5, [r6]
	ands r5, r3
	subs r0, r5, #6
	adds r3, r2, #0
	cmp r0, #8
	bhi _0800CE94
	lsls r0, r0, #2
	ldr r1, _0800CE30 @ =_0800CE34
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800CE2C: .4byte gUnknown_0808D884
_0800CE30: .4byte _0800CE34
_0800CE34: @ jump table
	.4byte _0800CE60 @ case 0
	.4byte _0800CE94 @ case 1
	.4byte _0800CE58 @ case 2
	.4byte _0800CE94 @ case 3
	.4byte _0800CE70 @ case 4
	.4byte _0800CE78 @ case 5
	.4byte _0800CE94 @ case 6
	.4byte _0800CE94 @ case 7
	.4byte _0800CE68 @ case 8
_0800CE58:
	ldr r2, _0800CE5C @ =gUnknown_08488920
	b _0800CE7A
	.align 2, 0
_0800CE5C: .4byte gUnknown_08488920
_0800CE60:
	ldr r2, _0800CE64 @ =gUnknown_08488928
	b _0800CE7A
	.align 2, 0
_0800CE64: .4byte gUnknown_08488928
_0800CE68:
	ldr r2, _0800CE6C @ =gUnknown_08488930
	b _0800CE7A
	.align 2, 0
_0800CE6C: .4byte gUnknown_08488930
_0800CE70:
	ldr r2, _0800CE74 @ =gUnknown_08488938
	b _0800CE7A
	.align 2, 0
_0800CE74: .4byte gUnknown_08488938
_0800CE78:
	ldr r2, _0800CE90 @ =gUnknown_08488940
_0800CE7A:
	ldr r1, [r4]
	adds r0, r7, r3
	adds r0, r0, r1
	ldrb r0, [r0]
	subs r0, #2
	asrs r0, r0, #1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r2, [r0]
	b _0800CE98
	.align 2, 0
_0800CE90: .4byte gUnknown_08488940
_0800CE94:
	movs r2, #1
	rsbs r2, r2, #0
_0800CE98:
	cmp r2, #0
	blt _0800CEB6
	mov r1, sb
	ldr r0, [r1]
	ldr r1, [r0]
	ldr r3, _0800CEF0 @ =0x0000417A
	adds r0, r1, r3
	add r0, r8
	ldrh r0, [r0]
	add r0, ip
	lsls r0, r0, #1
	ldr r3, _0800CEF4 @ =0x00000A22
	adds r1, r1, r3
	adds r1, r1, r0
	strh r2, [r1]
_0800CEB6:
	movs r0, #1
	add ip, r0
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0]
_0800CEC0:
	ldrh r0, [r0]
	cmp ip, r0
	bge _0800CEC8
	b _0800CC48
_0800CEC8:
	ldr r1, [sp, #4]
	str r1, [sp]
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0]
	ldr r2, [sp]
	ldrh r0, [r0, #2]
	cmp r2, r0
	bge _0800CEDC
	b _0800CC30
_0800CEDC:
	adds r0, r7, #0
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800CEF0: .4byte 0x0000417A
_0800CEF4: .4byte 0x00000A22

