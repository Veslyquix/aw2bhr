	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801AC58
sub_0801AC58: @ 0x0801AC58
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r4, #0
	ldr r3, _0801ACB4 @ =gUnknown_0200CC58
	movs r5, #0x10
_0801AC70:
	mov r0, sp
	adds r2, r0, r4
	adds r0, r4, r3
	ldrb r1, [r0]
	adds r0, r5, #0
	ands r0, r1
	strb r0, [r2]
	adds r4, #1
	cmp r4, #0xf
	ble _0801AC70
	mov r0, r8
	bl sub_0801AD70
	adds r3, r0, #0
	movs r4, #0
	ldr r5, _0801ACB4 @ =gUnknown_0200CC58
	movs r6, #0xef
_0801AC92:
	adds r2, r4, r5
	ldrb r0, [r2]
	adds r1, r6, #0
	ands r1, r0
	mov r7, sp
	adds r0, r7, r4
	ldrb r0, [r0]
	orrs r1, r0
	strb r1, [r2]
	adds r4, #1
	cmp r4, #0xf
	ble _0801AC92
	cmp r3, #0
	beq _0801ACB8
_0801ACAE:
	movs r0, #1
	b _0801AD4A
	.align 2, 0
_0801ACB4: .4byte gUnknown_0200CC58
_0801ACB8:
	movs r4, #0
	ldr r0, _0801AD5C @ =gUnknown_02002000
	mov sb, r0
	movs r1, #0x50
	add r1, sb
	mov sl, r1
_0801ACC4:
	ldr r0, _0801AD60 @ =gUnknown_0200CC38
	adds r0, r4, r0
	ldrb r0, [r0]
	cmp r8, r0
	bne _0801AD2C
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl sub_0801B018
	cmp r0, #0
	bne _0801ACAE
	movs r3, #0
	mov r7, sl
	ldrh r7, [r7]
	cmp r3, r7
	bge _0801AD06
	ldr r2, _0801AD5C @ =gUnknown_02002000
	ldr r7, _0801AD64 @ =gUnknown_0200CC2C
	adds r6, r2, #0
	adds r6, #0x50
	adds r5, r2, #0
	adds r5, #0x52
_0801ACF0:
	ldrh r1, [r2, #0xe]
	ldr r0, [r7]
	adds r0, r0, r1
	adds r0, r0, r3
	adds r1, r3, r5
	ldrb r1, [r1]
	strb r1, [r0]
	adds r3, #1
	ldrh r0, [r6]
	cmp r3, r0
	blt _0801ACF0
_0801AD06:
	mov r7, sb
	ldrb r1, [r7, #0xc]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _0801AD2C
	mov r0, r8
	cmp r0, #0
	bne _0801AD2C
	movs r3, #0
	ldr r5, _0801AD68 @ =gUnknown_0200CC48
	ldr r2, _0801AD6C @ =gUnknown_02002FEF
_0801AD1E:
	adds r0, r3, r5
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r3, #1
	cmp r3, #0xf
	ble _0801AD1E
_0801AD2C:
	adds r4, #1
	cmp r4, #0xf
	ble _0801ACC4
	mov r1, r8
	cmp r1, #0
	bne _0801AD48
	ldr r1, _0801AD60 @ =gUnknown_0200CC38
	movs r3, #0xf
_0801AD3C:
	ldrb r0, [r1, #0x10]
	strb r0, [r1]
	adds r1, #1
	subs r3, #1
	cmp r3, #0
	bge _0801AD3C
_0801AD48:
	movs r0, #0
_0801AD4A:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801AD5C: .4byte gUnknown_02002000
_0801AD60: .4byte gUnknown_0200CC38
_0801AD64: .4byte gUnknown_0200CC2C
_0801AD68: .4byte gUnknown_0200CC48
_0801AD6C: .4byte gUnknown_02002FEF

