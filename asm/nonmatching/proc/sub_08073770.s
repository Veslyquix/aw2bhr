	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08073770
sub_08073770: @ 0x08073770
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _080737C8 @ =gUnknown_0202FDE4
	ldr r0, _080737CC @ =gUnknown_0202F8DC
	str r0, [r1]
	movs r2, #0
	adds r4, r1, #0
	movs r3, #0
_08073780:
	ldr r1, [r4]
	lsls r0, r2, #1
	adds r0, r0, r1
	strh r3, [r0]
	adds r2, #1
	cmp r2, #0x9f
	ble _08073780
	movs r2, #0
	str r2, [r5, #0x58]
	ldr r3, _080737D0 @ =gUnknown_030030CC
	ldrb r1, [r3, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r3, #1]
	ldr r0, _080737D4 @ =gUnknown_03002B68
	strb r2, [r0]
	ldr r0, _080737D8 @ =gUnknown_03002B30
	strb r2, [r0]
	ldr r0, _080737DC @ =gUnknown_030024E4
	strb r2, [r0]
	ldr r1, _080737E0 @ =gUnknown_030020B8
	movs r0, #0xa0
	strb r0, [r1]
	ldr r1, _080737E4 @ =gUnknown_030030A4
	ldrb r0, [r1, #1]
	movs r2, #0x20
	orrs r0, r2
	strb r0, [r1, #1]
	ldr r1, _080737E8 @ =gUnknown_030030DC
	ldrb r0, [r1, #1]
	orrs r0, r2
	strb r0, [r1, #1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080737C8: .4byte gUnknown_0202FDE4
_080737CC: .4byte gUnknown_0202F8DC
_080737D0: .4byte gUnknown_030030CC
_080737D4: .4byte gUnknown_03002B68
_080737D8: .4byte gUnknown_03002B30
_080737DC: .4byte gUnknown_030024E4
_080737E0: .4byte gUnknown_030020B8
_080737E4: .4byte gUnknown_030030A4
_080737E8: .4byte gUnknown_030030DC

