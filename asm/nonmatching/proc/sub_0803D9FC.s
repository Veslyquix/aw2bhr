	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803D9FC
sub_0803D9FC: @ 0x0803D9FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0
	mov sl, r0
	ldrb r6, [r7, #0x1e]
	ldr r2, _0803DC30 @ =gUnknown_08091298
	movs r0, #8
	movs r1, #0
	bl sub_080119A0
	ldr r2, _0803DC34 @ =gUnknown_080912A4
	movs r0, #8
	movs r1, #8
	bl sub_080119A0
	ldr r2, _0803DC38 @ =gUnknown_080912AC
	movs r0, #8
	movs r1, #0x10
	bl sub_080119A0
	ldr r2, _0803DC3C @ =gUnknown_080912B4
	movs r0, #8
	movs r1, #0x18
	bl sub_080119A0
	ldr r2, _0803DC40 @ =gUnknown_080912BC
	movs r0, #8
	movs r1, #0x20
	bl sub_080119A0
	ldr r2, _0803DC44 @ =gUnknown_080912C4
	movs r0, #8
	movs r1, #0x28
	bl sub_080119A0
	ldr r2, _0803DC48 @ =gUnknown_080912CC
	movs r0, #8
	movs r1, #0x30
	bl sub_080119A0
	ldr r2, _0803DC4C @ =gUnknown_080912D4
	movs r0, #8
	movs r1, #0x38
	bl sub_080119A0
	ldr r2, _0803DC50 @ =gUnknown_080912DC
	movs r0, #8
	movs r1, #0x40
	bl sub_080119A0
	ldr r1, _0803DC54 @ =gUnknown_080912E8
	mov r8, r1
	ldr r5, [r1]
	ldrb r0, [r5, #2]
	bl sub_0802490C
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0x50
	movs r1, #0
	bl sub_0802BD54
	movs r0, #0x1e
	ldrsh r2, [r7, r0]
	movs r0, #0x40
	movs r1, #0
	bl sub_0802BD54
	ldr r1, _0803DC58 @ =gUnknown_080911A8
	ldr r2, _0803DC5C @ =gUnknown_08499598
	mov sb, r2
	ldr r0, [r2]
	lsls r4, r6, #4
	subs r4, r4, r6
	lsls r4, r4, #2
	adds r0, r4, r0
	ldrb r0, [r0, #0x1b]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	movs r0, #0x40
	movs r1, #8
	bl sub_080119A0
	mov r1, sb
	ldr r0, [r1]
	adds r0, r4, r0
	ldr r2, [r0]
	movs r0, #0x68
	movs r1, #0x10
	bl sub_0802BD54
	mov r2, sb
	ldr r0, [r2]
	adds r0, r4, r0
	ldr r2, [r0, #0x20]
	movs r0, #0x68
	movs r1, #0x18
	bl sub_0802BD54
	ldr r1, _0803DC60 @ =gUnknown_080911C4
	mov r2, sb
	ldr r0, [r2]
	adds r0, r4, r0
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	movs r0, #0x40
	movs r1, #0x20
	bl sub_080119A0
	mov r1, sb
	ldr r0, [r1]
	adds r0, r4, r0
	adds r0, #0x2a
	ldrb r2, [r0]
	movs r0, #0x68
	movs r1, #0x28
	bl sub_0802BD54
	ldr r1, _0803DC64 @ =gUnknown_08091154
	ldrb r0, [r5, #0xd]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	movs r0, #0x50
	movs r1, #0x30
	bl sub_080119A0
	ldr r5, _0803DC68 @ =gUnknown_080912F0
	ldr r0, [r5]
	ldrh r2, [r0]
	movs r0, #0x40
	movs r1, #0x38
	bl sub_0802BD54
	ldr r1, _0803DC6C @ =gUnknown_08091164
	mov r2, sb
	ldr r0, [r2]
	adds r4, r4, r0
	ldrb r0, [r4, #0x1a]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	movs r0, #0x40
	movs r1, #0x40
	bl sub_080119A0
	movs r0, #0x20
	ldrsh r1, [r7, r0]
	lsls r1, r1, #0x13
	lsrs r1, r1, #0x10
	ldr r2, _0803DC70 @ =gUnknown_080912E4
	movs r0, #0
	bl sub_080119A0
	ldr r2, _0803DC74 @ =gUnknown_080912F4
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	mov ip, r8
	ldr r1, _0803DC78 @ =gUnknown_080912EC
	mov r8, r1
	cmp r0, #0
	beq _0803DB82
	movs r4, #1
	mov r3, sb
_0803DB5E:
	ldrh r0, [r7, #0x1e]
	adds r0, #1
	strh r0, [r7, #0x1e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _0803DB6E
	strh r4, [r7, #0x1e]
_0803DB6E:
	movs r2, #0x1e
	ldrsh r1, [r7, r2]
	ldr r2, [r3]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1b]
	cmp r0, #0
	beq _0803DB5E
_0803DB82:
	ldr r0, _0803DC7C @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803DBB8
	movs r4, #4
	ldr r3, _0803DC5C @ =gUnknown_08499598
_0803DB96:
	ldrh r0, [r7, #0x1e]
	subs r0, #1
	strh r0, [r7, #0x1e]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _0803DBA4
	strh r4, [r7, #0x1e]
_0803DBA4:
	movs r0, #0x1e
	ldrsh r1, [r7, r0]
	ldr r2, [r3]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1b]
	cmp r0, #0
	beq _0803DB96
_0803DBB8:
	ldr r0, _0803DC7C @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803DBD4
	ldrh r1, [r7, #0x20]
	movs r2, #0x20
	ldrsh r0, [r7, r2]
	cmp r0, #1
	ble _0803DBD4
	subs r0, r1, #1
	strh r0, [r7, #0x20]
_0803DBD4:
	ldr r0, _0803DC7C @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0803DBF0
	ldrh r1, [r7, #0x20]
	movs r2, #0x20
	ldrsh r0, [r7, r2]
	cmp r0, #6
	bgt _0803DBF0
	adds r0, r1, #1
	strh r0, [r7, #0x20]
_0803DBF0:
	ldr r0, _0803DC7C @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0803DC02
	movs r0, #0xff
	mov sl, r0
_0803DC02:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0803DC0E
	movs r2, #1
	mov sl, r2
_0803DC0E:
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	bne _0803DC18
	b _0803DDBE
_0803DC18:
	ldrh r0, [r7, #0x20]
	subs r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	bls _0803DC26
	b _0803DDBE
_0803DC26:
	lsls r0, r0, #2
	ldr r1, _0803DC80 @ =_0803DC84
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803DC30: .4byte gUnknown_08091298
_0803DC34: .4byte gUnknown_080912A4
_0803DC38: .4byte gUnknown_080912AC
_0803DC3C: .4byte gUnknown_080912B4
_0803DC40: .4byte gUnknown_080912BC
_0803DC44: .4byte gUnknown_080912C4
_0803DC48: .4byte gUnknown_080912CC
_0803DC4C: .4byte gUnknown_080912D4
_0803DC50: .4byte gUnknown_080912DC
_0803DC54: .4byte gUnknown_080912E8
_0803DC58: .4byte gUnknown_080911A8
_0803DC5C: .4byte gUnknown_08499598
_0803DC60: .4byte gUnknown_080911C4
_0803DC64: .4byte gUnknown_08091154
_0803DC68: .4byte gUnknown_080912F0
_0803DC6C: .4byte gUnknown_08091164
_0803DC70: .4byte gUnknown_080912E4
_0803DC74: .4byte gUnknown_080912F4
_0803DC78: .4byte gUnknown_080912EC
_0803DC7C: .4byte gpKeySt
_0803DC80: .4byte _0803DC84
_0803DC84: @ jump table
	.4byte _0803DCA0 @ case 0
	.4byte _0803DCC8 @ case 1
	.4byte _0803DCFC @ case 2
	.4byte _0803DD34 @ case 3
	.4byte _0803DD5E @ case 4
	.4byte _0803DD8A @ case 5
	.4byte _0803DDA6 @ case 6
_0803DCA0:
	mov r0, r8
	ldr r5, [r0]
	ldr r0, [r5]
	lsls r4, r6, #4
	subs r4, r4, r6
	lsls r4, r4, #2
	adds r0, r4, r0
	ldrb r0, [r0, #0x1b]
	mov r2, sl
	lsls r1, r2, #0x18
	asrs r1, r1, #0x18
	movs r2, #1
	str r2, [sp]
	movs r3, #2
	bl sub_0803D990
	ldr r1, [r5]
	adds r4, r4, r1
	strb r0, [r4, #0x1b]
	b _0803DDBE
_0803DCC8:
	mov r0, r8
	ldr r5, [r0]
	ldr r0, [r5]
	lsls r4, r6, #4
	subs r4, r4, r6
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	mov r2, sl
	lsls r1, r2, #0x18
	asrs r1, r1, #0x18
	ldr r2, _0803DCF4 @ =0x0000C350
	muls r1, r2, r1
	ldr r3, _0803DCF8 @ =0x000F423F
	movs r2, #0
	str r2, [sp]
	bl sub_0803D990
	ldr r1, [r5]
	adds r4, r4, r1
	str r0, [r4]
	b _0803DDBE
	.align 2, 0
_0803DCF4: .4byte 0x0000C350
_0803DCF8: .4byte 0x000F423F
_0803DCFC:
	adds r0, r6, #0
	bl sub_08044208
	adds r3, r0, #0
	mov r0, r8
	ldr r5, [r0]
	ldr r0, [r5]
	lsls r4, r6, #4
	subs r4, r4, r6
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0, #0x20]
	mov r2, sl
	lsls r1, r2, #0x18
	asrs r1, r1, #0x18
	ldr r2, _0803DD30 @ =0x00002710
	muls r1, r2, r1
	movs r2, #0
	str r2, [sp]
	bl sub_0803D990
	ldr r1, [r5]
	adds r4, r4, r1
	str r0, [r4, #0x20]
	b _0803DDBE
	.align 2, 0
_0803DD30: .4byte 0x00002710
_0803DD34:
	mov r0, r8
	ldr r5, [r0]
	ldr r0, [r5]
	lsls r4, r6, #4
	subs r4, r4, r6
	lsls r4, r4, #2
	adds r0, r4, r0
	ldrb r0, [r0, #0x1d]
	mov r2, sl
	lsls r1, r2, #0x18
	asrs r1, r1, #0x18
	movs r2, #1
	str r2, [sp]
	movs r2, #0
	movs r3, #0x12
	bl sub_0803D990
	ldr r1, [r5]
	adds r4, r4, r1
	strb r0, [r4, #0x1d]
	b _0803DDBE
_0803DD5E:
	mov r0, r8
	ldr r5, [r0]
	ldr r0, [r5]
	lsls r4, r6, #4
	subs r4, r4, r6
	lsls r4, r4, #2
	adds r0, r4, r0
	adds r0, #0x2a
	ldrb r0, [r0]
	mov r2, sl
	lsls r1, r2, #0x18
	asrs r1, r1, #0x18
	movs r2, #0
	str r2, [sp]
	movs r3, #3
	bl sub_0803D990
	ldr r1, [r5]
	adds r4, r4, r1
	adds r4, #0x2a
	strb r0, [r4]
	b _0803DDBE
_0803DD8A:
	mov r0, ip
	ldr r4, [r0]
	ldrb r0, [r4, #0xd]
	mov r2, sl
	lsls r1, r2, #0x18
	asrs r1, r1, #0x18
	movs r2, #1
	str r2, [sp]
	movs r2, #0
	movs r3, #1
	bl sub_0803D990
	strb r0, [r4, #0xd]
	b _0803DDBE
_0803DDA6:
	ldr r4, [r5]
	ldrh r0, [r4]
	mov r2, sl
	lsls r1, r2, #0x18
	asrs r1, r1, #0x18
	ldr r3, _0803DDE8 @ =0x000003E7
	movs r2, #1
	str r2, [sp]
	movs r2, #0
	bl sub_0803D990
	strh r0, [r4]
_0803DDBE:
	ldr r0, _0803DDEC @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0803DDD8
	bl sub_08026B28
	ldr r0, _0803DDF0 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
_0803DDD8:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803DDE8: .4byte 0x000003E7
_0803DDEC: .4byte gpKeySt
_0803DDF0: .4byte gUnknown_03001FBC

