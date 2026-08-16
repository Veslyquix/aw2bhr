	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08073A00
sub_08073A00: @ 0x08073A00
	push {r4, lr}
	adds r3, r0, #0
	ldr r4, _08073AA4 @ =gUnknown_081CC030
	movs r2, #0
	ldr r0, [r4]
	movs r1, #0xa0
	lsls r1, r1, #1
_08073A0E:
	strh r2, [r0]
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bne _08073A0E
	ldr r0, _08073AA8 @ =gUnknown_0202F8DC
	movs r2, #0
	movs r1, #0xa0
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0xa0
	lsls r1, r1, #1
_08073A26:
	strh r2, [r0]
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bne _08073A26
	movs r0, #4
	rsbs r0, r0, #0
	str r0, [r3, #0x58]
	ldr r2, _08073AAC @ =gUnknown_0202FDDC
	ldr r1, _08073AB0 @ =gUnknown_0202FDE4
	ldr r0, [r4]
	str r0, [r1]
	str r0, [r2]
	ldr r1, _08073AB4 @ =gUnknown_0202FDE0
	movs r2, #0xa0
	lsls r2, r2, #2
	adds r0, r0, r2
	str r0, [r1]
	ldr r2, _08073AB8 @ =gUnknown_030030CC
	ldrb r0, [r2, #1]
	movs r3, #0x20
	orrs r0, r3
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	ldr r0, _08073ABC @ =gUnknown_03002B40
	movs r1, #0
	strb r1, [r0]
	ldr r0, _08073AC0 @ =gUnknown_03002EFC
	strb r1, [r0]
	ldr r0, _08073AC4 @ =gUnknown_03002B4C
	strb r1, [r0]
	ldr r0, _08073AC8 @ =gUnknown_03002B44
	movs r2, #0xa0
	strb r2, [r0]
	ldr r0, _08073ACC @ =gUnknown_03002B68
	strb r1, [r0]
	ldr r0, _08073AD0 @ =gUnknown_03002B30
	strb r1, [r0]
	ldr r0, _08073AD4 @ =gUnknown_030024E4
	strb r1, [r0]
	ldr r0, _08073AD8 @ =gUnknown_030020B8
	strb r2, [r0]
	ldr r1, _08073ADC @ =gUnknown_030030A4
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	ldrb r0, [r1, #1]
	orrs r0, r3
	strb r0, [r1, #1]
	ldr r1, _08073AE0 @ =gUnknown_030030DC
	ldrb r0, [r1, #1]
	orrs r0, r3
	strb r0, [r1, #1]
	ldr r0, _08073AE4 @ =sub_08073930
	bl sub_08063928
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073AA4: .4byte gUnknown_081CC030
_08073AA8: .4byte gUnknown_0202F8DC
_08073AAC: .4byte gUnknown_0202FDDC
_08073AB0: .4byte gUnknown_0202FDE4
_08073AB4: .4byte gUnknown_0202FDE0
_08073AB8: .4byte gUnknown_030030CC
_08073ABC: .4byte gUnknown_03002B40
_08073AC0: .4byte gUnknown_03002EFC
_08073AC4: .4byte gUnknown_03002B4C
_08073AC8: .4byte gUnknown_03002B44
_08073ACC: .4byte gUnknown_03002B68
_08073AD0: .4byte gUnknown_03002B30
_08073AD4: .4byte gUnknown_030024E4
_08073AD8: .4byte gUnknown_030020B8
_08073ADC: .4byte gUnknown_030030A4
_08073AE0: .4byte gUnknown_030030DC
_08073AE4: .4byte sub_08073930

