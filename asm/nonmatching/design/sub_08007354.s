	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08007354
sub_08007354: @ 0x08007354
	push {r4, lr}
	ldr r4, _080073A4 @ =gUnknown_0200B0B0
	ldr r3, [r4]
	movs r0, #7
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bne _080073AC
	ldrh r1, [r3]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080073EC
	movs r0, #1
	orrs r0, r1
	strh r0, [r3]
	movs r1, #0x3a
	ldrsh r0, [r3, r1]
	adds r2, r0, #4
	cmp r2, #9
	ble _0800737E
	subs r2, r0, #6
_0800737E:
	ldr r1, _080073A8 @ =gUnknown_0200B0D0
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #4]
	strh r0, [r3, #0x2c]
	adds r0, r3, #0
	adds r0, #0x36
	ldrb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0x2e
	ldrb r1, [r1]
	adds r0, #0x30
	b _080073EA
	.align 2, 0
_080073A4: .4byte gUnknown_0200B0B0
_080073A8: .4byte gUnknown_0200B0D0
_080073AC:
	ldrh r1, [r3]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080073EC
	movs r0, #2
	orrs r0, r1
	strh r0, [r3]
	movs r1, #0x3a
	ldrsh r0, [r3, r1]
	adds r2, r0, #3
	cmp r2, #7
	ble _080073C8
	subs r2, r0, #5
_080073C8:
	ldr r1, _080073F4 @ =gUnknown_0200B0D0
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #4]
	strh r0, [r3, #0x26]
	adds r0, r3, #0
	adds r0, #0x38
	ldrb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0x2f
	ldrb r1, [r1]
	adds r0, #0x31
_080073EA:
	strb r1, [r0]
_080073EC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080073F4: .4byte gUnknown_0200B0D0

