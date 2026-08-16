	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801B120
sub_0801B120: @ 0x0801B120
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	str r0, [sp, #0x20]
	cmp r0, #0xff
	bne _0801B13C
	movs r1, #0
	mov sb, r1
_0801B13C:
	movs r4, #0
	mov r2, sp
	adds r2, #0x10
	str r2, [sp, #0x24]
	adds r7, r2, #0
	ldr r3, _0801B1C4 @ =gUnknown_0200CC38
	adds r5, r3, #0
	adds r5, #0x20
	movs r6, #0xef
_0801B14E:
	adds r1, r7, r4
	adds r0, r4, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r2, r4, r5
	ldrb r1, [r2]
	adds r0, r6, #0
	ands r0, r1
	strb r0, [r2]
	adds r4, #1
	cmp r4, #0xf
	ble _0801B14E
	ldr r0, _0801B1C8 @ =gUnknown_0200CC58
	adds r0, #0x10
	mov sl, r0
_0801B16C:
	movs r1, #1
	rsbs r1, r1, #0
	mov r8, r1
	movs r4, #0
_0801B174:
	ldr r2, [sp, #0x24]
	adds r0, r2, r4
	ldrb r0, [r0]
	adds r1, r4, #1
	mov ip, r1
	cmp r0, sb
	bne _0801B23A
	ldr r2, [sp, #0x20]
	cmp r2, #0xff
	bne _0801B194
	lsls r0, r4, #2
	ldr r1, _0801B1CC @ =gUnknown_0200CC88
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _0801B23A
_0801B194:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r8, r0
	bne _0801B1D0
	mov r8, r4
	movs r3, #0
	adds r2, r4, #1
	mov ip, r2
	movs r7, #0
	ldr r5, _0801B1C8 @ =gUnknown_0200CC58
	movs r6, #0xef
_0801B1AA:
	mov r1, sp
	adds r0, r1, r3
	strb r7, [r0]
	adds r2, r3, r5
	ldrb r1, [r2]
	adds r0, r6, #0
	ands r0, r1
	strb r0, [r2]
	adds r3, #1
	cmp r3, #0xf
	ble _0801B1AA
	b _0801B21C
	.align 2, 0
_0801B1C4: .4byte gUnknown_0200CC38
_0801B1C8: .4byte gUnknown_0200CC58
_0801B1CC: .4byte gUnknown_0200CC88
_0801B1D0:
	adds r1, r4, #1
	mov ip, r1
	cmp r8, r0
	ble _0801B23A
	mov r2, r8
	lsls r1, r2, #2
	ldr r0, _0801B1F8 @ =gUnknown_0200CC88
	adds r1, r1, r0
	lsls r0, r4, #2
	ldr r2, _0801B1F8 @ =gUnknown_0200CC88
	adds r0, r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	cmp r1, r0
	bhi _0801B23A
	cmp r1, r0
	bne _0801B1FC
	mov r1, sl
	adds r0, r4, r1
	b _0801B220
	.align 2, 0
_0801B1F8: .4byte gUnknown_0200CC88
_0801B1FC:
	mov r8, r4
	movs r3, #0
	movs r7, #0
	ldr r5, _0801B24C @ =gUnknown_0200CC58
	movs r6, #0xef
_0801B206:
	mov r1, sp
	adds r0, r1, r3
	strb r7, [r0]
	adds r2, r3, r5
	ldrb r1, [r2]
	adds r0, r6, #0
	ands r0, r1
	strb r0, [r2]
	adds r3, #1
	cmp r3, #0xf
	ble _0801B206
_0801B21C:
	mov r2, sl
	adds r0, r4, r2
_0801B220:
	ldrb r0, [r0]
	lsrs r0, r0, #4
	mov r2, sp
	adds r1, r2, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, _0801B24C @ =gUnknown_0200CC58
	adds r1, r4, r0
	ldrb r0, [r1]
	movs r2, #0x10
	orrs r0, r2
	strb r0, [r1]
_0801B23A:
	mov r4, ip
	cmp r4, #0xf
	ble _0801B174
	movs r0, #1
	rsbs r0, r0, #0
	cmp r8, r0
	bne _0801B254
	ldr r0, _0801B250 @ =0x0000FFFF
	b _0801B2EC
	.align 2, 0
_0801B24C: .4byte gUnknown_0200CC58
_0801B250: .4byte 0x0000FFFF
_0801B254:
	mov r0, r8
	add r0, sl
	ldrb r0, [r0]
	movs r3, #0xf
	ands r3, r0
	adds r3, #1
	movs r4, #0
	cmp r4, r3
	bge _0801B27A
	mov r0, sp
	b _0801B274
_0801B26A:
	adds r4, #1
	cmp r4, r3
	bge _0801B27A
	mov r1, sp
	adds r0, r1, r4
_0801B274:
	ldrb r0, [r0]
	cmp r0, #1
	beq _0801B26A
_0801B27A:
	cmp r4, r3
	bne _0801B2A4
	cmp r4, #0xf
	bgt _0801B298
	mov r2, sp
	adds r0, r2, r4
	b _0801B292
_0801B288:
	adds r4, #1
	cmp r4, #0xf
	bgt _0801B298
	mov r1, sp
	adds r0, r1, r4
_0801B292:
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801B288
_0801B298:
	cmp r4, #0x10
	bne _0801B2A4
	mov r2, r8
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	b _0801B2EC
_0801B2A4:
	mov r1, r8
	lsls r0, r1, #2
	ldr r2, _0801B2E4 @ =gUnknown_0200CC88
	adds r0, r0, r2
	ldr r6, [r0]
	movs r4, #0
	ldr r0, _0801B2E8 @ =gUnknown_0200CC58
	mov r8, r0
	adds r3, r2, #0
	ldr r5, [sp, #0x24]
	movs r7, #0xff
_0801B2BA:
	adds r2, r5, r4
	ldrb r1, [r2]
	cmp r1, sb
	bne _0801B2CC
	ldr r0, [r3]
	cmp r0, r6
	bne _0801B2CC
	orrs r1, r7
	strb r1, [r2]
_0801B2CC:
	mov r1, r8
	adds r0, r4, r1
	ldrb r2, [r0]
	movs r1, #0xef
	ands r1, r2
	strb r1, [r0]
	adds r3, #4
	adds r4, #1
	cmp r4, #0xf
	ble _0801B2BA
	b _0801B16C
	.align 2, 0
_0801B2E4: .4byte gUnknown_0200CC88
_0801B2E8: .4byte gUnknown_0200CC58
_0801B2EC:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

