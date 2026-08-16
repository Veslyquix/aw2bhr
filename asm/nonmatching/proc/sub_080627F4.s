	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080627F4
sub_080627F4: @ 0x080627F4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r3, #0
_08062808:
	ldr r0, _080628A0 @ =gUnknown_030033EC
	ldrh r1, [r0]
	ldr r0, _080628A4 @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x2c
	ldrb r0, [r0]
	mov sl, r0
	asrs r0, r3
	mov sl, r0
	movs r0, #1
	mov r1, sl
	ands r1, r0
	mov sl, r1
	ldr r2, [sp, #4]
	cmp r2, #1
	bne _0806283A
	adds r0, r3, #1
	str r0, [sp, #0x18]
	cmp r1, #1
	bne _0806283A
	b _08062AC6
_0806283A:
	ldr r1, [sp, #4]
	cmp r1, #0
	bne _0806284C
	adds r2, r3, #1
	str r2, [sp, #0x18]
	mov r0, sl
	cmp r0, #0
	bne _0806284C
	b _08062AC6
_0806284C:
	lsls r2, r3, #6
	adds r0, r2, #0
	adds r0, #0x40
	str r2, [sp, #0x10]
	adds r3, #1
	str r3, [sp, #0x18]
	cmp r2, r0
	blt _0806285E
	b _08062AC6
_0806285E:
	ldr r1, _080628A8 @ =gUnknown_08499594
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r1, [r1]
	adds r1, r1, r0
	str r1, [sp, #0xc]
	ldrb r0, [r1]
	adds r2, #1
	str r2, [sp, #0x14]
	cmp r0, #0
	bne _08062878
	b _08062ABA
_08062878:
	movs r1, #1
	str r1, [sp, #8]
_0806287C:
	ldr r1, _080628AC @ =gUnknown_085D5ABC
	ldr r0, [sp, #0xc]
	ldrb r2, [r0]
	movs r0, #0x5c
	muls r0, r2, r0
	adds r0, r0, r1
	ldrb r0, [r0, #0x1a]
	subs r0, #1
	adds r3, r2, #0
	cmp r0, #0x1f
	bls _08062894
	b _08062AAE
_08062894:
	lsls r0, r0, #2
	ldr r1, _080628B0 @ =_080628B4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080628A0: .4byte gUnknown_030033EC
_080628A4: .4byte gUnknown_08499598
_080628A8: .4byte gUnknown_08499594
_080628AC: .4byte gUnknown_085D5ABC
_080628B0: .4byte _080628B4
_080628B4: @ jump table
	.4byte _08062934 @ case 0
	.4byte _08062938 @ case 1
	.4byte _08062AAE @ case 2
	.4byte _0806293C @ case 3
	.4byte _08062AAE @ case 4
	.4byte _08062AAE @ case 5
	.4byte _08062AAE @ case 6
	.4byte _08062AAE @ case 7
	.4byte _08062AAE @ case 8
	.4byte _08062AAE @ case 9
	.4byte _08062AAE @ case 10
	.4byte _08062AAE @ case 11
	.4byte _08062AAE @ case 12
	.4byte _08062AAE @ case 13
	.4byte _08062AAE @ case 14
	.4byte _08062940 @ case 15
	.4byte _08062AAE @ case 16
	.4byte _08062AAE @ case 17
	.4byte _08062AAE @ case 18
	.4byte _08062AAE @ case 19
	.4byte _08062AAE @ case 20
	.4byte _08062AAE @ case 21
	.4byte _08062AAE @ case 22
	.4byte _08062AAE @ case 23
	.4byte _08062AAE @ case 24
	.4byte _08062AAE @ case 25
	.4byte _08062AAE @ case 26
	.4byte _08062AAE @ case 27
	.4byte _08062AAE @ case 28
	.4byte _08062AAE @ case 29
	.4byte _08062AAE @ case 30
	.4byte _08062944 @ case 31
_08062934:
	movs r4, #0
	b _08062946
_08062938:
	movs r4, #1
	b _08062946
_0806293C:
	movs r4, #2
	b _08062946
_08062940:
	movs r4, #3
	b _08062946
_08062944:
	movs r4, #4
_08062946:
	ldr r0, _08062A18 @ =gUnknown_030033EC
	ldrh r2, [r0]
	ldr r0, _08062A1C @ =gUnknown_08499598
	ldr r0, [r0]
	lsls r1, r2, #4
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #0x1d]
	ldrb r1, [r1, #0x1e]
	movs r2, #0
	str r2, [sp]
	ldr r2, [sp, #8]
	bl sub_08043070
	ldr r2, [sp, #0xc]
	ldrb r1, [r2, #4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	adds r6, r1, #0
	muls r6, r0, r6
	ldrb r0, [r2, #2]
	lsrs r5, r0, #2
	ldrb r0, [r2, #3]
	lsrs r3, r0, #2
	ldr r2, _08062A20 @ =gUnknown_085D5ABC
	ldr r0, [sp, #0xc]
	ldrb r1, [r0]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0, #0xe]
	cmp r0, #1
	bne _08062A28
	ldr r1, _08062A24 @ =gUnknown_0202DAD8
	mov r8, r1
	mov r2, sl
	lsls r0, r2, #2
	add r0, sl
	adds r0, r0, r4
	lsls r0, r0, #2
	mov ip, r0
	movs r0, #0x2c
	mov sb, r0
	mov r0, sb
	muls r0, r5, r0
	mov r1, ip
	adds r4, r1, r0
	lsls r0, r3, #5
	adds r0, r0, r3
	lsls r7, r0, #4
	adds r1, r4, r7
	add r1, r8
	ldr r0, [r1]
	adds r0, r0, r6
	str r0, [r1]
	cmp r3, #0
	ble _080629CE
	subs r0, r3, #1
	lsls r1, r0, #5
	adds r1, r1, r0
	lsls r1, r1, #4
	adds r1, r4, r1
	add r1, r8
	lsrs r2, r6, #1
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
_080629CE:
	cmp r3, #8
	bgt _080629E6
	adds r0, r3, #1
	lsls r1, r0, #5
	adds r1, r1, r0
	lsls r1, r1, #4
	adds r1, r4, r1
	add r1, r8
	lsrs r2, r6, #1
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
_080629E6:
	cmp r5, #0
	ble _080629FE
	subs r0, r5, #1
	mov r1, sb
	muls r1, r0, r1
	add r1, ip
	adds r1, r1, r7
	add r1, r8
	lsrs r2, r6, #1
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
_080629FE:
	cmp r5, #0xa
	bgt _08062AAE
	adds r0, r5, #1
	mov r1, sb
	muls r1, r0, r1
	add r1, ip
	adds r1, r1, r7
	add r1, r8
	lsrs r2, r6, #1
	ldr r0, [r1]
	adds r0, r0, r2
	b _08062AAC
	.align 2, 0
_08062A18: .4byte gUnknown_030033EC
_08062A1C: .4byte gUnknown_08499598
_08062A20: .4byte gUnknown_085D5ABC
_08062A24: .4byte gUnknown_0202DAD8
_08062A28:
	ldr r2, _08062AE0 @ =gUnknown_0202DAD8
	mov r8, r2
	mov r1, sl
	lsls r0, r1, #2
	add r0, sl
	adds r0, r0, r4
	lsls r0, r0, #2
	mov ip, r0
	movs r2, #0x2c
	mov sb, r2
	mov r0, sb
	muls r0, r5, r0
	mov r1, ip
	adds r4, r1, r0
	lsls r0, r3, #5
	adds r0, r0, r3
	lsls r7, r0, #4
	adds r1, r4, r7
	add r1, r8
	lsrs r2, r6, #2
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
	cmp r3, #0
	ble _08062A6C
	subs r0, r3, #1
	lsls r1, r0, #5
	adds r1, r1, r0
	lsls r1, r1, #4
	adds r1, r4, r1
	add r1, r8
	ldr r0, [r1]
	adds r0, r0, r6
	str r0, [r1]
_08062A6C:
	cmp r3, #8
	bgt _08062A82
	adds r0, r3, #1
	lsls r1, r0, #5
	adds r1, r1, r0
	lsls r1, r1, #4
	adds r1, r4, r1
	add r1, r8
	ldr r0, [r1]
	adds r0, r0, r6
	str r0, [r1]
_08062A82:
	cmp r5, #0
	ble _08062A98
	subs r0, r5, #1
	mov r1, sb
	muls r1, r0, r1
	add r1, ip
	adds r1, r1, r7
	add r1, r8
	ldr r0, [r1]
	adds r0, r0, r6
	str r0, [r1]
_08062A98:
	cmp r5, #0xa
	bgt _08062AAE
	adds r0, r5, #1
	mov r1, sb
	muls r1, r0, r1
	add r1, ip
	adds r1, r1, r7
	add r1, r8
	ldr r0, [r1]
	adds r0, r0, r6
_08062AAC:
	str r0, [r1]
_08062AAE:
	ldr r2, [sp, #8]
	adds r2, #1
	str r2, [sp, #8]
	cmp r2, #0x18
	bgt _08062ABA
	b _0806287C
_08062ABA:
	ldr r2, [sp, #0x14]
	ldr r0, [sp, #0x10]
	adds r0, #0x40
	cmp r2, r0
	bge _08062AC6
	b _0806285E
_08062AC6:
	ldr r3, [sp, #0x18]
	cmp r3, #3
	bgt _08062ACE
	b _08062808
_08062ACE:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08062AE0: .4byte gUnknown_0202DAD8

