	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08044E10
sub_08044E10: @ 0x08044E10
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	adds r0, #0x2e
	ldrb r0, [r0]
	cmp r0, #0
	beq _08044E56
	mov r4, r8
	adds r4, #0x2b
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldr r0, _08044E60 @ =gUnknown_0849A00C
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _08044F16
	ldrb r0, [r4]
	cmp r0, #4
	bls _08044F16
	movs r0, #0
	strb r0, [r4]
	mov r0, r8
	adds r0, #0x2c
	ldrb r1, [r0]
	mov sb, r0
	cmp r1, #4
	bls _08044E64
_08044E56:
	mov r0, r8
	bl Proc_Break
	b _08044F16
	.align 2, 0
_08044E60: .4byte gUnknown_0849A00C
_08044E64:
	mov r0, r8
	adds r0, #0x29
	ldrb r7, [r0]
	mov sl, r0
	cmp r7, #0x32
	bgt _08044EF4
	ldr r2, _08044EC4 @ =gUnknown_08499594
	movs r0, #0x80
	rsbs r0, r0, #0
	mov ip, r0
_08044E78:
	ldr r1, _08044EC8 @ =gUnknown_084995FE
	mov r3, sb
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, r0, r7
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r2]
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, #0
	beq _08044EEE
	ldrb r1, [r4, #1]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _08044EEE
	ldrb r5, [r4, #4]
	lsls r6, r5, #0x19
	lsrs r2, r6, #0x19
	mov r0, r8
	adds r0, #0x2e
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r3, r0, #1
	movs r0, #0x64
	subs r0, r0, r3
	cmp r2, r0
	ble _08044ECC
	mov r0, ip
	ands r0, r5
	movs r1, #0x64
	b _08044ED8
	.align 2, 0
_08044EC4: .4byte gUnknown_08499594
_08044EC8: .4byte gUnknown_084995FE
_08044ECC:
	lsrs r1, r6, #0x19
	adds r1, r1, r3
	movs r0, #0x7f
	ands r1, r0
	mov r0, ip
	ands r0, r5
_08044ED8:
	orrs r0, r1
	strb r0, [r4, #4]
	bl sub_08022580
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	mov r3, sb
	ldrb r2, [r3]
	bl sub_080452C0
	b _08044EF4
_08044EEE:
	adds r7, #1
	cmp r7, #0x32
	ble _08044E78
_08044EF4:
	adds r0, r7, #1
	mov r1, sl
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x32
	bls _08044F16
	mov r0, r8
	bl Proc_Break
	movs r0, #1
	mov r3, sl
	strb r0, [r3]
	mov r1, r8
	adds r1, #0x2a
	movs r0, #0
	strb r0, [r1]
_08044F16:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

