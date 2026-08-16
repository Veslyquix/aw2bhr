	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08022DD4
sub_08022DD4: @ 0x08022DD4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	movs r5, #0
	movs r0, #0
	movs r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r3, sp, #8
	ldrh r1, [r3, #4]
	ldr r0, _08022E24 @ =0xFFFFFC00
	ands r0, r1
	ldr r4, _08022E28 @ =0x00000365
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r3, #4]
	ldrb r1, [r3, #5]
	movs r0, #0xf
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r3, #5]
	lsrs r7, r2, #0x10
	asrs r0, r2, #0x10
	cmp r0, #0xd
	bls _08022E18
	b _08023012
_08022E18:
	lsls r0, r0, #2
	ldr r1, _08022E2C @ =_08022E30
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08022E24: .4byte 0xFFFFFC00
_08022E28: .4byte 0x00000365
_08022E2C: .4byte _08022E30
_08022E30: @ jump table
	.4byte _08022E68 @ case 0
	.4byte _08022EE6 @ case 1
	.4byte _08022EF8 @ case 2
	.4byte _08022F24 @ case 3
	.4byte _08023012 @ case 4
	.4byte _08022F4C @ case 5
	.4byte _08022F60 @ case 6
	.4byte _08022F88 @ case 7
	.4byte _08022FB0 @ case 8
	.4byte _08022FB0 @ case 9
	.4byte _08022FB0 @ case 10
	.4byte _08022FB0 @ case 11
	.4byte _08022FDE @ case 12
	.4byte _08022FDE @ case 13
_08022E68:
	ldr r0, _08022ECC @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #0x21
	bl __umodsi3
	adds r5, r0, #0
	ldr r0, _08022ED0 @ =gUnknown_08499590
	ldr r2, [r0]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	movs r3, #6
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	asrs r4, r0, #4
	lsls r1, r4, #1
	ldr r3, _08022ED4 @ =0x0000417A
	adds r0, r2, r3
	adds r0, r0, r1
	ldrh r0, [r0]
	mov ip, r0
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r3, #4
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	asrs r1, r0, #4
	mov r0, ip
	adds r3, r0, r1
	adds r2, #0x12
	adds r2, r2, r3
	ldrb r0, [r2]
	cmp r0, #0
	bne _08022ED8
	adds r0, r1, #0
	adds r1, r4, #0
	bl sub_08042424
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08022ED8
	movs r7, #4
_08022EBC:
	cmp r5, #4
	ble _08022F70
	cmp r5, #8
	ble _08022F84
	cmp r5, #0x1c
	ble _08022F80
	b _08022F84
	.align 2, 0
_08022ECC: .4byte gUnknown_03004008
_08022ED0: .4byte gUnknown_08499590
_08022ED4: .4byte 0x0000417A
_08022ED8:
	cmp r5, #4
	ble _08022F98
	cmp r5, #8
	ble _08022FAC
	cmp r5, #0x1c
	ble _08022FA8
	b _08022FAC
_08022EE6:
	ldr r0, _08022EF4 @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #0x21
	bl __umodsi3
	adds r5, r0, #0
	b _08022ED8
	.align 2, 0
_08022EF4: .4byte gUnknown_03004008
_08022EF8:
	ldr r0, _08022F0C @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #0x14
	bl __umodsi3
	adds r5, r0, #0
	cmp r5, #4
	bgt _08022F10
	movs r5, #6
	b _08023012
	.align 2, 0
_08022F0C: .4byte gUnknown_03004008
_08022F10:
	cmp r5, #9
	bgt _08022F18
	movs r5, #7
	b _08023012
_08022F18:
	cmp r5, #0xe
	bgt _08022F20
	movs r5, #8
	b _08023012
_08022F20:
	movs r5, #9
	b _08023012
_08022F24:
	ldr r0, _08022F38 @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #0x1c
	bl __umodsi3
	adds r5, r0, #0
	cmp r5, #5
	bgt _08022F3C
	movs r5, #3
	b _08023012
	.align 2, 0
_08022F38: .4byte gUnknown_03004008
_08022F3C:
	cmp r5, #8
	bgt _08022F44
_08022F40:
	movs r5, #4
	b _08023012
_08022F44:
	cmp r5, #0x19
	bgt _08022F40
	movs r5, #5
	b _08023012
_08022F4C:
	ldr r0, _08022F5C @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #0x21
	bl __umodsi3
	adds r5, r0, #0
	b _08022EBC
	.align 2, 0
_08022F5C: .4byte gUnknown_03004008
_08022F60:
	ldr r0, _08022F74 @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #0x21
	bl __umodsi3
	adds r5, r0, #0
	cmp r5, #4
	bgt _08022F78
_08022F70:
	movs r5, #0xa
	b _08023012
	.align 2, 0
_08022F74: .4byte gUnknown_03004008
_08022F78:
	cmp r5, #8
	ble _08022F84
	cmp r5, #0x1c
	bgt _08022F84
_08022F80:
	movs r5, #0xc
	b _08023012
_08022F84:
	movs r5, #0xb
	b _08023012
_08022F88:
	ldr r0, _08022F9C @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #0x1a
	bl __umodsi3
	adds r5, r0, #0
	cmp r5, #0xf
	bgt _08022FA0
_08022F98:
	movs r5, #0
	b _08023012
	.align 2, 0
_08022F9C: .4byte gUnknown_03004008
_08022FA0:
	cmp r5, #0x12
	ble _08022FAC
	cmp r5, #0x16
	bgt _08022FAC
_08022FA8:
	movs r5, #2
	b _08023012
_08022FAC:
	movs r5, #1
	b _08023012
_08022FB0:
	ldr r0, _08022FC8 @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #0x18
	bl __umodsi3
	adds r5, r0, #0
	cmp r5, #3
	ble _08022FD4
	cmp r5, #5
	bgt _08022FCC
	movs r5, #4
	b _08022FD6
	.align 2, 0
_08022FC8: .4byte gUnknown_03004008
_08022FCC:
	cmp r5, #0x15
	bgt _08022FD4
	movs r5, #5
	b _08022FD6
_08022FD4:
	movs r5, #3
_08022FD6:
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	subs r1, #8
	b _0802300C
_08022FDE:
	ldr r0, _08022FF4 @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #0x18
	bl __umodsi3
	adds r5, r0, #0
	cmp r5, #3
	bgt _08022FF8
	movs r5, #0xf
	b _08023006
	.align 2, 0
_08022FF4: .4byte gUnknown_03004008
_08022FF8:
	cmp r5, #5
	ble _08023004
	cmp r5, #0x15
	bgt _08023004
	movs r5, #0x11
	b _08023006
_08023004:
	movs r5, #0x10
_08023006:
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	subs r1, #0xc
_0802300C:
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r5, r5, r0
_08023012:
	lsls r0, r7, #0x10
	asrs r1, r0, #0x10
	adds r7, r0, #0
	cmp r1, #6
	ble _08023060
	ldr r2, _08023054 @ =gUnknown_03003F58
	mov r1, r8
	strh r1, [r2]
	strh r6, [r2, #2]
	strh r5, [r2, #4]
	movs r3, #0
	ldrsh r0, [r2, r3]
	movs r4, #0x80
	lsls r4, r4, #3
	adds r3, r4, #0
	adds r1, r6, #0
	orrs r1, r3
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r3, _08023058 @ =gUnknown_0848ABF4
	movs r4, #4
	ldrsh r2, [r2, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	ldr r3, _0802305C @ =0x00000365
	bl sub_0801BD00
	lsls r6, r6, #0x10
	mov r1, r8
	lsls r0, r1, #0x10
	b _080230A0
	.align 2, 0
_08023054: .4byte gUnknown_03003F58
_08023058: .4byte gUnknown_0848ABF4
_0802305C: .4byte 0x00000365
_08023060:
	add r2, sp, #8
	ldrh r1, [r2, #4]
	ldr r0, _080230B8 @ =0xFFFFFC00
	ands r0, r1
	ldr r3, _080230BC @ =0x00000365
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #4]
	ldrb r1, [r2, #5]
	movs r0, #0xf
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #5]
	mov r4, r8
	lsls r4, r4, #0x10
	mov r8, r4
	lsrs r0, r4, #0x10
	lsls r6, r6, #0x10
	lsrs r1, r6, #0x10
	ldr r3, _080230C0 @ =gUnknown_0848AE98
	lsls r2, r5, #2
	adds r2, r2, r3
	ldr r2, [r2]
	ldr r3, [sp, #8]
	ldr r4, [sp, #0xc]
	movs r5, #1
	str r5, [sp, #4]
	str r4, [sp]
	bl sub_0801C01C
	mov r0, r8
_080230A0:
	asrs r0, r0, #0x10
	asrs r1, r6, #0x10
	asrs r2, r7, #0x10
	bl sub_08022BB8
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080230B8: .4byte 0xFFFFFC00
_080230BC: .4byte 0x00000365
_080230C0: .4byte gUnknown_0848AE98

