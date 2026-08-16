	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801ADC8
sub_0801ADC8: @ 0x0801ADC8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _0801AE30 @ =gUnknown_0200CC30
	ldrb r0, [r0]
	ldr r1, _0801AE34 @ =gUnknown_0200CC34
	ldr r1, [r1]
	bl sub_0801B598
	ldr r1, _0801AE38 @ =gUnknown_0200CD08
	movs r0, #0
	str r0, [r1]
	ldr r0, _0801AE3C @ =gUnknown_0200CC28
	ldr r0, [r0]
	bl _call_via_r0
	ldr r1, _0801AE40 @ =gUnknown_0200CC24
	ldr r4, _0801AE44 @ =gUnknown_0808EF5C
	ldr r0, [r4]
	ldr r0, [r0]
	ldr r1, [r1]
	bl _call_via_r1
	adds r7, r0, #0
	movs r5, #0
	ldr r3, _0801AE48 @ =gUnknown_0200CC58
	movs r6, #0xf7
_0801AE04:
	adds r2, r5, r3
	ldrb r1, [r2]
	adds r0, r6, #0
	ands r0, r1
	strb r0, [r2]
	adds r5, #1
	cmp r5, #0xf
	ble _0801AE04
	movs r0, #0xff
	bl sub_0801B120
	lsls r0, r0, #0x10
	ldr r1, _0801AE4C @ =0xFFFF0000
	cmp r0, r1
	bne _0801AE50
	ldr r0, [r4]
	ldr r1, [r0]
	movs r0, #0
	adds r2, r7, #0
	bl sub_0801A7D8
	b _0801AE7C
	.align 2, 0
_0801AE30: .4byte gUnknown_0200CC30
_0801AE34: .4byte gUnknown_0200CC34
_0801AE38: .4byte gUnknown_0200CD08
_0801AE3C: .4byte gUnknown_0200CC28
_0801AE40: .4byte gUnknown_0200CC24
_0801AE44: .4byte gUnknown_0808EF5C
_0801AE48: .4byte gUnknown_0200CC58
_0801AE4C: .4byte 0xFFFF0000
_0801AE50:
	ldr r0, _0801AEFC @ =gUnknown_0200CC38
	adds r2, r0, #0
	adds r2, #0x20
	movs r6, #0x10
	movs r4, #8
	movs r3, #0
	movs r5, #0xf
_0801AE5E:
	ldrb r1, [r2]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0801AE74
	adds r0, r1, #0
	orrs r0, r4
	orrs r0, r3
	movs r1, #0xef
	ands r0, r1
	strb r0, [r2]
_0801AE74:
	adds r2, #1
	subs r5, #1
	cmp r5, #0
	bge _0801AE5E
_0801AE7C:
	movs r0, #0
	bl sub_0801B120
	movs r5, #0
_0801AE84:
	ldr r2, _0801AEFC @ =gUnknown_0200CC38
	adds r2, #0x20
	adds r3, r5, r2
	ldrb r1, [r3]
	movs r0, #0x18
	ands r0, r1
	cmp r0, #0
	bne _0801AF0E
	ldr r1, _0801AEFC @ =gUnknown_0200CC38
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AF0E
	movs r6, #0
	lsls r1, r5, #0x10
	subs r2, #0x20
	adds r0, r2, #0
	adds r0, #0x40
	adds r0, r0, r5
	mov r8, r0
	adds r7, r3, #0
	lsrs r4, r1, #0x10
	ldr r0, _0801AF00 @ =gUnknown_02002FFF
	mov sl, r0
	adds r1, r5, r2
	mov sb, r1
_0801AEB8:
	adds r0, r4, #0
	str r2, [sp]
	bl sub_0801B5E8
	adds r0, r4, #0
	bl sub_0801B018
	ldr r2, [sp]
	cmp r0, #0
	beq _0801AF08
	mov r1, sl
	ldrb r0, [r1]
	mov r1, r8
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x10
	adds r0, r5, r0
	movs r1, #0xff
	strb r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	mov r1, sb
	strb r0, [r1]
	ldrb r0, [r7]
	movs r1, #4
	orrs r0, r1
	strb r0, [r7]
	ldr r1, _0801AF04 @ =gUnknown_0200CC88
	lsls r0, r5, #2
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
	b _0801AF0E
	.align 2, 0
_0801AEFC: .4byte gUnknown_0200CC38
_0801AF00: .4byte gUnknown_02002FFF
_0801AF04: .4byte gUnknown_0200CC88
_0801AF08:
	adds r6, #1
	cmp r6, #3
	ble _0801AEB8
_0801AF0E:
	adds r5, #1
	cmp r5, #0xf
	ble _0801AE84
	movs r5, #0
_0801AF16:
	ldr r2, _0801AF94 @ =gUnknown_0200CC38
	adds r2, #0x20
	adds r3, r5, r2
	ldrb r1, [r3]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0801AFA6
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0801AFA6
	ldr r1, _0801AF94 @ =gUnknown_0200CC38
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AFA6
	movs r6, #0
	lsls r1, r5, #0x10
	subs r2, #0x20
	adds r0, r2, #0
	adds r0, #0x40
	adds r0, r0, r5
	mov r8, r0
	adds r7, r3, #0
	lsrs r4, r1, #0x10
	ldr r0, _0801AF98 @ =gUnknown_02002FFF
	mov sl, r0
	adds r1, r5, r2
	mov sb, r1
_0801AF52:
	adds r0, r4, #0
	str r2, [sp]
	bl sub_0801B5E8
	adds r0, r4, #0
	bl sub_0801B018
	ldr r2, [sp]
	cmp r0, #0
	beq _0801AFA0
	mov r1, sl
	ldrb r0, [r1]
	mov r1, r8
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x10
	adds r0, r5, r0
	movs r1, #0xff
	strb r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	mov r1, sb
	strb r0, [r1]
	ldrb r0, [r7]
	movs r1, #4
	orrs r0, r1
	strb r0, [r7]
	ldr r1, _0801AF9C @ =gUnknown_0200CC88
	lsls r0, r5, #2
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
	b _0801AFA6
	.align 2, 0
_0801AF94: .4byte gUnknown_0200CC38
_0801AF98: .4byte gUnknown_02002FFF
_0801AF9C: .4byte gUnknown_0200CC88
_0801AFA0:
	adds r6, #1
	cmp r6, #3
	ble _0801AF52
_0801AFA6:
	adds r5, #1
	cmp r5, #0xf
	ble _0801AF16
	movs r5, #0
	movs r3, #0xff
	ldr r2, _0801AFF0 @ =gUnknown_0200CC38
	adds r4, r2, #0
	adds r4, #0x20
_0801AFB6:
	adds r0, r5, r4
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0801AFD6
	ldrb r1, [r2]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _0801AFD6
	ldrb r0, [r2, #0x10]
	orrs r0, r3
	strb r0, [r2, #0x10]
	adds r0, r1, #0
	orrs r0, r3
	strb r0, [r2]
_0801AFD6:
	adds r2, #1
	adds r5, #1
	cmp r5, #0xf
	ble _0801AFB6
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801AFF0: .4byte gUnknown_0200CC38

