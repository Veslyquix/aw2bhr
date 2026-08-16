	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806938C
sub_0806938C: @ 0x0806938C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r7, r0, #0
	ldr r2, _080694B0 @ =gUnknown_0202F204
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_080674F4
	str r0, [r7, #0x2c]
	ldr r2, _080694B4 @ =gUnknown_030030CC
	ldrb r0, [r2, #1]
	movs r5, #1
	orrs r0, r5
	movs r6, #2
	orrs r0, r6
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #4
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r4, _080694B8 @ =gUnknown_030030B4
	ldrb r2, [r4]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4]
	ldr r3, _080694BC @ =gUnknown_03001FE8
	ldrb r2, [r3]
	adds r0, r1, #0
	ands r0, r2
	orrs r0, r5
	strb r0, [r3]
	ldr r2, _080694C0 @ =gUnknown_03002B6C
	ldrb r0, [r2]
	ands r1, r0
	orrs r1, r6
	strb r1, [r2]
	ldr r2, _080694C4 @ =gUnknown_0300251C
	ldrb r0, [r2]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2]
	bl sub_08012358
	bl sub_08063994
	adds r0, r4, #0
	movs r1, #2
	bl sub_08012C48
	ldr r0, _080694C8 @ =gUnknown_08183B14
	ldr r1, _080694CC @ =gUnknown_08499580
	ldr r1, [r1]
	bl sub_08011CAC
	ldr r0, _080694D0 @ =gUnknown_08183C28
	movs r1, #0
	movs r2, #0x80
	bl sub_08013618
	ldr r0, _080694D4 @ =gUnknown_0823BDE0
	movs r1, #0
	movs r2, #0x20
	bl sub_08013618
	ldr r0, _080694D8 @ =gUnknown_0823A3D4
	ldr r1, _080694DC @ =0x06002800
	bl sub_08011CAC
	ldr r0, _080694E0 @ =gUnknown_08239FA4
	ldr r4, _080694E4 @ =gUnknown_08499578
	ldr r1, [r4]
	bl sub_08011CAC
	movs r2, #0
	ldr r5, _080694E8 @ =0x000003FF
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r3, r0, #0
_08069438:
	ldr r0, [r4]
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r6, [r1]
	adds r0, r3, r6
	strh r0, [r1]
	adds r2, #1
	cmp r2, r5
	ble _08069438
	bl sub_08013AEC
	bl sub_08013B0C
	bl sub_08013B1C
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_08072C40
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl sub_08072C40
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl sub_08072C40
	movs r2, #5
	rsbs r2, r2, #0
	movs r0, #0
	movs r1, #0
	adds r3, r7, #0
	bl sub_080677BC
	movs r0, #0xe0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #0xc0
	str r0, [sp, #8]
	adds r0, #0x40
	str r0, [sp, #0xc]
	movs r0, #0xc
	str r0, [sp, #0x10]
	str r7, [sp, #0x14]
	movs r0, #2
	movs r1, #1
	movs r2, #0
	movs r3, #0x88
	bl sub_080679D8
	add sp, #0x18
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080694B0: .4byte gUnknown_0202F204
_080694B4: .4byte gUnknown_030030CC
_080694B8: .4byte gUnknown_030030B4
_080694BC: .4byte gUnknown_03001FE8
_080694C0: .4byte gUnknown_03002B6C
_080694C4: .4byte gUnknown_0300251C
_080694C8: .4byte gUnknown_08183B14
_080694CC: .4byte gUnknown_08499580
_080694D0: .4byte gUnknown_08183C28
_080694D4: .4byte gUnknown_0823BDE0
_080694D8: .4byte gUnknown_0823A3D4
_080694DC: .4byte 0x06002800
_080694E0: .4byte gUnknown_08239FA4
_080694E4: .4byte gUnknown_08499578
_080694E8: .4byte 0x000003FF

