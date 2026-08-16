	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08057270
sub_08057270: @ 0x08057270
	push {r4, r5, r6, lr}
	ldr r4, _080572C4 @ =gUnknown_08136164
	ldr r1, [r4]
	ldr r2, _080572C8 @ =0x00007F60
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _080572CC @ =gUnknown_03002B6C
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r3, #0
	strh r0, [r1]
	ldr r1, _080572D0 @ =gUnknown_03001FE8
	ldr r2, _080572D4 @ =0x00000505
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _080572D8 @ =gUnknown_0300450C
	ldrh r0, [r0]
	bl sub_0805741C
	ldr r1, _080572DC @ =gUnknown_08136168
	ldr r0, [r1]
	ldrb r3, [r0]
	movs r2, #1
	ands r2, r3
	adds r5, r4, #0
	adds r6, r1, #0
	cmp r2, #0
	bne _080572FC
	ldr r0, _080572E0 @ =gUnknown_03001FF8
	strh r2, [r0]
	ldr r0, _080572E4 @ =gUnknown_03001418
	strh r2, [r0]
	ldr r0, _080572E8 @ =gUnknown_03002B34
	strh r2, [r0]
	ldr r0, _080572EC @ =gUnknown_03002F18
	strh r2, [r0]
	ldr r0, _080572F0 @ =gUnknown_030030A0
	strh r2, [r0]
	ldr r0, _080572F4 @ =gUnknown_03002000
	strh r2, [r0]
	ldr r2, _080572F8 @ =gUnknown_0813616C
	b _08057312
	.align 2, 0
_080572C4: .4byte gUnknown_08136164
_080572C8: .4byte 0x00007F60
_080572CC: .4byte gUnknown_03002B6C
_080572D0: .4byte gUnknown_03001FE8
_080572D4: .4byte 0x00000505
_080572D8: .4byte gUnknown_0300450C
_080572DC: .4byte gUnknown_08136168
_080572E0: .4byte gUnknown_03001FF8
_080572E4: .4byte gUnknown_03001418
_080572E8: .4byte gUnknown_03002B34
_080572EC: .4byte gUnknown_03002F18
_080572F0: .4byte gUnknown_030030A0
_080572F4: .4byte gUnknown_03002000
_080572F8: .4byte gUnknown_0813616C
_080572FC:
	movs r0, #0x80
	ands r0, r3
	ldr r2, _08057398 @ =gUnknown_0813616C
	cmp r0, #0
	bne _08057312
	ldr r0, _0805739C @ =gUnknown_030030A0
	ldr r3, _080573A0 @ =0x0000FFF8
	adds r1, r3, #0
	strh r1, [r0]
	ldr r0, [r2]
	strh r1, [r0]
_08057312:
	ldr r0, _080573A4 @ =gUnknown_03001400
	movs r4, #0
	strh r4, [r0]
	ldr r0, [r2]
	strh r4, [r0]
	bl sub_0801237C
	ldr r2, [r5]
	ldrb r0, [r2, #1]
	movs r5, #0x20
	orrs r0, r5
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r0, _080573A8 @ =gUnknown_03002B40
	strb r4, [r0]
	ldr r1, _080573AC @ =gUnknown_03002B4C
	movs r0, #0x77
	strb r0, [r1]
	ldr r0, _080573B0 @ =gUnknown_03002EFC
	strb r4, [r0]
	ldr r0, _080573B4 @ =gUnknown_03002B44
	movs r2, #0xa0
	strb r2, [r0]
	ldr r1, _080573B8 @ =gUnknown_03002B68
	movs r0, #0x79
	strb r0, [r1]
	ldr r1, _080573BC @ =gUnknown_030024E4
	movs r0, #0xf0
	strb r0, [r1]
	ldr r0, _080573C0 @ =gUnknown_03002B30
	strb r4, [r0]
	ldr r0, _080573C4 @ =gUnknown_030020B8
	strb r2, [r0]
	ldr r4, _080573C8 @ =gUnknown_030030A4
	ldrb r0, [r4]
	movs r2, #1
	adds r3, r0, #0
	orrs r3, r2
	movs r1, #2
	orrs r3, r1
	strb r3, [r4]
	ldrb r0, [r4, #1]
	orrs r2, r0
	orrs r2, r1
	strb r2, [r4, #1]
	ldr r0, [r6]
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080573E0
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080573DA
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080573CC
	movs r0, #4
	orrs r3, r0
	movs r0, #0x10
	orrs r3, r0
	orrs r3, r5
	strb r3, [r4]
	b _080573E4
	.align 2, 0
_08057398: .4byte gUnknown_0813616C
_0805739C: .4byte gUnknown_030030A0
_080573A0: .4byte 0x0000FFF8
_080573A4: .4byte gUnknown_03001400
_080573A8: .4byte gUnknown_03002B40
_080573AC: .4byte gUnknown_03002B4C
_080573B0: .4byte gUnknown_03002EFC
_080573B4: .4byte gUnknown_03002B44
_080573B8: .4byte gUnknown_03002B68
_080573BC: .4byte gUnknown_030024E4
_080573C0: .4byte gUnknown_03002B30
_080573C4: .4byte gUnknown_030020B8
_080573C8: .4byte gUnknown_030030A4
_080573CC:
	movs r0, #8
	orrs r2, r0
	movs r0, #0x10
	orrs r2, r0
	orrs r2, r5
	strb r2, [r4, #1]
	b _080573E4
_080573DA:
	bl sub_080573F0
	b _080573E4
_080573E0:
	bl sub_080573F0
_080573E4:
	bl sub_080128D0
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

