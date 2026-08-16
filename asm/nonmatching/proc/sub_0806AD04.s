	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806AD04
sub_0806AD04: @ 0x0806AD04
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r2, _0806ADC4 @ =gUnknown_085C77A0
	ldr r4, _0806ADC8 @ =gUnknown_0202F214
	ldrh r0, [r6, #0x2a]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r1, [r0]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0, #0x16]
	cmp r0, #0
	beq _0806ADB8
	ldr r0, _0806ADCC @ =gUnknown_0858175C
	adds r1, r6, #0
	bl Proc_Start
	adds r3, r0, #0
	ldrh r0, [r6, #0x2a]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r0, [r0]
	strh r0, [r3, #0x2a]
	ldrh r0, [r6, #0x2a]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	str r0, [r3, #0x4c]
	ldrh r1, [r6, #0x2c]
	movs r0, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #7
	adds r0, r3, #0
	adds r0, #0x52
	strh r1, [r0]
	ldrh r0, [r6, #0x2a]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r0, [r0, #2]
	lsrs r5, r0, #2
	movs r4, #0
	adds r2, r3, #0
	adds r2, #0x2c
	movs r7, #0xff
	mov r8, r2
_0806AD6C:
	adds r1, r2, r4
	ldrb r0, [r1]
	orrs r0, r7
	strb r0, [r1]
	adds r4, #1
	cmp r4, #2
	ble _0806AD6C
	movs r4, #3
	adds r7, r3, #0
	adds r7, #0x50
_0806AD80:
	cmp r4, #0
	beq _0806ADA2
	subs r4, #1
	adds r0, r5, #0
	movs r1, #0xa
	bl DivRem
	mov r2, r8
	adds r1, r2, r4
	strb r0, [r1]
	adds r0, r5, #0
	movs r1, #0xa
	bl Div
	adds r5, r0, #0
	cmp r5, #0
	bne _0806AD80
_0806ADA2:
	ldrh r1, [r6, #0x2c]
	movs r0, #1
	ands r0, r1
	adds r0, #1
	strh r0, [r7]
	ldrh r0, [r6, #0x2a]
	adds r0, #1
	strh r0, [r6, #0x2a]
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
_0806ADB8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806ADC4: .4byte gUnknown_085C77A0
_0806ADC8: .4byte gUnknown_0202F214
_0806ADCC: .4byte gUnknown_0858175C

