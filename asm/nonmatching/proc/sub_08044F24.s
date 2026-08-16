	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08044F24
sub_08044F24: @ 0x08044F24
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	bne _08044F42
_08044F3A:
	mov r0, r8
	bl Proc_Break
	b _0804507E
_08044F42:
	mov r4, r8
	adds r4, #0x2b
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldr r0, _08044FB4 @ =gUnknown_0849A00C
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _08044F60
	b _0804507E
_08044F60:
	ldrb r0, [r4]
	cmp r0, #4
	bhi _08044F68
	b _0804507E
_08044F68:
	movs r0, #0
	strb r0, [r4]
	mov r0, r8
	adds r0, #0x2a
	ldrb r5, [r0]
	mov sl, r0
	lsls r0, r5, #4
	subs r0, r0, r5
	lsls r6, r0, #2
_08044F7A:
	cmp r5, #4
	bgt _08044F3A
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08044FAE
	ldr r0, _08044FB8 @ =gUnknown_08499598
	ldr r3, [r0]
	adds r2, r6, r3
	adds r2, #0x2a
	mov r4, r8
	adds r4, #0x2c
	ldrb r1, [r4]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x2a
	ldrb r1, [r2]
	mov sb, r4
	ldrb r0, [r0]
	cmp r1, r0
	bne _08044FBC
_08044FAE:
	adds r6, #0x3c
	adds r5, #1
	b _08044F7A
	.align 2, 0
_08044FB4: .4byte gUnknown_0849A00C
_08044FB8: .4byte gUnknown_08499598
_08044FBC:
	mov r0, sl
	strb r5, [r0]
	mov r0, r8
	adds r0, #0x29
	ldrb r7, [r0]
	str r0, [sp]
	cmp r7, #0x32
	bgt _08045064
	ldr r2, _0804501C @ =gUnknown_08499594
	movs r1, #0x80
	rsbs r1, r1, #0
	mov ip, r1
_08044FD4:
	ldr r1, _08045020 @ =gUnknown_084995FE
	mov r3, sl
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
	beq _0804505E
	ldrb r1, [r4, #1]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0804505E
	ldrb r5, [r4, #4]
	lsls r6, r5, #0x19
	lsrs r2, r6, #0x19
	mov r0, r8
	adds r0, #0x2d
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r3, r0, #1
	adds r0, r3, #1
	cmp r2, r0
	bge _08045024
	mov r0, ip
	ands r0, r5
	movs r1, #1
	b _08045030
	.align 2, 0
_0804501C: .4byte gUnknown_08499594
_08045020: .4byte gUnknown_084995FE
_08045024:
	lsrs r1, r6, #0x19
	subs r1, r1, r3
	movs r0, #0x7f
	ands r1, r0
	mov r0, ip
	ands r0, r5
_08045030:
	orrs r0, r1
	strb r0, [r4, #4]
	mov r0, r8
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804504C
	ldrb r0, [r4, #6]
	lsls r1, r0, #0x19
	lsrs r1, r1, #0x1a
	mov r2, ip
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #6]
_0804504C:
	bl sub_08022580
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	mov r3, sb
	ldrb r2, [r3]
	bl sub_080452C0
	b _08045064
_0804505E:
	adds r7, #1
	cmp r7, #0x32
	ble _08044FD4
_08045064:
	adds r0, r7, #1
	ldr r1, [sp]
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x32
	bls _0804507E
	movs r0, #1
	strb r0, [r1]
	mov r2, sl
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
_0804507E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

