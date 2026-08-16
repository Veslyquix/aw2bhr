	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803F990
sub_0803F990: @ 0x0803F990
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r1, _0803FA64 @ =gUnknown_0809130C
	ldr r0, [r1]
	ldr r3, [r0]
	movs r2, #4
	ldrsh r0, [r3, r2]
	cmp r0, #0
	bge _0803F9AC
	adds r0, #0xf
_0803F9AC:
	lsls r0, r0, #0xc
	lsrs r1, r0, #0x10
	movs r4, #6
	ldrsh r0, [r3, r4]
	cmp r0, #0
	bge _0803F9BA
	adds r0, #0xf
_0803F9BA:
	lsls r0, r0, #0xc
	lsrs r4, r0, #0x10
	movs r0, #0xf
	str r0, [sp, #4]
	movs r2, #0xa
	mov sl, r2
	lsls r1, r1, #0x10
	asrs r5, r1, #0x10
	adds r2, r5, #0
	adds r2, #0xe
	ldrh r0, [r3]
	subs r0, #1
	str r1, [sp, #0xc]
	cmp r2, r0
	bne _0803F9DC
	movs r0, #0xe
	str r0, [sp, #4]
_0803F9DC:
	lsls r0, r4, #0x10
	asrs r4, r0, #0x10
	adds r2, r4, #0
	adds r2, #9
	ldrh r1, [r3, #2]
	subs r1, #1
	str r0, [sp, #8]
	cmp r2, r1
	bne _0803F9F2
	movs r2, #9
	mov sl, r2
_0803F9F2:
	adds r0, r5, #0
	adds r1, r4, #0
	ldr r2, [sp, #4]
	mov r3, sl
	bl sub_0803FC28
	movs r2, #0
	movs r7, #1
	mov r8, r2
_0803FA04:
	ldr r1, _0803FA68 @ =gUnknown_03003150
	lsls r2, r2, #0x10
	asrs r0, r2, #0xe
	adds r4, r0, r1
	ldrb r1, [r4]
	adds r0, r1, #0
	mov sb, r2
	cmp r0, #0xff
	bne _0803FA18
	b _0803FC12
_0803FA18:
	ldr r2, [sp, #0xc]
	asrs r0, r2, #0x10
	ldrb r3, [r4, #1]
	cmp r0, r3
	ble _0803FA24
	b _0803FC02
_0803FA24:
	ldr r2, [sp, #4]
	adds r0, r0, r2
	cmp r3, r0
	ble _0803FA2E
	b _0803FC02
_0803FA2E:
	ldr r2, [sp, #8]
	asrs r0, r2, #0x10
	ldrb r5, [r4, #2]
	cmp r0, r5
	ble _0803FA3A
	b _0803FC02
_0803FA3A:
	add r0, sl
	cmp r5, r0
	ble _0803FA42
	b _0803FC02
_0803FA42:
	lsrs r6, r1, #5
	movs r0, #0x1f
	ands r0, r1
	cmp r0, #0x12
	bne _0803FA4E
	b _0803FB68
_0803FA4E:
	cmp r0, #0x12
	bgt _0803FA80
	cmp r0, #0xa
	beq _0803FB14
	cmp r0, #0xa
	bgt _0803FA6C
	cmp r0, #6
	beq _0803FAB0
	cmp r0, #8
	beq _0803FB34
	b _0803FC02
	.align 2, 0
_0803FA64: .4byte gUnknown_0809130C
_0803FA68: .4byte gUnknown_03003150
_0803FA6C:
	cmp r0, #0xe
	beq _0803FAC0
	cmp r0, #0xe
	bgt _0803FA7A
	cmp r0, #0xb
	beq _0803FB24
	b _0803FC02
_0803FA7A:
	cmp r0, #0x11
	beq _0803FB58
	b _0803FC02
_0803FA80:
	cmp r0, #0x17
	bne _0803FA86
	b _0803FBB4
_0803FA86:
	cmp r0, #0x17
	bgt _0803FA9C
	cmp r0, #0x15
	bne _0803FA90
	b _0803FB7C
_0803FA90:
	cmp r0, #0x15
	ble _0803FA96
	b _0803FB98
_0803FA96:
	cmp r0, #0x14
	beq _0803FB48
	b _0803FC02
_0803FA9C:
	cmp r0, #0x19
	bne _0803FAA2
	b _0803FBEC
_0803FAA2:
	cmp r0, #0x19
	bge _0803FAA8
	b _0803FBD0
_0803FAA8:
	cmp r0, #0xff
	bne _0803FAAE
	b _0803FC12
_0803FAAE:
	b _0803FC02
_0803FAB0:
	str r7, [sp]
	adds r0, r3, #0
	adds r1, r5, #0
	ldr r2, _0803FABC @ =gUnknown_0849F990
	b _0803FB70
	.align 2, 0
_0803FABC: .4byte gUnknown_0849F990
_0803FAC0:
	ldr r0, _0803FAEC @ =gUnknown_08499590
	ldr r1, [r0]
	lsls r2, r5, #1
	ldr r4, _0803FAF0 @ =0x0000417A
	adds r0, r1, r4
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r3
	ldr r2, _0803FAF4 @ =0x0000234A
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803FAFC
	ldr r0, _0803FAF8 @ =gUnknown_0849FAB0
	lsls r1, r6, #2
	adds r1, r1, r0
	ldr r2, [r1]
	str r7, [sp]
	adds r0, r3, #0
	adds r1, r5, #0
	b _0803FB70
	.align 2, 0
_0803FAEC: .4byte gUnknown_08499590
_0803FAF0: .4byte 0x0000417A
_0803FAF4: .4byte 0x0000234A
_0803FAF8: .4byte gUnknown_0849FAB0
_0803FAFC:
	ldr r0, _0803FB10 @ =gUnknown_0849FAB0
	ldr r2, [r0]
	str r7, [sp]
	adds r0, r3, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_0803F908
	b _0803FC02
	.align 2, 0
_0803FB10: .4byte gUnknown_0849FAB0
_0803FB14:
	str r7, [sp]
	adds r0, r3, #0
	adds r1, r5, #0
	ldr r2, _0803FB20 @ =gUnknown_0849F998
	b _0803FB70
	.align 2, 0
_0803FB20: .4byte gUnknown_0849F998
_0803FB24:
	str r7, [sp]
	adds r0, r3, #0
	adds r1, r5, #0
	ldr r2, _0803FB30 @ =gUnknown_0849F9A0
	b _0803FB70
	.align 2, 0
_0803FB30: .4byte gUnknown_0849F9A0
_0803FB34:
	ldr r0, _0803FB44 @ =gUnknown_0849FAC4
	lsls r1, r6, #2
	adds r1, r1, r0
	ldr r2, [r1]
	str r7, [sp]
	adds r0, r3, #0
	adds r1, r5, #0
	b _0803FB70
	.align 2, 0
_0803FB44: .4byte gUnknown_0849FAC4
_0803FB48:
	str r7, [sp]
	adds r0, r3, #0
	adds r1, r5, #0
	ldr r2, _0803FB54 @ =gUnknown_0849F9A8
	b _0803FB70
	.align 2, 0
_0803FB54: .4byte gUnknown_0849F9A8
_0803FB58:
	str r7, [sp]
	adds r0, r3, #0
	adds r1, r5, #0
	ldr r2, _0803FB64 @ =gUnknown_0849F9B0
	b _0803FB70
	.align 2, 0
_0803FB64: .4byte gUnknown_0849F9B0
_0803FB68:
	str r7, [sp]
	adds r0, r3, #0
	adds r1, r5, #0
	ldr r2, _0803FB78 @ =gUnknown_0849F9B8
_0803FB70:
	adds r3, r6, #0
	bl sub_0803F908
	b _0803FC02
	.align 2, 0
_0803FB78: .4byte gUnknown_0849F9B8
_0803FB7C:
	movs r0, #5
	bl sub_08027198
	adds r3, r0, #0
	ldrb r0, [r4, #1]
	ldrb r1, [r4, #2]
	mov r4, r8
	str r4, [sp]
	ldr r2, _0803FB94 @ =gUnknown_0849F9D0
	bl sub_0803F908
	b _0803FC02
	.align 2, 0
_0803FB94: .4byte gUnknown_0849F9D0
_0803FB98:
	movs r0, #5
	bl sub_08027198
	adds r3, r0, #0
	ldrb r0, [r4, #1]
	ldrb r1, [r4, #2]
	mov r2, r8
	str r2, [sp]
	ldr r2, _0803FBB0 @ =gUnknown_0849F9D8
	bl sub_0803F908
	b _0803FC02
	.align 2, 0
_0803FBB0: .4byte gUnknown_0849F9D8
_0803FBB4:
	movs r0, #5
	bl sub_08027198
	adds r3, r0, #0
	ldrb r0, [r4, #1]
	ldrb r1, [r4, #2]
	mov r4, r8
	str r4, [sp]
	ldr r2, _0803FBCC @ =gUnknown_0849F9C0
	bl sub_0803F908
	b _0803FC02
	.align 2, 0
_0803FBCC: .4byte gUnknown_0849F9C0
_0803FBD0:
	movs r0, #5
	bl sub_08027198
	adds r3, r0, #0
	ldrb r0, [r4, #1]
	ldrb r1, [r4, #2]
	mov r2, r8
	str r2, [sp]
	ldr r2, _0803FBE8 @ =gUnknown_0849F9C8
	bl sub_0803F908
	b _0803FC02
	.align 2, 0
_0803FBE8: .4byte gUnknown_0849F9C8
_0803FBEC:
	movs r0, #5
	bl sub_08027198
	adds r3, r0, #0
	ldrb r0, [r4, #1]
	ldrb r1, [r4, #2]
	mov r4, r8
	str r4, [sp]
	ldr r2, _0803FC24 @ =gUnknown_0849F9E0
	bl sub_0803F908
_0803FC02:
	movs r0, #0x80
	lsls r0, r0, #9
	add r0, sb
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x5b
	bgt _0803FC12
	b _0803FA04
_0803FC12:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803FC24: .4byte gUnknown_0849F9E0

