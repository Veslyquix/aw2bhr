	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08060FFC
sub_08060FFC: @ 0x08060FFC
	push {r4, r5, r6, r7, lr}
	movs r5, #0xff
	movs r7, #0
	movs r6, #0
	movs r3, #1
	ldr r2, _08061038 @ =gUnknown_03004640
_08061008:
	lsls r0, r3, #1
	adds r1, r0, r2
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r5
	bge _0806101E
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	adds r7, r3, #0
_0806101E:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x18
	bls _08061008
	ldr r0, _0806103C @ =gUnknown_085766E0
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r5, r0
	ble _08061040
	movs r0, #0xff
	b _080610C0
	.align 2, 0
_08061038: .4byte gUnknown_03004640
_0806103C: .4byte gUnknown_085766E0
_08061040:
	movs r3, #1
	ldr r4, _08061074 @ =gUnknown_03004640
	ldr r2, _08061078 @ =gUnknown_030046E0
_08061046:
	lsls r0, r3, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r5, r0
	bne _08061060
	adds r0, r6, r2
	ldrb r1, [r0]
	strb r3, [r0]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_08061060:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x18
	bls _08061046
	cmp r6, #1
	bhi _0806107C
	ldr r0, _08061078 @ =gUnknown_030046E0
	ldrb r0, [r0]
	b _080610C0
	.align 2, 0
_08061074: .4byte gUnknown_03004640
_08061078: .4byte gUnknown_030046E0
_0806107C:
	movs r5, #0
	movs r3, #0
	cmp r3, r6
	bhs _080610BE
	ldr r0, _080610C8 @ =gUnknown_085766E0
	ldr r4, [r0]
	ldr r0, _080610CC @ =gUnknown_030046E0
	mov ip, r0
_0806108C:
	mov r0, ip
	adds r2, r3, r0
	ldrb r0, [r2]
	subs r0, #1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r4, r1
	ldrb r0, [r1, #0x1b]
	cmp r0, r5
	ble _080610B4
	ldrb r0, [r2]
	adds r7, r0, #0
	ldrb r1, [r2]
	subs r1, #1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r4, r0
	ldrb r5, [r0, #0x1b]
_080610B4:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r6
	blo _0806108C
_080610BE:
	adds r0, r7, #0
_080610C0:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080610C8: .4byte gUnknown_085766E0
_080610CC: .4byte gUnknown_030046E0

